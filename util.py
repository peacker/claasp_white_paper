
def load_speck3264(_number_of_rounds=22):
    from claasp.ciphers.block_ciphers.speck_block_cipher import SpeckBlockCipher
    return SpeckBlockCipher(number_of_rounds=_number_of_rounds)

def get_cipher_output_component_name(cipher):
    last_component = cipher.get_all_components()[-1]
    return last_component.id

