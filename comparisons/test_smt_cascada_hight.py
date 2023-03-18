from cascada.differential.difference import XorDiff
from cascada.smt.chsearch import ChModelAssertType, round_based_ch_search
from cascada.primitives import hight
from util import combine_two_list
from multiprocessing import Pool
import multiprocessing
import time


def run_experiment(chacha_primitive_and_round_local, repetitions, solver_name):

    chacha_primitive = chacha_primitive_and_round_local[0]

    primitive_name_list = (str(chacha_primitive).split("."))
    round = chacha_primitive_and_round_local[1]
    chacha_instance = chacha_primitive#chacha.get_Speck_instance(chacha_primitive)
    assert_type = ChModelAssertType.ValidityAndWeight
    sum_in_sec = 0
    #primitive_id = f"{primitive_name_list[0]}_p{primitive_name_list[1]}_k{primitive_name_list[2]}_o{primitive_name_list[1]}_r{round}"
    primitive_id = f"{primitive_name_list[2]}_p64_k128_o64_r{round}"
    f = open(f"{primitive_id}.cascada", "w+")
    for i in range(repetitions):
        start_time = time.time()
        iterator = round_based_ch_search(
            chacha_instance, round, round, XorDiff, assert_type, solver_name,
            extra_chfinder_args={"exclude_zero_input_prop": True},
            extra_findnextchweight_args={"initial_weight": 0}
        )
        for (num_rounds, ch) in iterator:
            time_in_seconds = time.time() - start_time
            sum_in_sec += time_in_seconds
            f.write(f"{{\"cipher_id\": \"{primitive_id}\",  \"library\": \"cascada\", \"number_rounds\": {num_rounds}, \"XorDiff\": \"{ch.srepr()}\", \"solver_name\": \"{solver_name}\", \"time\": {time_in_seconds}}}\n")
    #f.write(f"\nnumber_rounds: {num_rounds}, XorDiff: {ch.srepr()}, time: {sum_in_sec*1.0/repetitions}")
    f.close()




if __name__ == '__main__':
    chacha_primitives = [
        hight.HightCipher,
    ]
    solver_name = "msat"
    rounds = list(range(8, 9))
    #pool = Pool()
    results = []
    number_of_repetitions = 3
    chacha_primitives_and_rounds = combine_two_list(chacha_primitives, rounds)
    for chacha_primitive_and_round in chacha_primitives_and_rounds:
        #results.append(pool.apply_async(run_experiment, args=(chacha_primitive_and_round, number_of_repetitions, solver_name)))
        results.append(run_experiment(chacha_primitive_and_round, number_of_repetitions, solver_name))
    #pool.close()
    #pool.join()
    #join_results = [result.get() for result in results]
    #print(join_results)
