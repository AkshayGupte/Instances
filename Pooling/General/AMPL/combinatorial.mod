#----------------------------------------------------------------------------------------------------------------
# VARIABLES
#----------------------------------------------------------------------------------------------------------------
var use {p in POOLS,1..Time} binary;                    # use/not use pool at each time
                                                        # For pools under contract, this is 1 iff a new contract was started at time t
var inflow {p in POOLS,1..Time} binary;         # inflow for pool at each time
var outflow {p in POOLS,1..Time} binary;        # outflow for pool at each time
var zflow {ARCS,1..Time} binary;		# for semicontinuous flows
#----------------------------------------------------------------------------------------------------------------
# CONSTRAINTS
#----------------------------------------------------------------------------------------------------------------

inoutgoing {p in POOLS,t in 1..Time} :
        inflow[p,t] + outflow[p,t] <= if p in CONTRACTPOOLS then sum{t2 in max(1,t-duration[p]+1)..t} use[p,t2] else use[p,t] ;

inoutgoing2 {p in POOLS, i in INARCSATPOOL[p], t in 1..Time} :
        flow[i,p,t] <= flowupbd[i,p]*inflow[p,t];

inoutgoing3 {p in POOLS, j in OUTARCSATPOOL[p], t in 1..Time} :
        flow[p,j,t] <= flowupbd[p,j]*outflow[p,t];

inoutgoing4 {p in CONTRACTPOOLS,t in 1..Time} :
        inflow[p,t] + outflow[p,t] <= 1;

semicont1{(i,j) in ARCS,t in 1..Time} :
	flow[i,j,t] <= flowupbd[i,j]*zflow[i,j,t];

semicont2{(i,j) in ARCS,t in 1..Time} :
	flow[i,j,t] >= flowlbd[i,j]*zflow[i,j,t];

clearinv {p in CONTRACTPOOLS,t in 1..Time-1} :
        inv[p,t] <= capacity[p]*(sum{t2 in max(1,t-duration[p]+1)..t+1} use[p,t2]);
