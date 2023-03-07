import itertools
import copy


def combine_two_list(list_1, list_2):
    unique_combinations = []
    for element in itertools.product(list_1, list_2):
        unique_combinations.append(element)
    return unique_combinations

def combine_list_of_dicts_and_list(list_1, list_2):
    unique_combinations = []
    for element in itertools.product(list_1, list_2):
        element[0]["number_of_rounds"] = element[1]
        unique_combinations.append(copy.deepcopy(element[0]))

    return unique_combinations