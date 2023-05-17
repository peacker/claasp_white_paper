

from claasp.cipher_modules.models.sat.sat_models.sat_xor_linear_model import SatXorLinearModel
from claasp.cipher_modules.models.utils import set_fixed_variables
from claasp.ciphers.permutations.salsa_permutation import SalsaPermutation

salsa6 = SalsaPermutation(number_of_rounds=6, start_round='even')

sat6 = SatXorLinearModel(salsa6)
bit_values = [0 for i in range(512)]
bit_values[4*32+31-7] = 1

plaintext = set_fixed_variables(
        component_id='plaintext',
        constraint_type='equal',
        bit_positions=range(512),
        bit_values=bit_values)

assert sat6.find_one_xor_linear_trail_with_fixed_weight(31, fixed_values=[plaintext], solver_name='kissat')["status"] == 'SATISFIABLE'
assert sat6.find_one_xor_linear_trail_with_fixed_weight(30, fixed_values=[plaintext], solver_name='kissat')["status"] == 'UNSATISFIABLE'
