include param.mod;

var flow {(i,j) in ARCS} >= flowlbd[i,j] <= flowupbd[i,j];

var ratio {(i,p) in INPOOLPATHS} >= 0 <= 1;

minimize loss: sum{(i,j) in INPOOLARCS union INOUTARCS} varcost[i]*flow[i,j] 
		- sum{(i,j) in OUTPOOLARCS union INOUTARCS} revenue[j]*flow[i,j];

subject to maxcap {p in NODES} :
	lowcap[p] <=
	if p in INPUTS then sum{(p,i) in INPOOLARCS union INOUTARCS} flow[p,i]
	else if p in POOLS then sum{j in OUTARCSATPOOL[p]} flow[p,j]
	else sum {(k,p) in OUTPOOLARCS union INOUTARCS} flow[k,p] 
	<= capacity[p];

subject to sumratio {p in POOLS} :
	sum{(i,p) in INPOOLPATHS} ratio[i,p] = 1;

subject to commoditybal {i in INPUTS,p in POOLS : (i,p) in INPOOLPATHS} :
	sum{(l,p) in POOLPOOLARCS : (i,l) in INPOOLPATHS} ratio[i,l]*flow[l,p] 
	+ if (i,p) in INPOOLARCS then flow[i,p] else 0
	= sum{j in OUTARCSATPOOL[p]}ratio[i,p]*flow[p,j];

subject to specreq {b in BLENDS,sp in SPECS} :
	sum{(i,b) in INOUTARCS} speclevel[i,sp]*flow[i,b] 
	+ sum {(p,b) in OUTPOOLARCS,i in INPUTS: (i,p) in INPOOLPATHS} speclevel[i,sp]*ratio[i,p]*flow[p,b] 
	<= maxspec[b,sp]*(sum{(i,b) in OUTPOOLARCS union INOUTARCS} flow[i,b] );

subject to specreq2 {b in BLENDS,sp in SPECS} :
	sum{(j,b) in INOUTARCS} speclevel[j,sp]*flow[j,b] 
	+ sum {(p,b) in OUTPOOLARCS,i in INPUTS: (i,p) in INPOOLPATHS} speclevel[i,sp]*ratio[i,p]*flow[p,b] 
	>= minspec[b,sp]*(sum{(i,b) in OUTPOOLARCS union INOUTARCS} flow[i,b] );

subject to cutpq {p in POOLS,j in OUTARCSATPOOL[p]} :
	sum{(i,p) in INPOOLPATHS} ratio[i,p]*flow[p,j] = flow[p,j];

subject to cutpq2 {(i,p) in INPOOLPATHS} :
	sum{j in OUTARCSATPOOL[p]} ratio[i,p]*flow[p,j] <= ratio[i,p]*capacity[p];
