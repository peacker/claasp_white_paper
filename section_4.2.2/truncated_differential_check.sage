#

from claasp.ciphers.permutations.chacha_permutation import ChachaPermutation
chacha = ChachaPermutation(number_of_rounds=7)
d = chacha.diffusion_tests(number_of_samples=10000)
print(d["test_results"]["plaintext"]["round_output"]["avalanche_weight_vectors"]["differences"][434]["output_vectors"][5]["vector"][383])