$eolcom #

set NODES /f1*f3, pl1*pl7, B1*B2/;
set SPECS /sp1*sp2/;
set INPUTS(NODES) /f1*f3/;
set BLENDS(NODES) /B1*B2/;
set POOLS(NODES) /pl1*pl7/;
set CONTRACTPOOLS(POOLS) /pl2,pl5/;
set ARCS(NODES,NODES) / f1.(pl3,pl5),
                f2.(pl1,pl5),
                f3.(pl3,pl7),
                pl1.(pl4,pl6),
                pl2.(pl3,pl5,pl7,B1,B2),
                pl3.(pl2,pl4,pl6),
                pl4.(pl1,pl3,pl7,B1),
                pl5.(pl2),
                pl6.(pl1,pl3,pl7,B1,B2),
                pl7.(pl2,pl4,pl6) /;

alias(NODES,NODES2);

set FullHorizon /0 * 10/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;

table varcost(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     B1     B2
f1                       7               4
f2       9                               6
f3                       4                               3
pl1                              2               10
pl2                      11              5               10       7     9
pl3              11              6               9
pl4      2                5                                9      8
pl5              5
pl6      10              9                               6        8     5
pl7              10               9               6                     ;

parameter capacity(NODES) / f1 100,f2 42,f3 55,pl1 72,pl2 28,pl3 55,pl4 28,pl5 72,pl6 28,pl7 80,B1 100,B2 55 /;

parameter duration(CONTRACTPOOLS) / pl2 5,pl5 2 /;

parameter fixcost(POOLS) / pl1 22,pl2 7,pl3 20,pl4 7,pl5 23,pl6 7,pl7 20 /;

parameter revenue(BLENDS) /
B1 68,B2 83 /;

parameter initialinv(NODES) / B1 36,B2 34 /;

table flowlbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     B1      B2
f1                       9               7
f2       9                               9
f3                       7                               6
pl1                              7               5
pl2                      5               6               7       9       8
pl3              5               5               6
pl4      7               5                               6       7
pl5              6
pl6      5               6                               5       9       9
pl7              7               6               5                       ;

table flowupbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     B1      B2
f1                       100             100
f2       42                              42
f3                       55                              55
pl1                              72              72
pl2                      55              72              80      28      28
pl3              55              55              55
pl4      72              55                              80      28
pl5              72
pl6      72              55                              80      28      28
pl7              80              80              80                        ;

table prodrate(INPUTS,FullHorizon)
         1       2       3       4       5       6       7       8       9       10
f1       20      17      12      19      16      19      23      20      11      5
f2       19      30      8       10      25      22      18      6       14      9
f3       31      23      25      17      12      10      14      16      20      11  ;

table demand(BLENDS,FullHorizon)
         1       2       3       4       5       6       7       8       9       10
B1       24      12      11      13      17      15      17      11      18      23
B2       13      21      16      16      13      17      16      18      21      14  ;

table speclevel(INPUTS,SPECS)
                 sp1     sp2
f1               0.61    0.17
f2               0.29    0.42
f3               0.43    0.33  ;

table minspec(BLENDS,SPECS)
                 sp1     sp2
B1               0.46    0.19
B2               0.43    0.24  ;

table maxspec(BLENDS,SPECS)
                 sp1     sp2
B1               0.58    0.29
B2               0.54    0.35  ;

$include xmodel.gms
