# Please run under the root directory

# This import the NIST STS class from statistical_tests module
# For dieharder, please import the DieharderTests as StatisticalTests from claasp.cipher_modules.statistical_tests.dieharder_statistical_tests
from claasp.cipher_modules.statistical_tests.nist_statistical_tests import StatisticalTests as StatisticalTests
import math

CIPHERS = [
    # list of primitives parameters to run the test
    # block_ciphers
    {"cipher_name": "claasp.ciphers.block_ciphers.skinny_block_cipher.SkinnyBlockCipher",
     "parameters": {'block_bit_size': 128, 'key_bit_size': 384, 'number_of_rounds': 40}},
    {"cipher_name": "claasp.ciphers.block_ciphers.aes_block_cipher.AESBlockCipher",
     "parameters": {'word_size': 8, 'state_size': 4, 'number_of_rounds': 10}},
    {"cipher_name": "claasp.ciphers.block_ciphers.hight_block_cipher.HightBlockCipher",
     "parameters": {'block_bit_size': 64, 'key_bit_size': 128, 'number_of_rounds': 32}},
    {"cipher_name": "claasp.ciphers.block_ciphers.lea_block_cipher.LeaBlockCipher",
     "parameters": {'block_bit_size': 128, 'key_bit_size': 128, 'number_of_rounds': 24}},
    {"cipher_name": "claasp.ciphers.block_ciphers.lowmc_block_cipher.LowMCBlockCipher",
     "parameters": {'block_bit_size': 128, 'key_bit_size': 128, 'number_of_rounds': 20, 'number_of_sboxes': 10}},
    {"cipher_name": "claasp.ciphers.block_ciphers.midori_block_cipher.MidoriBlockCipher",
     "parameters": {'block_bit_size': 128, 'key_bit_size': 128, 'number_of_rounds': 20}},
    {"cipher_name": "claasp.ciphers.block_ciphers.simon_block_cipher.SimonBlockCipher",
     "parameters": {'block_bit_size': 128, 'key_bit_size': 128, 'number_of_rounds': 68}},
    {"cipher_name": "claasp.ciphers.block_ciphers.speck_block_cipher.SpeckBlockCipher",
     "parameters": {'block_bit_size': 128, 'key_bit_size': 128, 'number_of_rounds': 32}},
    {"cipher_name": "claasp.ciphers.block_ciphers.raiden_block_cipher.RaidenBlockCipher",
     "parameters": {'block_bit_size': 64, 'key_bit_size': 128, 'number_of_rounds': 16}},
    {"cipher_name": "claasp.ciphers.block_ciphers.sparx_block_cipher.SparxBlockCipher",
     "parameters": {'block_bit_size': 128, 'key_bit_size': 128, 'number_of_rounds': 8, 'steps': 4}},
    {"cipher_name": "claasp.ciphers.block_ciphers.tea_block_cipher.TeaBlockCipher",
     "parameters": {'block_bit_size': 64, 'key_bit_size': 128, 'number_of_rounds': 32}},
    {"cipher_name": "claasp.ciphers.block_ciphers.xtea_block_cipher.XTeaBlockCipher",
     "parameters": {'block_bit_size': 64, 'key_bit_size': 128, 'number_of_rounds': 32}},
    {"cipher_name": "claasp.ciphers.block_ciphers.threefish_block_cipher.ThreefishBlockCipher",
     "parameters": {'block_bit_size': 256, 'key_bit_size': 256, 'tweak_bit_size': 128, 'number_of_rounds': 72}},
    # permutations
    {"cipher_name": "claasp.ciphers.permutations.ascon_permutation.AsconPermutation",
     "parameters": {'number_of_rounds': 12}},
    {"cipher_name": "claasp.ciphers.permutations.gift_permutation.GiftPermutation",
     "parameters": {'number_of_rounds': 40}},
    {"cipher_name": "claasp.ciphers.permutations.keccak_permutation.KeccakPermutation",
     "parameters": {'number_of_rounds': 18, 'word_size': 8}},
    {"cipher_name": "claasp.ciphers.permutations.photon_permutation.PhotonPermutation",
     "parameters": {'t': 256}},
    {"cipher_name":
         "claasp.ciphers.permutations.spongent_pi_precomputation_permutation.SpongentPiPrecomputationPermutation",
     "parameters": {'state_bit_size': 160, 'number_of_rounds': 80}},
    {"cipher_name":
         "claasp.ciphers.permutations.tinyjambu_32bits_word_permutation.TinyJambuWordBasedPermutation",
     "parameters": {'key_bit_size': 128, 'number_of_rounds': 1024}},
    {"cipher_name": "claasp.ciphers.permutations.xoodoo_permutation.XoodooPermutation",
     "parameters": {'number_of_rounds': 12}},
    {"cipher_name": "claasp.ciphers.permutations.sparkle_permutation.SparklePermutation",
     "parameters": {'number_of_blocks': 4, 'number_of_steps': 10}},
    {"cipher_name": "claasp.ciphers.permutations.gimli_permutation.GimliPermutation",
     "parameters": {'number_of_rounds': 24, 'word_size': 32}},
    {"cipher_name": "claasp.ciphers.permutations.grain_core_permutation.GrainCorePermutation",
     "parameters": {'number_of_rounds': 160}},
    {"cipher_name": "claasp.ciphers.permutations.chacha_permutation.ChachaPermutation",
     "parameters": {'number_of_rounds': 20}},
    # hash_functions
    {"cipher_name": "claasp.ciphers.hash_functions.sha1_hash_function.SHA1HashFunction",
     "parameters": {'word_size': 32, 'number_of_rounds': 80}},
    {"cipher_name": "claasp.ciphers.hash_functions.sha2_hash_function.SHA2HashFunction",
     "parameters": {'output_bit_size': 256, 'number_of_rounds': 64}},
    {"cipher_name": "claasp.ciphers.hash_functions.md5_hash_function.MD5HashFunction",
     "parameters": {"word_size": 32, "number_of_rounds": 64}},
    {"cipher_name": "claasp.ciphers.hash_functions.blake_hash_function.BlakeHashFunction",
     "parameters": {'block_bit_size': 512, 'state_bit_size': 512, 'number_of_rounds': 28}},
    {"cipher_name": "claasp.ciphers.hash_functions.blake2_hash_function.Blake2HashFunction",
     "parameters": {'block_bit_size': 1024, 'state_bit_size': 1024, 'number_of_rounds': 12}},

]

def get_class(class_string):
    parts = class_string.split('.')
    module_name = ".".join(parts[:-1])
    m = __import__(module_name)
    for comp in parts[1:]:
        m = getattr(m, comp)
    return m

def run_statistical_test(sts):
    for i in range(len(sts.cipher.inputs)):
        # run avalanche dataset
        seq_size = 1048576
        seq_lines = 384
        sample_size = sts.cipher.inputs_bit_size[i] * sts.cipher.output_bit_size
        number_of_samples_in_one_line = math.ceil(seq_size / sample_size)
        sts.run_avalanche_nist_statistics_test(input_index=i,
                                               number_of_samples_in_one_line=number_of_samples_in_one_line,
                                               number_of_lines=seq_lines)

        # run correlation dataset
        seq_size = 1040384
        seq_lines = 128
        if sts.cipher.inputs_bit_size[i] == sts.cipher.output_bit_size:
            number_of_samples_in_one_line = 1
            number_of_blocks_in_one_sample = math.ceil(seq_size / sts.cipher.output_bit_size)
            sts.run_correlation_nist_statistics_test(input_index=i,
                                                     number_of_samples_in_one_line=number_of_samples_in_one_line,
                                                     number_of_lines=seq_lines,
                                                     number_of_blocks_in_one_sample=number_of_blocks_in_one_sample)

        # # run CBC dataset
        seq_size = 1048576
        seq_lines = 300
        if len(sts.cipher.inputs) > 1 and sts.cipher.inputs_bit_size[i] == sts.cipher.output_bit_size:
            number_of_samples_in_one_line = 1
            number_of_blocks_in_one_sample = math.ceil(seq_size / sts.cipher.output_bit_size)
            sts.run_CBC_nist_statistics_test(input_index=i,
                                             number_of_samples_in_one_line=number_of_samples_in_one_line,
                                             number_of_lines=seq_lines,
                                             number_of_blocks_in_one_sample=number_of_blocks_in_one_sample)

        # run random dataset
        seq_size = 1040384
        seq_lines = 128
        number_of_samples_in_one_line = 1
        number_of_blocks_in_one_sample = math.ceil(seq_size / sts.cipher.output_bit_size)
        sts.run_random_nist_statistics_test(input_index=i,
                                            number_of_samples_in_one_line=number_of_samples_in_one_line,
                                            number_of_lines=seq_lines,
                                            number_of_blocks_in_one_sample=number_of_blocks_in_one_sample)

        # run low_density and high_density dataset
        if len(sts.cipher.inputs) > 1:
            number_of_samples_in_one_line = 1
            seq_size = 1056896
            seq_lines = 128
            number_of_blocks_in_one_sample = math.ceil(seq_size / sts.cipher.output_bit_size)
            n = sts.cipher.inputs_bit_size[i]
            ratio = (number_of_blocks_in_one_sample - 1 - n) / math.comb(n, 2)
            if ratio > 1:
                ratio = 1
            sts.run_low_density_nist_statistics_test(input_index=i,
                                                     number_of_samples_in_one_line=number_of_samples_in_one_line,
                                                     number_of_lines=seq_lines,
                                                     ratio=ratio)
            sts.run_high_density_nist_statistics_test(input_index=i,
                                                      number_of_samples_in_one_line=number_of_samples_in_one_line,
                                                      number_of_lines=seq_lines,
                                                      ratio=ratio)

# read parameters from the list
for cipher in CIPHERS:
    cipher_name = cipher["cipher_name"]
    cipher_creator = get_class(cipher_name)
    cipher_parameters = cipher["parameters"]
    # create a cipher instance according to the parameters
    cipher_instance = cipher_creator(**cipher_parameters)
    # base on the cipher instance, create its statistical tests analysis instance
    sts = StatisticalTests(cipher)
    run_statistical_test(sts)
