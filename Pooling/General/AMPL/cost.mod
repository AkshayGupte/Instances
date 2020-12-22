minimize loss:  sum{(i,j) in ARCS, t in 1..Time} varcost[i,j]*flow[i,j,t]
                                + sum{p in POOLS,t in 1..Time} fixcost[p]*use[p,t] ;
