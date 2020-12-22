#----------------------------------------------------------------------------------------------------------------
# SETS AND PARAMETERS
#----------------------------------------------------------------------------------------------------------------

set POOLS ordered;
set SPECS ordered;
set INPUTS ordered;
set BLENDS ordered;

set NODES := INPUTS union POOLS union BLENDS ordered;
set ARCS within {INPUTS,POOLS} union {POOLS,POOLS} union {POOLS,BLENDS};

set CONTRACTPOOLS within POOLS ordered;

set INOUTARCS within {INPUTS,BLENDS} default {};
set INPOOLARCS := {(i,j) in ARCS: i in INPUTS and j in POOLS};
set OUTPOOLARCS := {(i,j) in ARCS: i in POOLS and j in BLENDS};
set POOLPOOLARCS := {(i,j) in ARCS: i in POOLS and j in POOLS and i <> j};
set INPOOLPATHS within {INPUTS,POOLS} default INPOOLARCS;
check INPOOLARCS within INPOOLPATHS;

set INOUTPATHS within {INPUTS,BLENDS} default {i in INPUTS, b in BLENDS : (i,b) in INOUTARCS or exists {p in POOLS} ((p,b) in OUTPOOLARCS and (i,p) in INPOOLPATHS) };

set INARCSATPOOL {p in POOLS} := {(i,p) in INPOOLARCS union POOLPOOLARCS} ordered;
set OUTARCSATPOOL {p in POOLS union BLENDS} := if p in BLENDS then {1} else {(p,j) in POOLPOOLARCS union OUTPOOLARCS} ordered;

set INARCS{n in NODES} := {i in NODES: (i,n) in ARCS};
set OUTARCS{n in NODES} := {i in NODES: (n,i) in ARCS};

param time > 0 integer;
param netTime default 6;
param Time := min(netTime,time);

param Warmup >= 0 < Time integer default 0;
param varcost{ARCS};
param prodrate {INPUTS,1..time} > 0;
param capacity {NODES} > 0;
param mincapacity {NODES} >= 0 default 0;
param duration {CONTRACTPOOLS} > 0 <= time;
param fixcost {POOLS} >= 0;
param revenue {BLENDS} >= 0;
param demand {BLENDS,1..time} >= 0 default 0;
param speclevel {i in INPUTS,sp in SPECS} >= 0;
param minspec {b in BLENDS, sp in SPECS} >= 0 default 0;
param maxspec {b in BLENDS, sp in SPECS} >= 0;
param flowlbd {ARCS} >= 0 default 0;
param flowupbd {(i,j) in ARCS} >= flowlbd[i,j] default min(capacity[i],capacity[j]);
param initialinv {NODES} >= 0 default 0;

param minlevel {p in POOLS,sp in SPECS} := min {(i,p) in INPOOLPATHS} speclevel[i,sp] ;
param maxlevel {p in POOLS,sp in SPECS} := max {(i,p) in INPOOLPATHS} speclevel[i,sp] ;
param lbq {p in POOLS, sp in SPECS,t in 0..Time} := minlevel[p,sp];
param ubq {p in POOLS, sp in SPECS,t in 0..Time} := maxlevel[p,sp];

#param lbq {p in POOLS union BLENDS, sp in SPECS,t in 0..Time} := if p in BLENDS then minspec[p,sp] else minlevel[p,sp];
#param ubq {p in POOLS union BLENDS, sp in SPECS,t in 0..Time} := if p in BLENDS then maxspec[p,sp] else maxlevel[p,sp];
