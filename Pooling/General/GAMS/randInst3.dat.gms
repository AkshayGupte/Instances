$eolcom #

set NODES /f1*f2, pl1*pl5, B1*B2/;
set SPECS /sp1*sp2/;
set INPUTS(NODES) /f1*f2/;
set BLENDS(NODES) /B1*B2/;
set POOLS(NODES) /pl1*pl5/;
set CONTRACTPOOLS(POOLS) /pl2,pl5/;
set ARCS(NODES,NODES) / f1.(pl1,pl5),
                f2.(pl3,pl5),
                pl1.(pl2,pl4),
                pl2.(pl1,pl3,B1),
                pl3.(pl2,pl4,B1),
                pl4.(pl1,pl3,pl5,B2),
                pl5.(pl4,B1,B2) /;

alias(NODES,NODES2);

set FullHorizon /0 * 20/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;

table varcost(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     B1     B2
f1       6                               4
f2                       9               6
pl1              10              2
pl2      10              4                       7
pl3              4               6               13
pl4      2               6               9       	8
pl5                              5               10     14;

parameter capacity(NODES) / f1 42,f2 55,pl1 72,pl2 27,pl3 72,pl4 27,pl5 80,B1 55,B2 55 /;

parameter duration(CONTRACTPOOLS) / pl2 8,pl5 3 /;

parameter fixcost(POOLS) / pl1 20,pl2 7,pl3 21,pl4 7,pl5 23 /;

parameter revenue(BLENDS) /
B1 106,B2 69 /;

parameter initialinv(NODES) / B1 34,B2 47 /;

table flowlbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     B1      B2
f1       7                               6
f2                       7               9
pl1              8               8
pl2      8               8                       8
pl3              8               5               9
pl4      8               5               8               5
pl5                              8               8       5;

table flowupbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     B1      B2
f1       42                              42
f2                       55              55
pl1              72              72
pl2      72              72                      27
pl3              72              72              72
pl4      72              72              80              27
pl5                              80              80      80  ;

table prodrate(INPUTS,FullHorizon)
         1       2       3       4       5       6       7       8       9       10      11      12      13      14      15      16      17      18      19      20
f1       22      19      24      26      13      17      19      12      20      30      30      27      18      19      20      12      15      16      10      10
f2       34      27      18      23      20      15      21      19      26      34      32      29      20      22      16      14      18      21      10      14  ;

table demand(BLENDS,FullHorizon)
         1       2       3       4       5       6       7       8       9       10      11      12      13      14      15      16      17      18      19      20
B1       12      22      22      21      16      24      17      18      16      22      14      16      15      12      18      21      11      18      10      10
B2       24      23      15      22      23      17      20      14      23      21      22      15      23      20      13      22      11      21      12      19  ;

table speclevel(INPUTS,SPECS)
                 sp1     sp2
f1               0.15    0.42
f2               0.17    0.25  ;

table minspec(BLENDS,SPECS)
                 sp1     sp2
B1               0.16    0.27
B2               0.15    0.25  ;

table maxspec(BLENDS,SPECS)
                 sp1     sp2
B1               0.17    0.39
B2               0.168   0.4  ;

$include xmodel.gms
