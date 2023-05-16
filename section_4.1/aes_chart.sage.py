# This script generates the AES main components as radar charts presents in Figure 11 of our paper.

from claasp.ciphers.block_ciphers.aes_block_cipher import AESBlockCipher
aes = AESBlockCipher(word_size=8, state_size=4, number_of_rounds=2)
result = aes.component_analysis_tests()
fig = aes.print_component_analysis_as_radar_charts(result)
fig.show()