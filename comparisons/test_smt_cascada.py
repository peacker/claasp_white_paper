from cascada.differential.difference import XorDiff
from cascada.smt.chsearch import ChModelAssertType, round_based_ch_search
from cascada.primitives import speck
from util import combine_two_list
from multiprocessing import Pool
import multiprocessing
import time


def run_experiment(speck_primitive_and_round_local, repetitions):

    speck_primitive = speck_primitive_and_round_local[0]

    primitive_name_list = (str(speck_primitive).split(".")[1]).split("_")

    round = speck_primitive_and_round_local[1]
    speck_instance = speck.get_Speck_instance(speck_primitive)
    assert_type = ChModelAssertType.ValidityAndWeight
    sum_in_sec = 0
    primitive_id = f"{primitive_name_list[0]}_p{primitive_name_list[1]}_k{primitive_name_list[2]}_o{primitive_name_list[1]}_r{round}"
    f = open(f"{primitive_id}.cascada", "w+")
    for i in range(repetitions):
        start_time = time.time()
        iterator = round_based_ch_search(
            speck_instance, round, round, XorDiff, assert_type, "btor",
            extra_chfinder_args={"exclude_zero_input_prop": True},
            extra_findnextchweight_args={"initial_weight": 0}
        )
        for (num_rounds, ch) in iterator:
            time_in_seconds = time.time() - start_time
            sum_in_sec += time_in_seconds
            f.write(f"{{\"cipher_id\": \"{primitive_id}\",  \"library\": \"cascada\", \"number_rounds\": {num_rounds}, \"XorDiff\": \"{ch.srepr()}\", \"time\": {time_in_seconds}}}\n")
    #f.write(f"\nnumber_rounds: {num_rounds}, XorDiff: {ch.srepr()}, time: {sum_in_sec*1.0/repetitions}")
    f.close()




if __name__ == '__main__':
    speck_primitives = [
        speck.SpeckInstance.speck_32_64,
        speck.SpeckInstance.speck_48_96,
        speck.SpeckInstance.speck_64_96,
        speck.SpeckInstance.speck_64_128
    ]
    rounds = list(range(1, 5))
    pool = Pool()
    results = []
    number_of_repetitions = 5
    speck_primitives_and_rounds = combine_two_list(speck_primitives, rounds)
    for speck_primitive_and_round in speck_primitives_and_rounds:
        results.append(pool.apply_async(run_experiment, args=(speck_primitive_and_round, number_of_repetitions)))
    pool.close()
    pool.join()
    join_results = [result.get() for result in results]
    print(join_results)

