$include pqmodel.std.gms
f.fx(i,t)$(a(i,t)>0 and not FEASBLENDS(t)) = 0;

option reslim=86400, optcr=1e-4, optca=1e-3;
option nlp = baron;

solve pqmodel minimizing cost using nlp;

#display f.l;
#display y.l;

parameter ae, re;
ae = abs(pqmodel.objest - pqmodel.objval);
re = 100*ae/abs(pqmodel.objval);

file output /"%sysenv.OUTPATH%/val2.out"/;
output.ap = 1;
put output;
put @2,"%sysenv.inst%":<12:0,pqmodel.objval:>14:2,pqmodel.objest:>14:2,re:>12:2,pqmodel.resusd:>10:0;

putclose output;