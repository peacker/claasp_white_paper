############
# This script plots the timings of the avalanche tests for five rounds of popular ciphers
# shown in the figure 7 of the paper. We decided to illustrate this plot with 4 ciphers
# unlike the one shown in the paper to make the script faster.
############

import matplotlib.pyplot as plt
import time

# 5 rounds:
nb_samples = [100, 1000, 5000, 10000, 50000]

from claasp.ciphers.block_ciphers.speck_block_cipher import SpeckBlockCipher
from claasp.ciphers.permutations.ascon_permutation import AsconPermutation
from claasp.ciphers.block_ciphers.present_block_cipher import PresentBlockCipher
from claasp.ciphers.permutations.gift_permutation import GiftPermutation
speck_p32_64 = []
ascon320 = []
present_p64_k80 = []
gift_p128_k128 = []
ciphers = [
{"name": SpeckBlockCipher, "list": speck_p32_64},
{"name": AsconPermutation, "list": ascon320},
{"name": PresentBlockCipher, "list": present_p64_k80},
{"name": PresentBlockCipher, "list": gift_p128_k128},
]

for creator in ciphers:
    cipher = creator["name"](number_of_rounds=5)
    for sample in nb_samples:
        time_start = time.time()
        d = cipher.diffusion_tests(number_of_samples=sample)
        time_end = time.time()
        creator["list"].append(time_end - time_start)

plt.plot(nb_samples, ascon320, marker='.', label='ascon_p320')
plt.plot(nb_samples, speck_p32_64, marker='.', label='speck_p32_64')
plt.plot(nb_samples, present_p64_k80, marker='.', label='present_p64_k80')
plt.plot(nb_samples, gift_p128_k128, marker='.', label='gift_p128_k128')
plt.xlim(50, 55000)
plt.legend()
plt.xlabel('Samples')
plt.ylabel("Time(sec)")
plt.savefig('timings_avalanche.png', dpi=200, format='png')
