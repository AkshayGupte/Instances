$eolcom #

set NODES /f1*f3, pl1*pl7, B1*B2/;
set SPECS /sp1*sp2/;
set INPUTS(NODES) /f1*f3/;
set BLENDS(NODES) /B1*B2/;
set POOLS(NODES) /pl1*pl7/;
set CONTRACTPOOLS(POOLS) /pl1,pl3/;
set ARCS(NODES,NODES) / f1.(pl1,pl5,pl7),
                f2.(pl1,pl3,pl7),
                f3.(pl1,pl3),
                pl1.(pl6),
                pl2.(pl3,pl5,pl7,B1,B2),
                pl3.(pl2,pl4,pl6),
                pl4.(pl3,B1,B2),
                pl5.(pl2,pl6),
                pl6.(pl1,pl3,pl5,pl7,B2),
                pl7.(pl2,pl6) /;

alias(NODES,NODES2);

set FullHorizon /0 * 6/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;
table varcost(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     B1      B2
f1       4                               2               8
f2       9               6                               7
f3       3               4
pl1                                              10
pl2                      1               5               8       7       9
pl3              1               5               2
pl4                      5                                       8       9
pl5              5                               2
pl6      10              2               2               6               5
pl7              8                               6                       ;

parameter capacity(NODES) / f1 68,f2 47,f3 55,pl1 80,pl2 27,pl3 55,pl4 27,pl5 80,pl6 27,pl7 80,B1 55,B2 55 /;

parameter duration(CONTRACTPOOLS) / pl1 3,pl3 2 /;

parameter fixcost(POOLS) / pl1 21,pl2 7,pl3 22,pl4 7,pl5 21,pl6 7,pl7 20 /;

parameter revenue(BLENDS) /
B1 81,B2 84 /;

parameter initialinv(NODES) ;
 initialinv(NODES) = 0;

table flowlbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     B1      B2
f1       6                               6               8
f2       9               8                               7
f3       8               7
pl1                                              8
pl2                      8               7               5       8       9
pl3              8               6               6
pl4                      6                                       8       9
pl5              7                               6
pl6      8               6               6               6               7
pl7              5                               6                       ;

table flowupbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     B1      B2
f1       68                              68              68
f2       47              47                              47
f3       55              55
pl1                                              80
pl2                      55              80              80      27      27
pl3              55              55              55
pl4                      55                                      27      27
pl5              80                              80
pl6      80              55              80              80              27
pl7              80                              80                        ;

table prodrate(INPUTS,FullHorizon)
         1       2       3       4       5       6
f1       28      15      22      19      16      9
f2       51      32      19      11      15      22
f3       35      23      40      17      8       10  ;

table demand(BLENDS,FullHorizon)
         1       2       3       4       5       6
B1       18      14      12      14      13      23
B2       13      10      22      18      12      14  ;

table speclevel(INPUTS,SPECS)
                 sp1     sp2
f1               0.3     0
f2               0.33    0.21
f3               0.6     0.47  ;

table minspec(BLENDS,SPECS)
                 sp1     sp2
B1               0.34    0.24
B2               0.23    0.18  ;

table maxspec(BLENDS,SPECS)
                 sp1     sp2
B1               0.55    0.46
B2               0.39    0.38  ;

$include xmodel.gms
