binary variables use(POOLS,ZeroSolveHorizon);
use.fx(POOLS,'0') = 0;
binary variables inflow(POOLS,SolveHorizon);
binary variables outflow(POOLS,SolveHorizon);
binary variables zflow(NODES,NODES2,ZeroSolveHorizon);

equations inoutgoing(NODES,SolveHorizon), inoutgoing2(NODES,NODES2,SolveHorizon),
inoutgoing3(NODES,NODES2,SolveHorizon), inoutgoing4(NODES2,SolveHorizon),
inoutgoing5(NODES,SolveHorizon),
semiflowl(NODES,NODES2,SolveHorizon), semiflowu(NODES,NODES2,SolveHorizon);
#clearinv(NODES,SolveHorizon);

inoutgoing(MYPOOLS,SolveHorizon).. inflow(MYPOOLS,SolveHorizon) + outflow(MYPOOLS,SolveHorizon) =l= use(MYPOOLS,SolveHorizon);

inoutgoing2(n1,POOLS,SolveHorizon)$INARCSATPOOL(n1,POOLS).. flow(n1,POOLS,SolveHorizon) =l= flowupbd(n1,POOLS)*inflow(POOLS,SolveHorizon);

inoutgoing3(POOLS,n2,SolveHorizon)$OUTARCSATPOOL(POOLS,n2).. flow(POOLS,n2,SolveHorizon) =l= flowupbd(POOLS,n2)*outflow(POOLS,SolveHorizon);

inoutgoing4(CONTRACTPOOLS,SolveHorizon).. inflow(CONTRACTPOOLS,SolveHorizon) + outflow(CONTRACTPOOLS,SolveHorizon) =l= 1;

inoutgoing5(CONTRACTPOOLS,SolveHorizon).. inflow(CONTRACTPOOLS,SolveHorizon) + outflow(CONTRACTPOOLS,SolveHorizon)
         =l= sum( SolveTime$( (ord(SolveTime) <= ord(SolveHorizon)) and (ord(SolveTime) >= 1) and (ord(SolveTime) >= ord(SolveHorizon) - duration(CONTRACTPOOLS)+1) ) ,use(CONTRACTPOOLS,SolveTime));

semiflowl(n1,n2,SolveHorizon)$ARCS(n1,n2).. flow(n1,n2,SolveHorizon) =g= flowlbd(n1,n2)*zflow(n1,n2,SolveHorizon);

semiflowu(n1,n2,SolveHorizon)$ARCS(n1,n2).. flow(n1,n2,SolveHorizon) =l= flowupbd(n1,n2)*zflow(n1,n2,SolveHorizon);

scalar alltime;
alltime = card(SolveHorizon);

#clearinv(CONTRACTPOOLS,SolveHorizon)$(ord(SolveHorizon) <= alltime-1)..
#       inv(CONTRACTPOOLS,SolveHorizon) =l= capacity(CONTRACTPOOLS)*( sum(SolveTime$( (ord(SolveTime) >= ord(SolveHorizon)-duration(CONTRACTPOOLS)+1) and (ord(SolveTime) <= ord(SolveHorizon)+1) ) , use(CONTRACTPOOLS,SolveTime) ) );
