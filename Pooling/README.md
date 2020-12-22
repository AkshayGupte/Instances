# Instances/Pooling
Instances for the pooling problem. There are two types

1. Standard : these are 60 instances where the network does NOT have any arcs between pools
	Please cite the following paper if using these instances.
	- Santanu S. Dey and Akshay Gupte, "Analysis of MILP Techniques for the Pooling Problem",
	Operations Research, 63 (2), 2015, 412--427. DOI: 10.1287/opre.2015.1357
	
2. General : these are 20 instances that have arcs between pools
	Please cite the following paper if using these instances.
	- Akshay Gupte, Shabbir Ahmed, Santanu S. Dey and Myun Seok Cheon, "Relaxations and 
	Discretizations for the Pooling Problem",
	Journal of Global Optimization, 67 (3), 2017, 631--669. DOI: 10.1007/s10898-016-0434-4

Each directory has data in both AMPL and GAMS formats. Model files are provided for each.
1. Standard : 
	- AMPL : <model pooling-q.mod> loads the pq-formulation. You can then use a 
	nonlinear or global solver of your choice.
	- GAMS : <include xmodel.gms> calls <pqmodel.std.gms> which loads the pq-formulation. 
	You can then use a nonlinear or global solver of your choice.
	
2. General : 
	- AMPL : Use <model pooling-p.mod> to load the p-formulation. The pq-formulation does 
	not work well on these instances and hence is not provided.
	- GAMS : Use <include pooling-p.gms> to load the p-formulation.
