#

from claasp.ciphers.permutations.chacha_permutation import ChachaPermutation
chacha = ChachaPermutation(number_of_rounds=7)
d = chacha.diffusion_tests(number_of_samples=10000)
print(2*d["test_results"]["plaintext"]["round_output"]["avalanche_weight_vectors"]["differences"][434]["output_vectors"][5]["vector"][383]-1)

# You may observe a slight disparity between the value presented here and the value reported by Aumasson et al. This discrepancy arises from the fact that Aumasson et al. employed the median to calculate the bias, whereas we utilize the mean. Both statistics have demonstrated usefulness in computing the correlation of differentials or linear approximations. For further details about the use of the mean, we will refer to [1].
#
# [1] https://eprint.iacr.org/2020/775
