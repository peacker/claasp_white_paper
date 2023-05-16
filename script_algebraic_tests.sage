from claasp.cipher_modules.models.algebraic.algebraic_model import AlgebraicModel
from claasp.cipher_modules.algebraic_tests import algebraic_tests
from claasp.ciphers.block_ciphers.present_block_cipher import PresentBlockCipher
present = PresentBlockCipher(number_of_rounds=1)
ps=AlgebraicModel(present).polynomial_system()
print(ps)
result=algebraic_tests(present,120)
print(result)
