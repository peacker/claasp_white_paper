from pysmt.shortcuts import Symbol, get_env, Solver
from pysmt.logics import QF_UFLRA

name = "z3-smtlib" # Note: The API version is called 'msat'

# Path to the solver. The solver needs to take the smtlib file from
# stdin. This might require creating a tiny shell script to set the
# solver options.
path = ["/root/.smt_solvers/z3/z3-4.8.7-x64-ubuntu-16.04/bin/z3"]
logics = [QF_UFLRA,]    # List of the supported logics

# Add the solver to the environment
env = get_env()
env.factory.add_generic_solver(name, path, logics)

# The solver name of the SMT-LIB solver can be now used anywhere
# where pySMT would accept an API solver name
with Solver(name=name, logic="QF_BV") as s:
  s.to_smt()
  print(s.is_sat(Symbol("x"))) # True