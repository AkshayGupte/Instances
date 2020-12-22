model param.mod;

#param numIntVar := (card{ARCS} + 3*card{POOLS})*Time;
#param numBilVarb := sum{b in BLENDS, sp in SPECS,t in Warmup..Time} (1 + card{{(i,b) in OUTPOOLARCS}}) ;
#param numBilVar := numBilVarb + sum {p in POOLS, sp in SPECS,t in 1..Time} (1 + card{OUTARCSATPOOL[p]});
#param numBilCons := (card{POOLS}*Time + card{BLENDS}*(Time-Warmup))*card{SPECS};

model vars.mod;

subject to

trackspecPool {p in POOLS, sp in SPECS,t in 1..Time} :
        sum{(i,p) in INPOOLARCS} speclevel[i,sp]*flow[i,p,t] + q[p,sp,t-1]*inv[p,t-1]
        + sum{(i,p) in POOLPOOLARCS} q[i,sp,t]*flow[i,p,t]
        = q[p,sp,t]*inv[p,t] + sum{j in OUTARCSATPOOL[p]} q[p,sp,t]*flow[p,j,t] ;

#trackspecBlend {b in BLENDS, sp in SPECS,t in 1..Time} :
#        sum{(i,b) in OUTPOOLARCS} q[i,sp,t]*flow[i,b,t] + q[b,sp,t-1]*inv[b,t-1]
#        = q[b,sp,t]*(demand[b,t] + inv[b,t]);

minspecreq {b in BLENDS, sp in SPECS,t in 1..Time} :
        sum{(i,b) in OUTPOOLARCS} q[i,sp,t]*flow[i,b,t] >= minspec[b,sp]* sum{(i,b) in OUTPOOLARCS}flow[i,b,t];

maxspecreq {b in BLENDS, sp in SPECS,t in 1..Time} :
        sum{(i,b) in OUTPOOLARCS} q[i,sp,t]*flow[i,b,t] <= maxspec[b,sp]* sum{(i,b) in OUTPOOLARCS}flow[i,b,t];

model flowbal.mod;

model combinatorial.mod;

model cost.mod;
