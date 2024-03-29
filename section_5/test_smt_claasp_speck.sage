from claasp.cipher_modules.models.smt.smt_models.smt_xor_differential_model import SmtXorDifferentialModel
from claasp.cipher_modules.models.utils import set_fixed_variables, integer_to_bit_list, to_bias_for_xor_linear_trail
from util import combine_list_of_dicts_and_list
from multiprocessing import Pool

import time
from importlib import import_module
import multiprocessing, logging
#logger = multiprocessing.log_to_stderr()
#logger.setLevel(multiprocessing.SUBDEBUG)



def get_cipher(creator_module):
    for name in creator_module.__dict__:
        if name != 'Cipher' and 'Cipher' in name:
            return creator_module.__dict__[name]
    return 0

def run_experiment(cipher_primitive, round, repetitions):
    M = SmtXorDifferentialModel(cipher_primitive)
    input_names = cipher_primitive.inputs
    fixed_values = []
    for input_name in input_names:
        if input_name == 'key':
            key_size = cipher_primitive.inputs_bit_size[input_names.index(input_name)]
            fixed_values.append(
                set_fixed_variables(
                    'key',
                    'equal',
                    range(key_size),
                    integer_to_bit_list(0, key_size, 'big')
                )
            )
        else:
            plaintext_size = cipher_primitive.inputs_bit_size[input_names.index(input_name)]
            fixed_values.append(
                set_fixed_variables(
                    'plaintext',
                    'not_equal',
                    range(plaintext_size),
                    integer_to_bit_list(0, plaintext_size, 'big')
                )
            )


    f = open(f"{str(cipher_primitive.id)}_{round}.claasp", "w+")
    for i in range(repetitions):
        result = M.find_lowest_weight_xor_differential_trail(fixed_values, solver_name="mathsat")
        result = {**result, **{"number_rounds": round}}
        f.write(str(result).replace("'", "\"")+"\n")
    f.close()
    return 0




if __name__ == '__main__':
    creator_filename = "speck_block_cipher"
    creator_module = import_module(f'.ciphers.block_ciphers.{creator_filename}', 'claasp')

    speck_primitives = [
        {'block_bit_size': 32, 'key_bit_size': 64},
        {'block_bit_size': 48, 'key_bit_size': 96},
        {'block_bit_size': 64, 'key_bit_size': 96},
        {'block_bit_size': 64, 'key_bit_size': 128},
    ]
    rounds = list(range(1, 3))
    speck_primitives_and_rounds = combine_list_of_dicts_and_list(speck_primitives, rounds)

    speck_primitives = []
    for cipher_instance in speck_primitives_and_rounds:
        cipher_module = get_cipher(creator_module)
        speck_primitives.append(
            [cipher_module(**cipher_instance), cipher_instance["number_of_rounds"]]
        )

    pool = Pool()
    results = []
    number_of_repetitions = 1
    for speck_primitive in speck_primitives:
        results.append(pool.apply_async(run_experiment, args=(speck_primitive[0], speck_primitive[1], number_of_repetitions)))
        #results.append(run_experiment(speck_primitive[0], speck_primitive[1], number_of_repetitions))
    pool.close()
    pool.join()
    join_results = [result.get() for result in results]

