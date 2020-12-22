# -------------------------------------------------
# SETS
# -------------------------------------------------
$ontext
# Check if CONTRACTPOOLS \subseteq POOLS
scalar checkpl;
checkpl = sum(CONTRACTPOOLS(NODES)$(CONTRACTPOOLS(NODES) and (not POOLS(NODES))),1);
if (checkpl > 0,
     abort "CONTRACTPOOLS MUST BE SUBSET OF POOLS";
);
$offtext

set MYPOOLS(POOLS);
MYPOOLS(POOLS) = yes$(not CONTRACTPOOLS(POOLS));

set IP(NODES,NODES2);
IP(NODES,NODES2) = yes$(INPUTS(NODES) and POOLS(NODES2));
set PP(NODES,NODES2);
PP(NODES,NODES2) = yes$(POOLS(NODES) and POOLS(NODES2));
set PB(NODES,NODES2);
PB(NODES,NODES2) = yes$(POOLS(NODES) and BLENDS(NODES2));

set INPOOLARCS(NODES,NODES2);
INPOOLARCS(NODES,NODES2) = ARCS(NODES,NODES2) * IP(NODES,NODES2);
set POOLPOOLARCS(NODES,NODES2);
POOLPOOLARCS(NODES,NODES2) = ARCS(NODES,NODES2) * PP(NODES,NODES2);
set OUTPOOLARCS(NODES,NODES2);
OUTPOOLARCS(NODES,NODES2) = ARCS(NODES,NODES2) * PB(NODES,NODES2);
set INARCSATPOOL(NODES,NODES2);
INARCSATPOOL(NODES,NODES2) = ARCS(NODES,NODES2) * (IP(NODES,NODES2) + PP(NODES,NODES2));
set OUTARCSATPOOL(NODES,NODES2);
OUTARCSATPOOL(NODES,NODES2) = ARCS(NODES,NODES2) * (PP(NODES,NODES2) + PB(NODES,NODES2));

#--------------------------------------------------
# Parameters
# -------------------------------------------------
$macro AfterWarm Warmup+1
set AfterWarmPeriod(FullHorizon);
AfterWarmPeriod(FullHorizon) = yes$(ord(FullHorizon) >= AfterWarm);

$ontext
Initial inventory at blends must be enough to satisfy demand
for first few days to guarantee feasibility
$offtext
initialinv(BLENDS) = sum(SolveHorizon$(ord(SolveHorizon) <= Warmup), demand(BLENDS,SolveHorizon));

parameter minlevel(SPECS);
minlevel(SPECS) = smin(INPUTS,speclevel(INPUTS,SPECS));
parameter maxlevel(SPECS);
maxlevel(SPECS) = smax(INPUTS,speclevel(INPUTS,SPECS));