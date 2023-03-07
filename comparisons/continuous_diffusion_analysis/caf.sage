from importlib import import_module
import time


def get_creator(creator_module, creator_class_name):
    return creator_module.__dict__[creator_class_name]


def instantiate_cipher_from_creator(cipher_args, creator_filename, number_of_rounds):
    creator_module = ""
    if 'permutation' in creator_filename:
        creator_module = import_module(f'claasp.ciphers.permutations.{creator_filename}')
    if 'block_cipher' in creator_filename:
        creator_module = import_module(f'claasp.ciphers.block_ciphers.{creator_filename}')
    creator = get_creator(creator_module, cipher_args['class_name'])
    cipher_instance = creator(
        **{**cipher_args['params'], **{'number_of_rounds': number_of_rounds}}
    )
    return cipher_instance


def caf_on_cipher(speck_args, number_of_rounds, cipher_filename, number_of_samples):
    cipher_instance = instantiate_cipher_from_creator(speck_args, cipher_filename, number_of_rounds)
    caf = cipher_instance.continuous_avalanche_factor(0.001, number_of_samples)
    return caf


input_and_sizes = {
    'speck_block_cipher': {
        'params': {'block_bit_size': 128, 'key_bit_size': 128},
        'number_of_rounds': 15,
        'class_name': 'SpeckBlockCipher'
    },
    #'aes_block_cipher': {
    #    'params': {'word_size': 8, 'state_size': 4},
    #    'number_of_rounds': 8,
    #    'class_name': 'AESBlockCipher'
    #},
    'chacha_permutation': {
        'params': {},
        'number_of_rounds': 12,
        'class_name': 'ChachaPermutation'
    },
    'ascon_permutation': {
        'params': {},
        'number_of_rounds': 10,
        'class_name': 'AsconPermutation'
    }
}
file = open('caf_results', 'a')
for cipher_params_key in input_and_sizes:
    cipher_args = input_and_sizes[cipher_params_key]
    for number_of_samples in [8000]:
        for number_of_rounds in range(cipher_args['number_of_rounds'], cipher_args['number_of_rounds']+1):
            start_time = time.time()
            caf_cipher = caf_on_cipher(
                cipher_args, number_of_rounds, cipher_params_key, number_of_samples
            )
            end_time = time.time()
            elapsed_time = end_time - start_time
            caf_cipher = {
                **caf_cipher,
                **{'cipher_name': cipher_params_key}
            }
            caf_cipher = {
                **caf_cipher,
                **{'number_of_samples': number_of_samples}
            }
            caf_cipher = {
                **caf_cipher,
                **{'elapsed_time': float(f'{elapsed_time:.2f}')}
            }
            caf_cipher = {
                **caf_cipher,
                **{'user_time': float(f'{time.process_time():.2f}')}
            }
            caf_cipher = {
                **caf_cipher,
                **{'system_time': float(f'{time.process_time() - elapsed_time:.2f}')}
            }

            file.write(str(caf_cipher).replace("'", "\"")+"\n")
file.close()

# caf time x rounds 0.001 fixed number of samples = 1000


# caf time x samples 0.001









