# For instance, the CAF can be evaluated on 8 rounds
# of Speck128-128, using 10,000 random samples and a Euclidean distance of 0.001
# on each input bit, as follows:

from claasp.ciphers.block_ciphers.speck_block_cipher import SpeckBlockCipher
speck_cipher = SpeckBlockCipher(number_of_rounds=9, block_bit_size=128, key_bit_size=128)
caf = speck_cipher.continuous_avalanche_factor(0.001, 10000)
print(caf['plaintext']['cipher_output']['continuous_avalanche_factor']['values'][0]['value'])
0.067

# caf['plaintext']['cipher\_output']['continuous\_avalanche\_factor']
# is an array of dictionaries, where index 0 contains the CAF for \speck[128]{128} reduced to 1 round,
# index 1 contains the CAF for Speck128/128 reduced to 2 rounds, and so on.
# In this case, we obtained a value of 0.067 for CAF at round 8.