# For instance, the CAF can be evaluated on 8 rounds
# of Speck128-128, using 10,000 random samples and a Euclidean distance of 0.001
# on each input bit, as follows:

from claasp.ciphers.block_ciphers.speck_block_cipher import SpeckBlockCipher
speck_cipher = SpeckBlockCipher(number_of_rounds=9, block_bit_size=128, key_bit_size=128)
caf = speck_cipher.continuous_avalanche_factor(0.001, 10000)
print(caf['plaintext']['cipher_output']['continuous_avalanche_factor']['values'][0]['value'])
0.067