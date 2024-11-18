# Instances/BiobjectiveMIP
Instances for biobjective MILPs. There is currently one class of instances, those that were
created from single-objective MILPs from the MIPLIB2017 test suite. For each instance, there
is an MPS file for the original problem and there LP files -- one for the original problem,
one with a randomly generated objective, and one whose objective is negative of that of the
original objective.

Please cite the following paper where you will also find details about instance generation.

	- Nathan Adelgren and Akshay Gupte, "Branch-and-bound for biobjective mixed-integer linear programming",
	INFORMS Journal on Computing, vol. 34 (2), pp. 909--933, 2022.
	
If you wish to use our branch-and-bound solver from the above paper, then you will find the
pre-compiled binary at https://github.com/nadelgr/BOMILP_BB.
