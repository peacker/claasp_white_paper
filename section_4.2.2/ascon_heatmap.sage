# This script generates a latex code that can be run in order to retrieve the heatmap representing the results of
# the diffusion tests for ASCON320 in the figure 12 of our paper

from claasp.ciphers.permutations.ascon_permutation import AsconPermutation
ascon = AsconPermutation(number_of_rounds=5)
d = ascon.diffusion_tests(number_of_samples=1000)
h = ascon.generate_heatmap_graphs_for_avalanche_tests(d, [0], ["avalanche_weight_vectors"])
print(h)