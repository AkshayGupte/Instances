equations flowbalance(POOLS,ZeroSolveHorizon), flowbalance2(INPUTS,ZeroSolveHorizon),
meetdemand(BLENDS,ZeroSolveHorizon);

flowbalance(POOLS,ZeroSolveHorizon)$(ord(ZeroSolveHorizon) >= 2).. sum(n1$INARCSATPOOL(n1,POOLS),flow(n1,POOLS,ZeroSolveHorizon)) + inv(POOLS,ZeroSolveHorizon-1)
         =e= sum(n2$OUTARCSATPOOL(POOLS,n2),flow(POOLS,n2,ZeroSolveHorizon)) + inv(POOLS,ZeroSolveHorizon);

flowbalance2(INPUTS,ZeroSolveHorizon)$(ord(ZeroSolveHorizon) >= 2).. prodrate(INPUTS,ZeroSolveHorizon) + inv(INPUTS,ZeroSolveHorizon-1)
         =e= sum(pls$INPOOLARCS(INPUTS,pls),flow(INPUTS,pls,ZeroSolveHorizon)) + inv(INPUTS,ZeroSolveHorizon);

meetdemand(BLENDS,ZeroSolveHorizon)$(ord(ZeroSolveHorizon) >= 2).. sum(pls$OUTPOOLARCS(pls,BLENDS), flow(pls,BLENDS,ZeroSolveHorizon)) + inv(BLENDS,ZeroSolveHorizon-1)
         =e= demand(BLENDS,ZeroSolveHorizon) + inv(BLENDS,ZeroSolveHorizon);
