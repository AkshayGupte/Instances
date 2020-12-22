flowbalance {p in INPUTS union POOLS, t in 1..Time} :
        (if p in POOLS then sum{i in INARCSATPOOL[p]} flow[i,p,t] else prodrate[p,t]) + inv[p,t-1] 
	= inv[p,t] + sum{l in OUTARCS[p]} flow[p,l,t];

meetdemand {b in BLENDS, t in 1..Time} :
        sum{(p,b) in OUTPOOLARCS} flow[p,b,t] + inv[b,t-1] - inv[b,t] = demand[b,t];

initial_inv {p in NODES} :
#        inv[p,0] = (if p in BLENDS then sum{t in 1..Warmup} demand[p,t] else initialinv[p]);
	 inv[p,0] = initialinv[p];

#initial_inv {p in NODES,t in (if p in BLENDS then 0..Warmup else {0})} :
#        inv[p,t] = if p in BLENDS then 0 else initialinv[p];
