#Example output: 
#========== Optimal differential trail for 5 rounds SPECK  ==========
#{'cipher_id': 'speck_p32_k64_o32_r5', 'model_type': 'xor_differential', 'solver_name': 'cryptominisat', 'solving_time_seconds': 0.6100000000000001, 'memory_megabytes': 7.648, 'components_values': {'plaintext': {'value': '02110a04', 'weight': 0, 'sign': 1}, 'key': {'value': '0000000000000000', 'weight': 0, 'sign': 1}, 'rot_0_0': {'value': '2204', 'weight': 0, 'sign': 1}, 'modadd_0_1': {'value': '2800', 'weight': 4, 'sign': 1}, 'xor_0_2': {'value': '2800', 'weight': 0, 'sign': 1}, 'rot_0_3': {'value': '2810', 'weight': 0, 'sign': 1}, 'xor_0_4': {'value': '0010', 'weight': 0, 'sign': 1}, 'intermediate_output_0_5': {'value': '0000', 'weight': 0, 'sign': 1}, 'intermediate_output_0_6': {'value': '28000010', 'weight': 0, 'sign': 1}, 'constant_1_0': {'value': '0000', 'weight': 0, 'sign': 1}, 'rot_1_1': {'value': '0000', 'weight': 0, 'sign': 1}, 'modadd_1_2': {'value': '0000', 'weight': 0, 'sign': 1}, 'xor_1_3': {'value': '0000', 'weight': 0, 'sign': 1}, 'rot_1_4': {'value': '0000', 'weight': 0, 'sign': 1}, 'xor_1_5': {'value': '0000', 'weight': 0, 'sign': 1}, 'rot_1_6': {'value': '0050', 'weight': 0, 'sign': 1}, 'modadd_1_7': {'value': '0040', 'weight': 2, 'sign': 1}, 'xor_1_8': {'value': '0040', 'weight': 0, 'sign': 1}, 'rot_1_9': {'value': '0040', 'weight': 0, 'sign': 1}, 'xor_1_10': {'value': '0000', 'weight': 0, 'sign': 1}, 'intermediate_output_1_11': {'value': '0000', 'weight': 0, 'sign': 1}, 'intermediate_output_1_12': {'value': '00400000', 'weight': 0, 'sign': 1}, 'constant_2_0': {'value': '0000', 'weight': 0, 'sign': 1}, 'rot_2_1': {'value': '0000', 'weight': 0, 'sign': 1}, 'modadd_2_2': {'value': '0000', 'weight': 0, 'sign': 1}, 'xor_2_3': {'value': '0000', 'weight': 0, 'sign': 1}, 'rot_2_4': {'value': '0000', 'weight': 0, 'sign': 1}, 'xor_2_5': {'value': '0000', 'weight': 0, 'sign': 1}, 'rot_2_6': {'value': '8000', 'weight': 0, 'sign': 1}, 'modadd_2_7': {'value': '8000', 'weight': 0, 'sign': 1}, 'xor_2_8': {'value': '8000', 'weight': 0, 'sign': 1}, 'rot_2_9': {'value': '0000', 'weight': 0, 'sign': 1}, 'xor_2_10': {'value': '8000', 'weight': 0, 'sign': 1}, 'intermediate_output_2_11': {'value': '0000', 'weight': 0, 'sign': 1}, 'intermediate_output_2_12': {'value': '80008000', 'weight': 0, 'sign': 1}, 'constant_3_0': {'value': '0000', 'weight': 0, 'sign': 1}, 'rot_3_1': {'value': '0000', 'weight': 0, 'sign': 1}, 'modadd_3_2': {'value': '0000', 'weight': 0, 'sign': 1}, 'xor_3_3': {'value': '0000', 'weight': 0, 'sign': 1}, 'rot_3_4': {'value': '0000', 'weight': 0, 'sign': 1}, 'xor_3_5': {'value': '0000', 'weight': 0, 'sign': 1}, 'rot_3_6': {'value': '0100', 'weight': 0, 'sign': 1}, 'modadd_3_7': {'value': '8100', 'weight': 1, 'sign': 1}, 'xor_3_8': {'value': '8100', 'weight': 0, 'sign': 1}, 'rot_3_9': {'value': '0002', 'weight': 0, 'sign': 1}, 'xor_3_10': {'value': '8102', 'weight': 0, 'sign': 1}, 'intermediate_output_3_11': {'value': '0000', 'weight': 0, 'sign': 1}, 'intermediate_output_3_12': {'value': '81008102', 'weight': 0, 'sign': 1}, 'constant_4_0': {'value': '0000', 'weight': 0, 'sign': 1}, 'rot_4_1': {'value': '0000', 'weight': 0, 'sign': 1}, 'modadd_4_2': {'value': '0000', 'weight': 0, 'sign': 1}, 'xor_4_3': {'value': '0000', 'weight': 0, 'sign': 1}, 'rot_4_4': {'value': '0000', 'weight': 0, 'sign': 1}, 'xor_4_5': {'value': '0000', 'weight': 0, 'sign': 1}, 'rot_4_6': {'value': '0102', 'weight': 0, 'sign': 1}, 'modadd_4_7': {'value': '8000', 'weight': 2, 'sign': 1}, 'xor_4_8': {'value': '8000', 'weight': 0, 'sign': 1}, 'rot_4_9': {'value': '040a', 'weight': 0, 'sign': 1}, 'xor_4_10': {'value': '840a', 'weight': 0, 'sign': 1}, 'intermediate_output_4_11': {'value': '0000', 'weight': 0, 'sign': 1}, 'cipher_output_4_12': {'value': '8000840a', 'weight': 0, 'sign': 1}}, 'total_weight': 9, 'status': 'SATISFIABLE', 'building_time_seconds': 0.0036935806274414062}
#========== Optimal related-key differential trail for 5 rounds SPECK  ==========
#{'cipher_id': 'speck_p32_k64_o32_r5', 'model_type': 'xor_differential_one_solution', 'solver_name': 'Chuffed', 'solving_time_seconds': 0.002, 'memory_megabytes': 0.28, 'components_values': {'plaintext': {'value': '0', 'weight': 0}, 'key': {'value': '40000000000000', 'weight': 0}, 'rot_0_0': {'value': '0', 'weight': 0}, 'modadd_0_1': {'value': '0', 'weight': 0}, 'xor_0_2': {'value': '0', 'weight': 0}, 'rot_0_3': {'value': '0', 'weight': 0}, 'xor_0_4': {'value': '0', 'weight': 0}, 'intermediate_output_0_5': {'value': '0', 'weight': 0}, 'intermediate_output_0_6': {'value': '0', 'weight': 0}, 'constant_1_0': {'value': '0', 'weight': 0}, 'rot_1_1': {'value': '0', 'weight': 0}, 'modadd_1_2': {'value': '0', 'weight': 0}, 'xor_1_3': {'value': '0', 'weight': 0}, 'rot_1_4': {'value': '0', 'weight': 0}, 'xor_1_5': {'value': '0', 'weight': 0}, 'rot_1_6': {'value': '0', 'weight': 0}, 'modadd_1_7': {'value': '0', 'weight': 0}, 'xor_1_8': {'value': '0', 'weight': 0}, 'rot_1_9': {'value': '0', 'weight': 0}, 'xor_1_10': {'value': '0', 'weight': 0}, 'intermediate_output_1_11': {'value': '0', 'weight': 0}, 'intermediate_output_1_12': {'value': '0', 'weight': 0}, 'constant_2_0': {'value': '0', 'weight': 0}, 'rot_2_1': {'value': '0', 'weight': 0}, 'modadd_2_2': {'value': '0', 'weight': 0}, 'xor_2_3': {'value': '0', 'weight': 0}, 'rot_2_4': {'value': '0', 'weight': 0}, 'xor_2_5': {'value': '0', 'weight': 0}, 'rot_2_6': {'value': '0', 'weight': 0}, 'modadd_2_7': {'value': '0', 'weight': 0}, 'xor_2_8': {'value': '0', 'weight': 0}, 'rot_2_9': {'value': '0', 'weight': 0}, 'xor_2_10': {'value': '0', 'weight': 0}, 'intermediate_output_2_11': {'value': '0', 'weight': 0}, 'intermediate_output_2_12': {'value': '0', 'weight': 0}, 'constant_3_0': {'value': '0', 'weight': 0}, 'rot_3_1': {'value': '8000', 'weight': 0}, 'modadd_3_2': {'value': '8000', 'weight': 0}, 'xor_3_3': {'value': '8000', 'weight': 0}, 'rot_3_4': {'value': '0', 'weight': 0}, 'xor_3_5': {'value': '8000', 'weight': 0}, 'rot_3_6': {'value': '0', 'weight': 0}, 'modadd_3_7': {'value': '0', 'weight': 0}, 'xor_3_8': {'value': '8000', 'weight': 0}, 'rot_3_9': {'value': '0', 'weight': 0}, 'xor_3_10': {'value': '8000', 'weight': 0}, 'intermediate_output_3_11': {'value': '8000', 'weight': 0}, 'intermediate_output_3_12': {'value': '80008000', 'weight': 0}, 'constant_4_0': {'value': '0', 'weight': 0}, 'rot_4_1': {'value': '0', 'weight': 0}, 'modadd_4_2': {'value': '8000', 'weight': 0}, 'xor_4_3': {'value': '8000', 'weight': 0}, 'rot_4_4': {'value': '2', 'weight': 0}, 'xor_4_5': {'value': '8002', 'weight': 0}, 'rot_4_6': {'value': '100', 'weight': 0}, 'modadd_4_7': {'value': '8100', 'weight': 100}, 'xor_4_8': {'value': '102', 'weight': 0}, 'rot_4_9': {'value': '2', 'weight': 0}, 'xor_4_10': {'value': '100', 'weight': 0}, 'intermediate_output_4_11': {'value': '8002', 'weight': 0}, 'cipher_output_4_12': {'value': '1020100', 'weight': 0}}, 'total_weight': '1.0', 'building_time_seconds': 0.0012655258178710938}
#========== Impossible single-key differentials for 6 rounds SPECK  ==========
#0x400000  =\=>  0x0  is an impossible differential.
#0x400000  =\=>  0x1  is an impossible differential.
#0x400000  =\=>  0xf  is an impossible differential.
#========== Differential  0x28000010  to  0x8000840a  for  4  rounds SPECK, with probability between the optimal 2^- 5  and 2^- 7 ==========
#10 solutions found, with a final probability of 2^-2.476438043942987





from util import *
from claasp.cipher_modules.models.utils import set_fixed_variables, integer_to_bit_list
import numpy as np

# Find an optimal differential trail, for cipher, in the scenario model ("single-key", "related-key") using technique ("SAT",  "SMT", "MILP" or "CP"), with solver.
# The list of supported solvers is:
# SAT : "Cadical", "Kissat", "Cryptominisat"
# SMT : "Yices", "Z3""
# MILP : "Gurobi"
# CP : "Chuffed", "Gecode", "or-tools"
def find_optimal_differential_trail(cipher, scenario = "single-key", technique="CP", solver="Chuffed"):
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
        #from claasp.cipher_modules.models.minizinc.minizinc_models.minizinc_xor_differential_model import MinizincXorDifferentialModel
        #model = MinizincXorDifferentialModel(cipher)
        from claasp.cipher_modules.models.cp.cp_models.cp_xor_differential_trail_search_model import CpXorDifferentialTrailSearchModel
        model = CpXorDifferentialTrailSearchModel(cipher)
    fixed_values = []
    if scenario == "single-key":
    # Fix the key difference to be zero, and the plaintext difference to be non-zero.
        fixed_values.append(set_fixed_variables('key', 'equal', list(range(64)), integer_to_bit_list(0, 64, 'big')))
        fixed_values.append(set_fixed_variables('plaintext', 'not_equal', list(range(32)), integer_to_bit_list(0, 32, 'big')))
    elif scenario == "related-key":
    # Fix the key difference to be non-zero
        fixed_values.append(set_fixed_variables('key', 'not_equal', list(range(64)), integer_to_bit_list(0, 64, 'big')))
    print(model.find_lowest_weight_xor_differential_trail(fixed_values))

def estimate_differential_probability(cipher, input_difference, output_difference, min_weight, max_weight, technique="CP", solver="Chuffed"):
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
        #from claasp.cipher_modules.models.minizinc.minizinc_models.minizinc_xor_differential_model import MinizincXorDifferentialModel
        #model = MinizincXorDifferentialModel(cipher)
        from claasp.cipher_modules.models.cp.cp_models.cp_xor_differential_trail_search_model import CpXorDifferentialTrailSearchModel
        model = CpXorDifferentialTrailSearchModel(cipher)
    last_component_id = get_cipher_output_component_name(cipher)
    fixed_values = []
    fixed_values.append(set_fixed_variables('key', 'equal', list(range(64)), integer_to_bit_list(0, 64, 'big')))
    fixed_values.append(set_fixed_variables('plaintext', 'equal', list(range(32)), integer_to_bit_list(input_difference, 32, 'big')))
    fixed_values.append(set_fixed_variables('last_component_id', 'equal', list(range(32)), integer_to_bit_list(output_difference, 32, 'big')))
    solutions = model.find_all_xor_differential_trails_with_weight_at_most(min_weight, max_weight, fixed_values)
    weights = [x['total_weight'] for x in solutions]
    sum_of_probs = np.log2(np.sum([2**-x for x in weights]))
    print(f'{len(weights)} solutions found, with a final probability of 2^{sum_of_probs}')
    return(solutions)

def find_impossible_differential_trail(cipher, scenario = "single-key", technique="CP", solver="Chuffed"):
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
        #from claasp.cipher_modules.models.minizinc.minizinc_models.minizinc_xor_differential_model import MinizincXorDifferentialModel
        #model = MinizincXorDifferentialModel(cipher)
        from claasp.cipher_modules.models.cp.cp_models.cp_xor_differential_trail_search_model import CpXorDifferentialTrailSearchModel
        model = CpXorDifferentialTrailSearchModel(cipher)
    # Extract cipher output component id
    last_component_id = get_cipher_output_component_name(cipher)
    if scenario == "single-key":
        # Fix the key difference to be zero, and the plaintext difference to be non-zero.
        for input_bit_position in range(32):
            for output_bit_position in range(32):
                fixed_values = []
                fixed_values.append(set_fixed_variables('key', 'equal', list(range(64)), integer_to_bit_list(0, 64, 'big')))
                fixed_values.append(set_fixed_variables('plaintext', 'equal', list(range(32)), integer_to_bit_list(1<<input_bit_position, 32, 'big')))
                fixed_values.append(set_fixed_variables(last_component_id, 'equal', list(range(32)), integer_to_bit_list(1<<output_bit_position, 32, 'big')))
                solution = model.find_one_xor_differential_trail(fixed_values)
                if solution['status'] == "UNSATISFIABLE":
                    print(hex(1<<input_bit_position), " =\=> ", hex(output_bit_position), " is an impossible differential.")
    elif scenario == "related-key":
        for input_bit_position in range(64+32):
            for output_bit_position in range(32):
                fixed_values = []
                if input_bit_position<32:
                    fixed_values.append(set_fixed_variables('key', 'equal', list(range(64)), integer_to_bit_list(0, 64, 'big')))
                    fixed_values.append(set_fixed_variables('plaintext', 'equal', list(range(32)), integer_to_bit_list(1<<input_bit_position, 32, 'big')))
                else:
                    fixed_values.append(set_fixed_variables('key', 'equal', list(range(64)), integer_to_bit_list(1<<(input_bit_position-32), 64, 'big')))
                    fixed_values.append(set_fixed_variables('plaintext', 'equal', list(range(32)), integer_to_bit_list(0, 32, 'big')))
                fixed_values.append(set_fixed_variables(last_component_id, 'equal', list(range(32)), integer_to_bit_list(1<<output_bit_position, 32, 'big')))
                solution = model.find_one_xor_differential_trail(fixed_values)
                if solution['status'] == "UNSATISFIABLE":
                    print(hex(1<<input_bit_position), " =\=> ", hex(output_bit_position), " is an impossible differential.")





print("="*10,  "Optimal differential trail for 5 rounds SPECK ", "="*10)
# Obtain a 5-round instance of Speck3264
speck = load_speck3264(_number_of_rounds = 5)
# Search with SAT
find_optimal_differential_trail(speck, technique = "SAT")
#
print("="*10,  "Optimal related-key differential trail for 5 rounds SPECK ", "="*10)
# Obtain a 5-round instance of Speck3264
speck = load_speck3264(_number_of_rounds = 5)
# Search with CP
find_optimal_differential_trail(speck, scenario = "related-key", technique = "CP")

print("="*10,  "Impossible single-key differentials for 6 rounds SPECK ", "="*10)
# Obtain a 5-round instance of Speck3264
speck = load_speck3264(_number_of_rounds = 6)
# Search with SAT
find_impossible_differential_trail(speck, scenario = "single-key", technique = "SAT")

min_weight = 5
max_weight = 7
input_difference =  0x28000010
output_difference = 0x8000840A
nr = 4
print("="*10,  "Differential ", hex(input_difference), " to ", hex(output_difference), " for ", nr, " rounds SPECK, with probability between the optimal 2^-", min_weight, " and 2^-", max_weight, "="*10)
# Obtain a 5-round instance of Speck3264
speck = load_speck3264(_number_of_rounds = nr)
# Search with SAT
estimate_differential_probability(speck, input_difference = input_difference, output_difference = output_difference, min_weight=min_weight, max_weight = max_weight, technique = "SAT")
