from util import *
from claasp.cipher_modules.models.utils import set_fixed_variables, integer_to_bit_list
import numpy as np
from multiprocessing import Pool
import time
from importlib import import_module
import multiprocessing, logging

def write(result):
    f = open(f"/home/sage/docker_claasp_white_paper_experiments/claasp_technique_comparison", "a")
    for result in join_results:
        f.write(str(result).replace("'", "\"")+"\n")
    f.close()

def find_optimal_differential_trail(cipher,  scenario = "single-key", technique="SMT", solver="Cadical"):
    assert technique in ["SAT", "SMT", "MILP", "CP"], 'technique must be "SAT",  "SMT", "MILP" or "CP"'
    if technique == "SAT":
        from claasp.cipher_modules.models.sat.sat_models.sat_xor_differential_model import SatXorDifferentialModel
        model = SatXorDifferentialModel(cipher)
    elif technique == "SMT":
        from claasp.cipher_modules.models.smt.smt_models.smt_xor_differential_model import SmtXorDifferentialModel
        model = SmtXorDifferentialModel(cipher)
    elif technique == "MILP":
        from claasp.cipher_modules.models.milp.milp_models.milp_xor_differential_model import MilpXorDifferentialModel
        model = MilpXorDifferentialModel(cipher)
    elif technique == "CP":
        from claasp.cipher_modules.models.cp.cp_models.cp_xor_differential_trail_search_model import CpXorDifferentialTrailSearchModel
        model = CpXorDifferentialTrailSearchModel(cipher)
    fixed_values = []
    if scenario == "single-key":
    # Fix the key difference to be zero, and the plaintext difference to be non-zero.
        #fixed_values.append(set_fixed_variables('key', 'equal', list(range(128)), integer_to_bit_list(0, 128, 'big')))
        fixed_values.append(set_fixed_variables('plaintext', 'not_equal', list(range(128)), integer_to_bit_list(0, 128, 'big')))
    elif scenario == "related-key":
    # Fix the key difference to be non-zero
        fixed_values.append(set_fixed_variables('key', 'not_equal', list(range(128)), integer_to_bit_list(0, 128, 'big')))
    if technique=="SMT":
        write(
            {
                **model.find_lowest_weight_xor_differential_trail(fixed_values, solver_name="yices-smt2"),
                **{'technique': 'SMT'},
                **{'number_rounds': str(cipher.number_of_rounds)}
            }
        )
    elif technique=="CP":
        start_time = time.time()

        cp_result = (
            {
                **model.find_lowest_weight_xor_differential_trail(fixed_values, solver_name="Xor"),
                **{'technique': 'CP'}
            }
        )
        time_in_seconds = time.time() - start_time
        del cp_result["solving_time_seconds"]
        write({
            **cp_result,
            **{'solving_time_seconds': str(time_in_seconds)},
            **{'number_rounds': str(cipher.number_of_rounds)}
        })
    elif technique=="SAT":
        write(
            {
                **model.find_lowest_weight_xor_differential_trail(fixed_values, solver_name="cadical"),
                **{'technique': 'SAT'},
                **{'number_rounds': str(cipher.number_of_rounds)}
            }
        )
    elif technique=="MILP":
        write(
            {
                **model.find_lowest_weight_xor_differential_trail(fixed_values, solver_name="gurobi"),
                **{'technique': 'MILP'},
                **{'number_rounds': str(cipher.number_of_rounds)}
            }
        )
    else:
        return(model.find_lowest_weight_xor_differential_trail(fixed_values))


def get_cipher(creator_module):
    for name in creator_module.__dict__:
        if name != 'Cipher' and 'Cipher' in name:
            return creator_module.__dict__[name]
    return 0

if __name__ == '__main__':
    creator_filename = "ascon_permutation"
    creator_module = import_module(f'.ciphers.permutations.{creator_filename}', 'claasp')

    aes_primitives = [
        {'state_size': 4, 'word_size': 8},
    ]
    rounds = list(range(1, 3))
    aes_primitives_and_rounds = combine_list_of_dicts_and_list(aes_primitives, rounds)

    aes_primitives = []
    for cipher_instance in aes_primitives_and_rounds:
        cipher_module = get_cipher(creator_module)
        aes_primitives.append(
            [cipher_module(**cipher_instance), cipher_instance["number_of_rounds"]]
        )

    pool = Pool()
    results = []
    number_of_repetitions = 1
    for aes_primitive in aes_primitives:
        number_of_rounds = aes_primitive[1]
        results.append(
            pool.apply_async(find_optimal_differential_trail, args=(aes_primitive[0], "single-key", "SAT"))
        )
        results.append(
           pool.apply_async(find_optimal_differential_trail, args=(aes_primitive[0], "single-key", "CP"))
        )
        results.append(
            pool.apply_async(find_optimal_differential_trail, args=(aes_primitive[0], "single-key", "SMT"))
        )
        #print(find_optimal_differential_trail(speck_primitive[0], "single-key", "CP"))
    #print(results[2])
    pool.close()
    pool.join()
    join_results = [result.get() for result in results]
    f = open(f"/home/sage/docker_claasp_white_paper_experiments/claasp_technique_comparison", "a")
    for result in join_results:
        f.write(str(result).replace("'", "\"")+"\n")
    f.close()
    print(len(join_results))
    print(join_results)
