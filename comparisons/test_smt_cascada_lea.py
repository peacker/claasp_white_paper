from cascada.differential.difference import XorDiff
from cascada.smt.chsearch import ChModelAssertType, round_based_ch_search
from cascada.primitives import lea
from util import combine_two_list
from multiprocessing import Pool
import multiprocessing
import time


def run_experiment(lea_primitive_and_round_local, repetitions, solver_name):

    lea_primitive = lea_primitive_and_round_local[0]

    primitive_name_list = (str(lea_primitive).split("."))
    round = lea_primitive_and_round_local[1]
    lea_instance = lea_primitive#lea.get_Speck_instance(lea_primitive)
    assert_type = ChModelAssertType.ValidityAndWeight
    sum_in_sec = 0
    primitive_id = f"{primitive_name_list[2]}_p512_k512_o512_r{round}"
    f = open(f"{primitive_id}.cascada", "w+")
    for i in range(repetitions):
        start_time = time.time()
        iterator = round_based_ch_search(
            lea_instance, round, round, XorDiff, assert_type, solver_name,
            extra_chfinder_args={"exclude_zero_input_prop": True},
            extra_findnextchweight_args={"initial_weight": 0}
        )
        for (num_rounds, ch) in iterator:
            time_in_seconds = time.time() - start_time
            sum_in_sec += time_in_seconds
            f.write(f"{{\"cipher_id\": \"{primitive_id}\",  \"library\": \"cascada\", \"number_rounds\": {num_rounds}, \"XorDiff\": \"{ch.srepr()}\", \"solver_name\": \"{solver_name}\", \"time\": {time_in_seconds}}}\n")
    f.close()




if __name__ == '__main__':
    lea_primitives = [
        lea.LEACipher,
    ]
    solver_name = "msat"
    rounds = list(range(1, 3))
    results = []
    number_of_repetitions = 2
    lea_primitives_and_rounds = combine_two_list(lea_primitives, rounds)
    for lea_primitive_and_round in lea_primitives_and_rounds:
        #results.append(pool.apply_async(run_experiment, args=(lea_primitive_and_round, number_of_repetitions, solver_name)))
        results.append(run_experiment(lea_primitive_and_round, number_of_repetitions, solver_name))
    print(results)
