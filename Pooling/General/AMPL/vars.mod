#var q {p in POOLS union BLENDS,sp in SPECS,t in 0..Time} >= 0 <= ubq[p,sp,t];
var q {p in POOLS,sp in SPECS,t in 0..Time} >= if t==0 then 0 else lbq[p,sp,t] <= if t==0 then 0 else ubq[p,sp,t];

var inv {p in NODES, t in 0..Time}  >= if t==0 then 0 else mincapacity[p] <= capacity[p] ; 
# Inventory at the pool, inputs, blends

var flow {(i,j) in ARCS,t in 1..Time}  >= 0 <= flowupbd[i,j];
#var flow{(i,j) in ARCS,t in 1..Time} in {0} union interval[flowlbd[i,j],flowupbd[i,j]];  
# Semicontinuous Flow variables on the arcs
