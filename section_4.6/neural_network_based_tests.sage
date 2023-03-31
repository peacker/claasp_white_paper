#Example output:
#========== Running the black-box neural test on 1-round SPECK32  ==========
#2023-03-22 13:07:32.621086: I tensorflow/core/platform/cpu_feature_guard.cc:182] This TensorFlow binary is optimized to use available CPU instructions in performance-critical operations.
#To enable the following instructions: AVX2 FMA, in other operations, rebuild TensorFlow with the appropriate compiler flags.
#The test was run with the following parameters..
#{'input_parameters': {'number_of_samples': 10000, 'hidden_layers': [32, 32, 32], 'number_of_epochs': 10}, 'test_results': {'plaintext': {'round_key_output': {'input_bit_size': 32, 'output_bit_size': 32, 'max_accuracy_value': 1, 'min_accuracy_value': 0, 'accuracies': [{'value_accuracy': 0.9959999918937683, 'round': 0, 'component_output_id': 'intermediate_output_0_5'}]}, 'cipher_output': {'input_bit_size': 32, 'output_bit_size': 32, 'max_accuracy_value': 1, 'min_accuracy_value': 0, 'accuracies': [{'value_accuracy': 0.5059999823570251, 'round': 0, 'component_output_id': 'cipher_output_0_6'}]}}, 'key': {'round_key_output': {'input_bit_size': 64, 'output_bit_size': 32, 'max_accuracy_value': 1, 'min_accuracy_value': 0, 'accuracies': [{'value_accuracy': 0.9020000100135803, 'round': 0, 'component_output_id': 'intermediate_output_0_5'}]}, 'cipher_output': {'input_bit_size': 64, 'output_bit_size': 32, 'max_accuracy_value': 1, 'min_accuracy_value': 0, 'accuracies': [{'value_accuracy': 0.9210000038146973, 'round': 0, 'component_output_id': 'cipher_output_0_6'}]}}}}
#{'plaintext': {'round_key_output': {'input_bit_size': 32, 'output_bit_size': 32, 'max_accuracy_value': 1, 'min_accuracy_value': 0, 'accuracies': [{'value_accuracy': 0.9959999918937683, 'round': 0, 'component_output_id': 'intermediate_output_0_5'}]}, 'cipher_output': {'input_bit_size': 32, 'output_bit_size': 32, 'max_accuracy_value': 1, 'min_accuracy_value': 0, 'accuracies': [{'value_accuracy': 0.5059999823570251, 'round': 0, 'component_output_id': 'cipher_output_0_6'}]}}, 'key': {'round_key_output': {'input_bit_size': 64, 'output_bit_size': 32, 'max_accuracy_value': 1, 'min_accuracy_value': 0, 'accuracies': [{'value_accuracy': 0.9020000100135803, 'round': 0, 'component_output_id': 'intermediate_output_0_5'}]}, 'cipher_output': {'input_bit_size': 64, 'output_bit_size': 32, 'max_accuracy_value': 1, 'min_accuracy_value': 0, 'accuracies': [{'value_accuracy': 0.9210000038146973, 'round': 0, 'component_output_id': 'cipher_output_0_6'}]}}}
#========== Finding good input differences for neural cryptanalysis of SPECK32  ==========
#The highest reached round for which a significant bias score was found was 6
#The best differences found by the optimizer are...
#0x400000 , with score 3.3593218749999996
#0x408000 , with score 3.0202187499999997
#0x102000 , with score 2.597675
#0x600000 , with score 2.5493281249999997
#0x200000 , with score 2.5401812500000003
#0x8000 , with score 2.354559375
#0x502000 , with score 2.342040625
#0x1408000 , with score 2.330615625
#0x204000 , with score 2.273053125
#0x604000 , with score 2.269640625
#========== Training a neural distinguisher for SPECK32  ==========
#2000/2000 [==============================] - 287s 143ms/step - loss: 0.0920 - acc: 0.8831 - val_loss: 0.0797 - val_acc: 0.9014
#Validation accuracy at 5 rounds :0.9013929963111877
#2000/2000 [==============================] - 286s 143ms/step - loss: 0.1720 - acc: 0.7454 - val_loss: 0.1627 - val_acc: 0.7618
#Validation accuracy at 6 rounds :0.7618110179901123
#2000/2000 [==============================] - 281s 140ms/step - loss: 0.2391 - acc: 0.5928 - val_loss: 0.2370 - val_acc: 0.6001
#Validation accuracy at 7 rounds :0.6001260280609131
#2000/2000 [==============================] - 278s 139ms/step - loss: 0.2516 - acc: 0.5044 - val_loss: 0.2512 - val_acc: 0.5064
#Validation accuracy at 8 rounds :0.506397008895874
#2000/2000 [==============================] - 273s 136ms/step - loss: 0.2512 - acc: 0.4999 - val_loss: 0.2512 - val_acc: 0.5001
#Validation accuracy at 9 rounds :0.5001099705696106

def load_speck3264(_number_of_rounds=22):
    from claasp.ciphers.block_ciphers.speck_block_cipher import SpeckBlockCipher
    return SpeckBlockCipher(number_of_rounds = _number_of_rounds)

from claasp.cipher_modules.models.utils import set_fixed_variables, integer_to_bit_list
import numpy as np

def black_box_neural_network_test(cipher):
    test_result = cipher.neural_network_blackbox_distinguisher_tests()
    print(f'The test was run with the following parameters..\n{test_result["neural_network_blackbox_distinguisher_tests"]}')
    print(f'When the input of the neural network was the plaintext (and the key was fixed), the following accuracies were obtained for each output: \n')
    print(test_result['neural_network_blackbox_distinguisher_tests']['test_results']['plaintext'])
    print(f'When the input of the neural network was the key (and the plaintext was fixed), the following accuracies were obtained for each output: \n')
    print(test_result['neural_network_blackbox_distinguisher_tests']['test_results']['key'])
    return test_result

def find_good_input_difference_for_neural_distinguisher(cipher, scenario = 'single-key'):
    cipher_inputs = cipher.inputs
    if scenario == 'single-key' :
        positions = [x == 'plaintext' for x in cipher_inputs]
    elif scenario == 'related-key':
        positions = [True for x in cipher_inputs]
    differences, scores, highest_round = cipher.find_good_input_difference_for_neural_distinguisher(difference_positions = positions)
    print("The highest reached round for which a significant bias score was found was", highest_round)
    print("The best differences found by the optimizer are...")
    for i in range(1, 11):
        print(hex(differences[-i]), ", with score", scores[-i])
    return differences[-1]



print("="*10,  "Running the black-box neural test on 1-round SPECK32 ", "="*10)
# Obtain a 1-round instance of Speck3264
speck = load_speck3264(_number_of_rounds = 1)
black_box_neural_network_test(speck)
#
print("="*10,  "Finding good input differences for neural cryptanalysis of SPECK32 ", "="*10)
# Obtain a 5 full instance of Speck3264
speck = load_speck3264()
best_difference = find_good_input_difference_for_neural_distinguisher(speck)

print("="*10,  "Training a neural distinguisher for SPECK32 ", "="*10)
speck = load_speck3264()
from claasp.cipher_modules.neural_network_tests import neural_staged_training
diff_value_plain_key =  [best_difference, 0]
# Note than in the current version, the neural network expects inputs of size 4*word_size
neural_staged_training(speck, diff_value_plain_key, starting_round = 5, training_samples=10**6, testing_samples=10**5, word_size = 16)
