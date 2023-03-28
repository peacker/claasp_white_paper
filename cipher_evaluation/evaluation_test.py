import numpy as np
import math
import time
from datetime import timedelta

def run_evaluation(cipher, loop):
    # generate inputs with numpy
    random_input_vectorize= []
    for i in range(len(cipher.inputs)):
        input_vec = np.random.randint(256, size=((cipher.inputs_bit_size[i]-1)//8+1, loop), dtype=np.uint8)
        random_input_vectorize.append(input_vec)
    
    # transform numpy inputs to the normal input for python and c code
    random_input = []
    for i in range(loop):
        input = []
        for j in range(len(cipher.inputs)):
            input.append(int.from_bytes(random_input_vectorize[j][:,i].tobytes(), byteorder='big'))
        random_input.append(input)

    # run python evaluation
    python_time = time.time()
    for j in range(loop):
        cipher.evaluate(random_input[j])
    python_time = time.time() - python_time

    # run c evaluation
    c_time = time.time()
    for j in range(loop):
        cipher.evaluate_using_c(random_input[j])
    c_time = time.time() - c_time

    # run vectorized evaluation
    vectorize_time = time.time()
    cipher.evaluate_vectorized(random_input_vectorize)
    vectorize_time = time.time() - vectorize_time

    return python_time, c_time, vectorize_time

def run_evaluation_test(cipher, loop):
    print(f"{cipher.family_name} & ", end='')
    python_time_one, c_time_one, vectorize_time_one = run_evaluation(cipher, 1)
    python_time_loop, c_time_loop, vectorize_time_loop = run_evaluation(cipher, loop)
    print(
        f"{python_time_one} & {python_time_loop} & {c_time_one} & {c_time_loop} & {vectorize_time_one} & {vectorize_time_loop} \\\\")
    print('\midrule')
