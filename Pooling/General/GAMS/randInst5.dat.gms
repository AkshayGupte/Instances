$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3,pl4,pl5,pl6,pl7/;
set ARCS(NODES,NODES) / f1.(pl1,pl2,pl3,pl5,pl7),
                f2.(pl2,pl3,pl4,pl5,pl6,pl7),
                f3.(pl4,pl5),
                f4.(pl1,pl3,pl4,pl5,pl6),
                f5.(pl1,pl2,pl4,pl5,pl6,pl7),
                f6.(pl1,pl5,pl6,pl7),
                f7.(pl1,pl2,pl4,pl6),
                f8.(pl3,pl5,pl7),
                pl1.(pl8,pl9,B4),
                pl2.(pl8,pl9,B3),
                pl3.(pl10,B1,B3,B4),
                pl4.(pl8,pl9,pl10,B1,B3),
                pl5.(pl9,pl10,B2,B3,B4),
                pl6.(pl8,pl9,pl10,B2),
                pl7.(pl9,B1,B5),
                pl8.(pl1,pl2,pl4,pl6,B2,B4,B5),
                pl9.(pl1,pl2,pl4,pl5,pl6,pl7,B1,B3,B4,B5),
                pl10.(pl3,pl4,pl5,pl6,B1,B2,B3,B5) /;

alias(NODES,NODES2);

set FullHorizon /0 * 15/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;
table varcost(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     pl8     pl9     pl10    B1      B2      B3      B4      B5
f1       12      13      13              15              15
f2               12      14      11      13      12      17
f3                               16      10
f4       17              10      11      11      17
f5       13      9               10      9       16      11
f6       10                              17      15      14
f7       15      11              14              15
f8                       14              10              11
pl1                                                              7       9                                       13
pl2                                                              9       8                               11
pl3                                                                              9       10              11      10
pl4                                                              7       11      5       15              14
pl5                                                                      6       8               9       10      17
pl6                                                              7       6       5               16
pl7                                                                      5               15                              11
pl8      7       9               7               7                                               10              10      12
pl9      9       8               11      6       6       5                               14              17      13      12
pl10                     9       5       8       5                                       17      11      11              11;

parameter capacity(NODES) / f1 51,f2 100,f3 32,f4 40,f5 32,f6 51,f7 51,f8 51,pl1 55,pl2 63,pl3 51,pl4 63,pl5 42,pl6 51,pl7 51,pl8 60,pl9 75,pl10 80,B1 70,B2 90,B3 90,B4 90,B5 73 /;

parameter duration(CONTRACTPOOLS) / pl1 5,pl2 8,pl3 8,pl4 5,pl5 8,pl6 5,pl7 2 /;

parameter fixcost(POOLS) / pl1 144,pl2 138,pl3 127,pl4 116,pl5 120,pl6 149,pl7 125,pl8 133,pl9 120,pl10 130 /;

parameter revenue(BLENDS) /
B1 40,B2 43,B3 41,B4 44,B5 39 /;

parameter initialinv(NODES) / B1 31,B2 33,B3 20,B4 33,B5 39 /;

table flowlbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     pl8     pl9     pl10    B1      B2      B3      B4      B5
f1       9       5       9               5               9
f2               8       5       5       8       9       7
f3                               7       9
f4       8               9       6       8       5
f5       7       9               8       7       5       5
f6       8                               9       8       6
f7       9       7               7               6
f8                       9               6               9
pl1                                                              5       3                                       6
pl2                                                              2       4                               8
pl3                                                                              5       9               9       9
pl4                                                              2       4       4       7               9
pl5                                                                      4       4               9       7       8
pl6                                                              5       5       5               6
pl7                                                                      3               9                               7
pl8      5       2               2               5                                               5               7       5
pl9      3       4               4       4       5       3                               9               6       9       6
pl10                     5       4       4       5                                       7       7       9               9;

table flowupbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     pl8     pl9     pl10    B1      B2      B3      B4      B5
f1       51      51      51              42              51
f2               63      51      63      42      51      51
f3                               32      32
f4       40              40      40      40      40
f5       32      32              32      32      32      32
f6       51                              42      51      51
f7       51      51              51              51
f8                       51              42              51
pl1                                                              55      55                                      55
pl2                                                              60      63                              63
pl3                                                                              51      51              51      51
pl4                                                              60      63      63      63              63
pl5                                                                      42      42              42      42      42
pl6                                                              51      51      51              51
pl7                                                                      51              51                              51
pl8      55.5    60              60              51                                              60              60      60
pl9      55.5    63              63      42      51      51                              70              75      75      73
pl10                     51      63      42      51                                      70      80      80              73  ;

table prodrate(INPUTS,FullHorizon)
         1       2       3       4       5       6       7       8       9       10      11      12      13      14      15
f1       33      20      33      26      21      34      17      21      12      23      22      16      18      12      10
f2       22      31      33      17      29      28      13      10      22      10      17      11      16      13      18
f3       15      34      32      31      34      19      17      19      12      15      11      13      17      10      15
f4       25      26      29      34      33      15      20      12      21      13      22      13      22      14      21
f5       24      16      26      32      27      33      17      20      22      20      13      23      15      18      16
f6       19      21      29      23      34      15      11      20      13      15      10      14      12      19      10
f7       17      30      16      23      29      19      20      21      11      16      13      19      19      22      16
f8       26      25      15      17      23      22      16      13      18      20      16      11      17      18      23  ;

table demand(BLENDS,FullHorizon)
         1       2       3       4       5       6       7       8       9       10      11      12      13      14      15
B1       15      16      11      18      16      18      29      22      21      20      21      21      23      25      22
B2       15      18      16      13      10      16      20      21      19      23      27      24      24      18      25
B3       11      9       18      17      10      19      28      21      19      25      20      28      21      19      23
B4       15      18      9       15      12      18      18      19      29      25      22      23      18      19      25
B5       19      20      15      15      9       18      21      25      19      24      19      25      27      27      19  ;

table speclevel(INPUTS,SPECS)
                 sp1     sp2     sp3     sp4
f1               0.2     0.42    0.58    0.41
f2               0.65    0.31    0.74    0.39
f3               0.39    0.47    0.42    0.23
f4               0.47    0.29    0.63    0.3
f5               0.2     0.47    0.36    0.29
f6               0.52    0.37    0.21    0.27
f7               0.71    0.23    0.62    0.69
f8               0.35    0.57    0.53    0.63  ;

table minspec(BLENDS,SPECS)
                 sp1     sp2     sp3     sp4
B1               0.25    0.31    0.41    0.31
B2               0.35    0.3     0.38    0.23
B3               0.27    0.25    0.44    0.31
B4               0.33    0.31    0.32    0.26
B5               0.25    0.36    0.41    0.23  ;

table maxspec(BLENDS,SPECS)
                 sp1     sp2     sp3     sp4
B1               0.4     0.57    0.68    0.51
B2               0.65    0.52    0.76    0.41
B3               0.64    0.45    0.67    0.68
B4               0.43    0.43    0.67    0.38
B5               0.46    0.57    0.55    0.51  ;

$include xmodel.gms
