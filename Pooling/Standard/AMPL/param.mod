set INPUTS ordered;
set POOLS ordered;
set BLENDS ordered;
set SPECS ordered;
set NODES ordered := INPUTS union POOLS union BLENDS;
set INFEASBLENDS ordered within BLENDS default {};

set INPOOLARCS within {INPUTS,POOLS} ;
set INOUTARCS within {INPUTS,BLENDS} default {};
set OUTPOOLARCS within {POOLS,BLENDS} default {POOLS cross BLENDS};
set POOLPOOLARCS within {POOLS,POOLS} default {};
set INPOOLPATHS within {INPUTS,POOLS} default INPOOLARCS;
check INPOOLARCS within INPOOLPATHS;

set ARCS default INPOOLARCS union POOLPOOLARCS union OUTPOOLARCS union INOUTARCS;

set INARCSATPOOL {p in POOLS} := {(i,p) in INPOOLARCS union POOLPOOLARCS} ordered;
set OUTARCSATPOOL {p in POOLS} := {(p,j) in OUTPOOLARCS union POOLPOOLARCS} ordered;
set INARCSATBLEND {b in BLENDS} := {(i,b) in OUTPOOLARCS union INOUTARCS};

set FIRSTPOOLS := {p in POOLS : card({POOLS cross {p}} intersect POOLPOOLARCS) = 0};

set INOUTPATHS within {INPUTS,BLENDS} default {i in INPUTS, b in BLENDS : (i,b) in INOUTARCS or exists {p in POOLS} ((p,b) in OUTPOOLARCS and (i,p) in INPOOLPATHS) };

set INPUTSATBLEND {b in BLENDS} := {i in INPUTS: (i,b) in INOUTPATHS};

param speclevel {i in INPUTS,sp in SPECS} >= 0;
param minlevel {p in POOLS union BLENDS,sp in SPECS} := if p in POOLS then min {(i,p) in INPOOLPATHS} speclevel[i,sp] else min{(i,b) in INOUTPATHS} speclevel[i,sp];
param maxlevel {p in POOLS union BLENDS,sp in SPECS} := if p in POOLS then max {(i,p) in INPOOLPATHS} speclevel[i,sp] else max{(i,b) in INOUTPATHS} speclevel[i,sp];
param minspec {b in BLENDS, sp in SPECS} >= 0 default 0;
param maxspec {b in BLENDS, sp in SPECS} >= 0;


param capacity {NODES} >= 0;
param lowcap {NODES} default 0;
param revenue {BLENDS} > 0;
param varcost {INPUTS} >= 0;
param flowlbd {ARCS} default 0;
param flowupbd {(i,j) in ARCS} default min(capacity[i],capacity[j]);
