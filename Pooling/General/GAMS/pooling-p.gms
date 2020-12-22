$ontext
GAMS model for p-formulation of pooling problem
Author : Akshay Gupte
Created : April 28, 2011
$offtext

$inlinecom { }
$onmacro

$include network.gms

#--------------------------------------------------
# Variables
# -------------------------------------------------

$ontext
BARON cannot handle semicontinuous variables
semicont variable flow(NODES,NODES2,FullHorizon);
flow.lo(NODES,NODES2,FullHorizon) = flowlbd(NODES,NODES2);
flow.up(NODES,NODES2,FullHorizon) = flowupbd(NODES,NODES2);
$offtext

positive variables flow(NODES,NODES2,ZeroSolveHorizon);
flow.up(NODES,NODES2,SolveHorizon) = flowupbd(NODES,NODES2);
flow.fx(NODES,NODES2,'0') = 0.0;

positive variables inv(NODES,ZeroSolveHorizon);
inv.up(NODES,ZeroSolveHorizon) = capacity(NODES);
inv.fx(NODES,'0') = initialinv(NODES);
positive variables p(POOLS,SPECS,ZeroSolveHorizon);
p.up(POOLS,SPECS,SolveHorizon) = maxlevel(SPECS);
p.lo(POOLS,SPECS,SolveHorizon) = minlevel(SPECS);
p.fx(POOLS,SPECS,'0') = 0;
positive variables specflow(POOLS,NODES,SPECS,ZeroSolveHorizon);
specflow.fx(POOLS,NODES,SPECS,'0') = 0;
positive variables specinv(POOLS,SPECS,ZeroSolveHorizon);
specinv.fx(POOLS,SPECS,'0') = 0;

#--------------------------------------------------
# Declare constraints
# -------------------------------------------------
equations trackspecPool(NODES,SPECS,ZeroSolveHorizon),
minspecreq(BLENDS,SPECS,SolveHorizon), maxspecreq(BLENDS,SPECS,SolveHorizon),
specdef(POOLS,NODES,SPECS,SolveHorizon),specdef2(POOLS,SPECS,SolveHorizon);

#--------------------------------------------------
# Define constraints
# -------------------------------------------------
alias(NODES,n1,n2);
alias(INPUTS,ins);
alias(POOLS,pls);
alias(BLENDS,outs);

trackspecPool(POOLS,SPECS,ZeroSolveHorizon)$(ord(ZeroSolveHorizon) >= 2)..
        sum(ins$INPOOLARCS(ins,POOLS),speclevel(ins,SPECS) * flow(ins,POOLS,ZeroSolveHorizon)) +
         specinv(POOLS,SPECS,ZeroSolveHorizon-1) +
         sum(pls$POOLPOOLARCS(pls,POOLS), specflow(pls,POOLS,SPECS,ZeroSolveHorizon)) -
         specinv(POOLS,SPECS,ZeroSolveHorizon) -
         sum(n1$OUTARCSATPOOL(POOLS,n1),specflow(POOLS,n1,SPECS,ZeroSolveHorizon)) =e= 0;

minspecreq(BLENDS,SPECS,SolveHorizon)..
         sum(pls$OUTPOOLARCS(pls,BLENDS), specflow(pls,BLENDS,SPECS,SolveHorizon) - minspec(BLENDS,SPECS)*flow(pls,BLENDS,SolveHorizon))
         =g= 0;

maxspecreq(BLENDS,SPECS,SolveHorizon)..
         sum(pls$OUTPOOLARCS(pls,BLENDS), specflow(pls,BLENDS,SPECS,SolveHorizon) - maxspec(BLENDS,SPECS)*flow(pls,BLENDS,SolveHorizon))
         =l= 0;

specdef(POOLS,NODES,SPECS,SolveHorizon)$OUTARCSATPOOL(POOLS,NODES)..
         specflow(POOLS,NODES,SPECS,SolveHorizon) =e= p(POOLS,SPECS,SolveHorizon)*flow(POOLS,NODES,SolveHorizon);

specdef2(POOLS,SPECS,SolveHorizon)..
         specinv(POOLS,SPECS,SolveHorizon) =e= p(POOLS,SPECS,SolveHorizon)*inv(POOLS,SolveHorizon);

$include flowbal.gms
$include combinatorial.gms
$include cost.gms

# ------------------------------------------------
# Solve the pooling model
# -----------------------------------------------

model pmodel /all/;

pmodel.solprint = 0;
pmodel.workspace = 1500;
pmodel.optfile = 1;

option reslim = 3600, optca = 1.e-3, optcr = 1.e-4 ;

option minlp = baron;


