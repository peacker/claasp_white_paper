from claasp.ciphers.block_ciphers.speck_block_cipher import SpeckBlockCipher
from claasp.cipher_modules.models.sat.sat_models.sat_xor_differential_model import SatXorDifferentialModel
from claasp.cipher_modules.models.utils import set_fixed_variables, integer_to_bit_list
speck = SpeckBlockCipher(block_bit_size=128, key_bit_size=128, number_of_rounds=10)
sat = SatXorDifferentialModel(speck)
plaintext = set_fixed_variables(
    component_id='plaintext',
    constraint_type='not_equal',
    bit_positions=range(128),
    bit_values=integer_to_bit_list(0, 128, 'big'))
key = set_fixed_variables(
    component_id='key',
    constraint_type='equal',
    bit_positions=range(128),
    bit_values=(0,) * 128)
sat.build_xor_differential_trail_model(48, fixed_variables=[plaintext, key])
print(sat._solve_with_external_sat_solver("xor_differential", "parkissat", ["-c=125"]))
