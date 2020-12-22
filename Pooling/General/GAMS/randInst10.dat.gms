
$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3,pl4,pl5,pl6/;
set ARCS(NODES,NODES) / f1.(pl1,pl2,pl4,pl5,pl6),
                f2.(pl2,pl3,pl5),
                f3.(pl1,pl3,pl4,pl5,pl6),
                f4.(pl1,pl2,pl3,pl4,pl6),
                f5.(pl3,pl4,pl6),
                f6.(pl1,pl2,pl4,pl5,pl6),
                f7.(pl2,pl3,pl4),
                f8.(pl1,pl2,pl5,pl6),
                pl1.(pl7,pl8,pl9,pl10,B2),
                pl2.(pl9),
                pl3.(B1,B3,B4),
                pl4.(pl7,pl8,pl9,pl10,B1),
                pl5.(pl10,B4,B5),
                pl6.(pl7,pl8,pl10),
                pl7.(pl1,pl4,pl6,B4,B5),
                pl8.(pl1,pl4,pl6,B1,B2,B3,B4),
                pl9.(pl1,pl2,pl4,B1,B3,B4),
                pl10.(pl1,pl4,pl5,pl6,B1,B3,B4,B5) /;

alias(NODES,NODES2);

set FullHorizon /0 * 15/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;
table varcost(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     pl8     pl9     pl10    B1      B2      B3      B4      B5
f1       13      14              15      14      10
f2               16      9               9
f3       17              16      9       11      15
f4       10      15      14      14              16
f5                       17      14              13
f6       17      15              13      16      9
f7               17      17      12
f8       12      11                      14      10
pl1                                                      6       11      7       8               14
pl2                                                                      7
pl3                                                                                      16              15      13
pl4                                                      8       8       8       5       9
pl5                                                                              6                               9       12
pl6                                                      11      5               10
pl7      6                       8               11                                                              17      15
pl8      11                      8               5                                       17      15      11      13
pl9      7       7               8                                                       9               12      15
pl10     8                       5       6       10                                      10              9       12      11;

parameter capacity(NODES) / f1 40,f2 40,f3 67,f4 51,f5 51,f6 51,f7 67,f8 40,pl1 42,pl2 55,pl3 42,pl4 51,pl5 51,pl6 63,pl7 73,pl8 82,pl9 80,pl10 85,B1 64,B2 90,B3 73,B4 79,B5 82 /;

parameter duration(CONTRACTPOOLS) / pl1 5,pl2 8,pl3 5,pl4 2,pl5 5,pl6 2 /;

parameter fixcost(POOLS) / pl1 140,pl2 140,pl3 134,pl4 111,pl5 146,pl6 141,pl7 145,pl8 113,pl9 133,pl10 131 /;

parameter revenue(BLENDS) /
B1 42,B2 36,B3 37,B4 39,B5 48 /;

parameter initialinv(NODES) / B1 38,B2 37,B3 39,B4 32,B5 34 /;

table flowlbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     pl8     pl9     pl10    B1      B2      B3      B4      B5
f1       8       7               9       7       8
f2               5       8               7
f3       9               6       9       7       9
f4       8       7       6       7               9
f5                       7       7               8
f6       9       8               6       7       7
f7               5       7       7
f8       8       7                       7       8
pl1                                                      2       2       4       2               9
pl2                                                                      3
pl3                                                                                      7               5       9
pl4                                                      2       3       3       5       8
pl5                                                                              5                               8       6
pl6                                                      2       3               5
pl7      2                       2               2                                                               9       6
pl8      2                       3               3                                       7       6       5       5
pl9      4       3               3                                                       5               5       9
pl10     2                       5       5       5                                       9               8       6       7;

table flowupbd(NODES,NODES2)
         pl1     pl2     pl3     pl4     pl5     pl6     pl7     pl8     pl9     pl10    B1      B2      B3      B4      B5
f1       40      40              40      40      40
f2               40      40              40
f3       42              42      51      51      63
f4       42      51      42      51              51
f5                       42      51              51
f6       42      51              51      51      51
f7               55      42      51
f8       40      40                      40      40
pl1                                                      42      42      42      42              42
pl2                                                                      55
pl3                                                                                      42              42      42
pl4                                                      51      51      51      51      51
pl5                                                                              51                              51      51
pl6                                                      63      63              63
pl7      42                      51              63                                                              73      73
pl8      42                      51              63                                      64      82      73      79
pl9      42      55              51                                                      64              73      79
pl10     42                      51      51      63                                      64              73      79      82  ;

table prodrate(INPUTS,FullHorizon)
         1       2       3       4       5       6       7       8       9       10      11      12      13      14      15
f1       16      24      24      21      18      34      18      13      20      21      11      13      15      11      13
f2       26      22      32      33      27      21      12      16      19      18      20      19      22      20      19
f3       30      28      30      25      15      31      14      13      19      18      20      23      11      12      19
f4       33      32      18      16      19      20      16      14      20      21      20      22      22      17      14
f5       18      30      24      22      33      22      13      20      13      23      12      17      11      13      18
f6       26      22      31      32      27      30      15      19      14      12      12      16      15      23      15
f7       15      18      31      28      22      16      10      13      13      20      23      15      13      19      21
f8       16      18      23      22      23      27      12      23      21      12      11      21      15      23      11  ;

table demand(BLENDS,FullHorizon)
         1       2       3       4       5       6       7       8       9       10      11      12      13      14      15
B1       21      17      20      10      13      20      18      20      23      20      28      29      19      26      25
B2       17      20      9       17      16      15      26      29      18      20      27      22      29      28      23
B3       20      19      21      11      17      9       19      24      21      26      19      24      25      27      21
B4       13      19      10      10      15      8       28      19      19      26      23      21      25      20      20
B5       14      20      18      21      10      16      26      25      21      28      28      21      22      26      26  ;

table speclevel(INPUTS,SPECS)
                 sp1     sp2     sp3     sp4
f1               0.29    0.74    0.43    0.54
f2               0.6     0.64    0.25    0.47
f3               0.49    0.61    0.22    0.21
f4               0.53    0.2     0.46    0.27
f5               0.21    0.74    0.45    0.34
f6               0.38    0.52    0.39    0.2
f7               0.67    0.74    0.53    0.66
f8               0.39    0.62    0.62    0.54  ;

table minspec(BLENDS,SPECS)
                 sp1     sp2     sp3     sp4
B1               0.41    0.58    0.39    0.36
B2               0.45    0.25    0.45    0.29
B3               0.38    0.61    0.28    0.37
B4               0.35    0.56    0.24    0.31
B5               0.46    0.56    0.24    0.31  ;

table maxspec(BLENDS,SPECS)
                 sp1     sp2     sp3     sp4
B1               0.55    0.81    0.55    0.59
B2               0.55    0.34    0.55    0.37
B3               0.54    0.76    0.38    0.48
B4               0.58    0.71    0.51    0.45
B5               0.58    0.71    0.3     0.44  ;

$include xmodel.gms
