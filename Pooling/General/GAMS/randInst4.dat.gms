$eolcom #

set NODES /f1*f2, pl1*pl8, B1*B2/;
set SPECS /sp1*sp2/;
set INPUTS(NODES) /f1*f2/;
set BLENDS(NODES) /B1*B2/;
set POOLS(NODES) /pl1*pl8/;
set CONTRACTPOOLS(POOLS) /pl2,pl4,pl7/;
set ARCS(NODES,NODES) / f1.(pl1,pl3,pl5,pl8),
                f2.(pl1,pl3,pl5,pl7,pl8),
                pl1.(pl2,pl4,pl6,B2),
                pl2.(pl1,pl3,pl5,pl7,B1,B2),
                pl3.(pl2,B1),
                pl4.(pl1,pl5,pl7,pl8,B2),
                pl5.(pl2,pl4,pl6,B2),
                pl6.(pl1,pl5,pl7,pl8,B1),
                pl7.(pl2,pl4,pl6,B1),
                pl8.(pl4,pl6) /;

alias(NODES,NODES2);

set FullHorizon /0 * 14/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;

table varcost(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     pl8     B1     B2
f1       7               3               6                       2
f2       9               4               6               2       8
pl1              3               2               7                              10
pl2      3               8               5               5               11     14
pl3              8                                                       9
pl4      2                               8               9       6               9
pl5              5               8               3                              13
pl6      7                               3               6       8       12
pl7              5               9               6                       15
pl8                              6               8                               ;

parameter capacity(NODES) / f1 47,f2 35,pl1 72,pl2 25,pl3 80,pl4 29,pl5 72,pl6 27,pl7 80,pl8 72,B1 65,B2 55 /;

parameter duration(CONTRACTPOOLS) / pl2 8,pl4 6,pl7 3 /;

parameter fixcost(POOLS) / pl1 20,pl2 7,pl3 23,pl4 7,pl5 22,pl6 7,pl7 20,pl8 23 /;

parameter revenue(BLENDS) /
B1 88,B2 79 /;

parameter initialinv(NODES) / B1 33,B2 41/;

table flowlbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     pl8     B1      B2
f1       5               9               8                       5
f2       8               7               9               6       9
pl1              9               6               6                               9
pl2      9               7               9               6               7       6
pl3              7                                                       9
pl4      6                               5               9       7               6
pl5              9               5               5                               6
pl6      6                               5               9       8       5
pl7              6               9               9                       6
pl8                              7               8                               ;

table flowupbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     pl8     B1      B2
f1       47              47              47                      47
f2       35              35              35              35      35
pl1              72              72              72                              72
pl2      72              80              72              80              25      25
pl3              80                                                      80
pl4      72                              72              80      72              29
pl5              72              72              72                              72
pl6      72                              72              80      72      27
pl7              80              80              80                      80
pl8                              72              72                                ;

table prodrate(INPUTS,FullHorizon)
         1       2       3       4       5       6       7       8       9       10      11      12      13      14
f1       30      32      28      26      20      24      25      29      26      20      15      14      18      18
f2       34      35      25      22      16      20      22      17      21      23      20      22      16      16  ;

table demand(BLENDS,FullHorizon)
         1       2       3       4       5       6       7       8       9       10      11      12      13      14
B1       11      22      15      17      14      20      21      20      10      21      24      22      22      17
B2       23      18      12      17      23      17      11      12      18      19      18      13      18      24  ;

table speclevel(INPUTS,SPECS)
                 sp1     sp2
f1               0.58    0.33
f2               0.38    0.22  ;

table minspec(BLENDS,SPECS)
                 sp1     sp2
B1               0.47    0.25
B2               0.4     0.28  ;

table maxspec(BLENDS,SPECS)
                 sp1     sp2
B1               0.55    0.3
B2               0.51    0.31  ;

$include xmodel.gms
