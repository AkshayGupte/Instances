$include pooling-p.gms

option reslim = 21600, optca = 1.e-3, optcr = 1.e-4 ;
option minlp = baron;
solve pmodel minimizing cost using minlp;

parameter ae, re;
ae = abs(pmodel.objest - pmodel.objval);
re = 100*ae/abs(pmodel.objval);

file output /"%sysenv.OUTPATH%/val.out"/;
output.ap = 1;
put output;
put @2,"%sysenv.inst%":<12:0,pmodel.objval:>14:2,pmodel.objest:>14:2,re:>12:2,pmodel.resusd:>10:0;

putclose output;
