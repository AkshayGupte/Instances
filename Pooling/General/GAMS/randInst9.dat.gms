
$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3,pl4,pl5/;
set ARCS(NODES,NODES) / f1.(pl1,pl4,pl5),
                f2.(pl3,pl5),
                f3.(pl1,pl2,pl3,pl4,pl5),
                f4.(pl1,pl2,pl4),
                f5.(pl2,pl4),
                f6.(pl1,pl2,pl3,pl4,pl5),
                f7.(pl1,pl2,pl3,pl4,pl5),
                f8.(pl1,pl2,pl3,pl4),
                pl1.(pl6,pl9,B3,B4),
                pl2.(pl6,pl7,pl8,pl9),
                pl3.(pl8,pl9,pl10,B3),
                pl4.(pl6,pl9,pl10,B5),
                pl5.(pl9,pl10,B2),
                pl6.(pl1,pl2,pl4,B1,B3),
                pl7.(pl2,B1,B2,B3,B4,B5),
                pl8.(pl2,pl3,B2,B3,B4,B5),
                pl9.(pl1,pl2,pl3,pl4,pl5,B1,B2),
                pl10.(pl3,pl4,pl5,B1,B2,B5) /;

alias(NODES,NODES2);

set FullHorizon /0 * 15/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;
table varcost(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     pl8     pl9     pl10    B1      B2      B3      B4      B5
f1       17                      15      14
f2                       14              15
f3       15      11      16      12      11
f4       14      16              12
f5               12              13
f6       11      9       9       16      9
f7       15      9       13      14      11
f8       10      15      10      12
pl1                                              6                       11                              13      9
pl2                                              10      10      10      6
pl3                                                              7       6       5                       17
pl4                                              9                       5       8                                       9
pl5                                                                      11      6               17
pl6      6       10              9                                                       10              14
pl7              10                                                                      11      12      9       17      15
pl8              10      7                                                                       12      10      16      9
pl9      11      6       6       5       11                                              13      14
pl10                     5       8       6                                               14      16                      12;

parameter capacity(NODES) / f1 78,f2 78,f3 56,f4 56,f5 56,f6 67,f7 49,f8 51,pl1 42,pl2 55,pl3 42,pl4 55,pl5 55,pl6 64,pl7 68,pl8 75,pl9 75,pl10 68,B1 90,B2 73,B3 82,B4 90,B5 82 /;

parameter duration(CONTRACTPOOLS) / pl1 2,pl2 5,pl3 8,pl4 2,pl5 2 /;

parameter fixcost(POOLS) / pl1 135,pl2 143,pl3 118,pl4 124,pl5 135,pl6 119,pl7 140,pl8 121,pl9 115,pl10 116 /;

parameter revenue(BLENDS) /
B1 45,B2 46,B3 40,B4 47,B5 41 /;

parameter initialinv(NODES) / B1 35,B2 34,B3 18,B4 34,B5 34 /;

table flowlbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     pl8     pl9     pl10    B1      B2      B3      B4      B5
f1       7                       8       9
f2                       9               7
f3       6       5       5       8       6
f4       6       7               5
f5               9               5
f6       8       5       5       6       6
f7       7       9       5       7       6
f8       9       6       6       7
pl1                                              5                       5                               7       9
pl2                                              4       2       4       4
pl3                                                              2       2       3                       6
pl4                                              5                       5       4                                       8
pl5                                                                      2       5               6
pl6      5       4               5                                                       7               7
pl7              2                                                                       7       5       5       7       7
pl8              4       2                                                                       5       9       8       8
pl9      5       4       2       5       2                                               6       5
pl10                     3       4       5                                               8       9                       7;

table flowupbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     pl8     pl9     pl10    B1      B2      B3      B4      B5
f1       42                      55      55
f2                       42              55
f3       42      55      42      55      55
f4       42      55              55
f5               55              55
f6       42      55      42      55      55
f7       42      49      42      49      49
f8       42      51      42      51
pl1                                              42                      42                              42      42
pl2                                              55      55      55      55
pl3                                                              42      42      42                      42
pl4                                              55                      55      55                                      55
pl5                                                                      55      55              55
pl6      42      55              55                                                      64              64
pl7              55                                                                      68      68      68      68      68
pl8              55      42                                                                      73      75      75      75
pl9      42      55      42      55      55                                              75      73
pl10                     42      55      55                                              68      68                      68  ;

table prodrate(INPUTS,FullHorizon)
         1       2       3       4       5       6       7       8       9       10      11      12      13      14      15
f1       22      30      31      19      33      23      14      15      20      15      23      15      17      10      23
f2       22      28      18      19      30      20      18      15      10      22      14      17      11      16      21
f3       29      31      33      27      31      27      12      14      23      13      19      12      21      18      19
f4       26      16      24      17      22      15      19      17      16      12      21      12      10      14      13
f5       23      24      22      30      24      32      12      14      15      10      12      19      19      20      13
f6       33      22      28      28      25      18      15      17      22      22      17      14      14      21      21
f7       16      16      25      34      23      34      13      13      11      18      11      22      23      21      20
f8       18      34      22      15      17      27      23      10      17      11      12      12      10      13      21  ;

table demand(BLENDS,FullHorizon)
         1       2       3       4       5       6       7       8       9       10      11      12      13      14      15
B1       16      19      8       16      18      8       21      24      22      25      29      20      24      27      23
B2       20      14      8       14      17      12      18      18      27      28      28      29      24      19      20
B3       10      8       12      20      21      13      20      24      25      25      19      29      22      21      28
B4       18      16      18      20      11      14      18      23      29      19      25      20      21      18      19
B5       15      19      8       19      12      20      26      29      29      22      18      29      29      25      18  ;

table speclevel(INPUTS,SPECS)
                 sp1     sp2     sp3     sp4
f1               0.39    0.56    0.71    0.21
f2               0.2     0.45    0.29    0.73
f3               0.31    0.59    0.54    0.31
f4               0.46    0.7     0.54    0.66
f5               0.51    0.55    0.69    0.45
f6               0.54    0.69    0.5     0.56
f7               0.62    0.68    0.54    0.42
f8               0.22    0.44    0.32    0.45  ;

table minspec(BLENDS,SPECS)
                 sp1     sp2     sp3     sp4
B1               0.37    0.54    0.38    0.4
B2               0.37    0.54    0.38    0.37
B3               0.2     0.44    0.29    0.53
B4               0.32    0.51    0.37    0.46
B5               0.42    0.55    0.58    0.42  ;

table maxspec(BLENDS,SPECS)
                 sp1     sp2     sp3     sp4
B1               0.6     0.68    0.68    0.69
B2               0.54    0.67    0.66    0.69
B3               0.4     0.65    0.48    0.8
B4               0.41    0.65    0.49    0.63
B5               0.51    0.67    0.71    0.53  ;

$include xmodel.gms
