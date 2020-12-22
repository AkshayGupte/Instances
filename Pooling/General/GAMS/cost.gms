equations obj;
variable cost;
obj.. cost =e= sum( (n1,n2,SolveHorizon)$ARCS(n1,n2), varcost(n1,n2)*flow(n1,n2,SolveHorizon)) +
          sum((POOLS,SolveHorizon), fixcost(POOLS)*use(POOLS,SolveHorizon));
