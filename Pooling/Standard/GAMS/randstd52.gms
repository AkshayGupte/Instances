$ontext
	 randstd52 pooling problem data.
	 Author: Akshay Gupte, written from AMPL.
$offtext

$eolcom #

set i    /1 * 120/;
set s(i) /1 * 40/;
set t(i) /71 * 120/;
set k    /1 * 14/;


alias (i,j);

parameter c(i,j)
	 / 1.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 42
	   2.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 35
	   3.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 43
	   4.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 48
	   5.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 43
	   6.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 47
	   7.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 35
	   8.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 41
	   9.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 42
	   10.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 40
	   11.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 44
	   12.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,57,58,59,60,61,62,63,65,66,67,68,69,70) 	 42
	   13.(41,42,43,44,45,46,47,48,50,51,52,53,54,55,57,58,59,60,61,62,63,65,66,67,68,69,70) 	 46
	   14.(41,42,43,44,45,46,47,48,50,51,52,53,54,55,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 22
	   15.(41,42,43,44,46,47,48,50,51,52,53,54,55,56,58,59,60,61,62,65,66,68,69) 	 42
	   16.(41,42,44,48,50,52,54,58,59,60,62,65,66,69) 	 49
	   17.(41,42,49) 	 34
	   18.(41,42) 	 44
	   19.(41,42,46) 	 44
	   20.(41,42) 	 38
	   21.(41,45,57) 	 41
	   22.(45,49,61,70) 	 40
	   23.(41,42) 	 37
	   24.(41,42) 	 38
	   25.(41,42,64) 	 20
	   26.(41,67) 	 46
	   27.(41,42) 	 40
	   28.(56,70) 	 31
	   29.(41,42,56) 	 45
	   30.(41,42) 	 41
	   31.(41,42,64) 	 41
	   32.(41,42) 	 41
	   33.(49,53,56) 	 42
	   34.(43,63,68) 	 47
	   35.(49,55) 	 40
	   36.(41,42,64) 	 41
	   37.(47,51,56,63) 	 37
	   38.(57,67) 	 40
	   39.(41,42,64) 	 34
	   40.(41,42) 	 25
	   (42,45,50,52,59,60,62,66,67,69,70).71 	 -22
	   (41,43,46,49,50,51,52,58,60,65,66,68).72 	 -80
	   (41,45,47,48,50,53,54,61,63,69).73 	 -60
	   (41,42,46,50,52,58,61,62,65,68).74 	 -96
	   (44,47,59,62,64,66,69).75 	 -75
	   (42,43,45,51,54,55,60,63,66,67,70).76 	 -98
	   (45,47,52,53,54,55,56,58,59,61,62,64,65,66,67,68,69).77 	 -52
	   (41,49,50,51,56,58,69).78 	 -98
	   (42,43,45,47,49,50,55,57,65,70).79 	 -60
	   (42,53,56,64,69).80 	 -51
	   (43,45,46,47,48,49,55,57,59,61,63,64,68,70).81 	 -31
	   (41,43,44,45,48,49,50,52,62,64,65,70).82 	 -55
	   (41,46,49,50,53,54,55,57,58,59,67,69,70).83 	 -28
	   (42,45,49,54,56,57,58,61,66).84 	 -15
	   (41,43,45,48,52,54,55,56,57,58,61,62,68,69).85 	 -28
	   (42,44,46,47,48,49,50,56,58,62,63,65,66,68).86 	 -43
	   (49,52,53,56,63,64,66,68,69).87 	 -20
	   (41,42,45,49,50,51,53,54,55,56,58,59,60,62,64,65,67,68,69).88 	 -37
	   (45,47,50,51,54,55,60,61,63,66,67,70).89 	 -62
	   (42,50,52,57,58,60,61,62,66,67).90 	 -61
	   (41,42,44,46,48,49,51,53,54,56,57,58,59,61,64,65,67,68).91 	 -53
	   (43,47,50,51,52,55,56,57,61,62,63,65,66,67).92 	 -56
	   (44,49,51,53,55,59,61,63,66,67,68,69).93 	 -50
	   (41,43,45,46,49,50,53,54,58,61,62,68,70).94 	 -76
	   (41,44,49,50,51,52,54,58,61,62,63,66,69).95 	 -85
	   (41,42,44,46,47,49,53,54,65,66,68).96 	 -25
	   (43,45,47,48,52,55,59,62,64,66,67,69).97 	 -61
	   (43,48,50,51,52,58,59,62,64,68,70).98 	 -62
	   (44,46,48,49,51,59,62,63,64,65,66).99 	 -77
	   (41,43,48,51,54,55,58,59,64,65,66,68,69,70).100 	 -41
	   (41,44,46,47,51,52,53,54,55,59,63,64,65,69,70).101 	 -81
	   (41,43,45,50,52,55,56,58,69,70).102 	 -51
	   (42,47,48,49,50,52,54,55,57,58,59,63,65,66,68,69,70).103 	 -61
	   (41,43,45,48,49,53,55,58,63,65,66,69).104 	 -85
	   (41,42,43,46,50,52,53,56,58,60,62,64,66,70).105 	 -89
	   (41,46,52,53,54,58,64,65,66,67,70).106 	 -83
	   (41,42,46,48,49,50,55,61,62,63,64,68).107 	 -46
	   (41,44,49,51,56,61,64,70).108 	 -34
	   (41,50,51,53,55,56,58,59,62,67,69).109 	 -70
	   (41,43,45,47,48,49,50,51,52,53,63,65,66,67,68,70).110 	 -64
	   (43,46,48,49,53,54,55,56,57,58,60,62,63,65,69).111 	 -98
	   (47,49,53,56,57,60,61,62,63,66,67,69).112 	 -70
	   (41,42,43,47,48,49,50,54,56,57,62,64,66,69).113 	 -91
	   (43,49,51,52,53,54,62,63,65,66,69).114 	 -69
	   (42,43,45,47,50,52,54,56,58,60,62,64,65,69).115 	 -53
	   (43,44,45,46,49,53,55,58,60,63,70).116 	 -75
	   (44,46,55,56,57,58,60,62,65,66,69).117 	 -73
	   (42,43,44,45,48,49,51,52,54,57,64,70).118 	 -38
	   (42,43,46,47,57,60,62,63,65,67).119 	 -74
	   (51,53,55,57,58,60,61,62,64,66,68,70).120 	 -42
	   2.76  -63 , 2.95  -50 , 2.99  -42 , 2.103  -26 , 2.106  -48 , 
	   3.73  -17 , 4.71  26 , 4.74  -48 , 5.76  -55 , 5.79  -17 , 
	   5.105  -46 , 5.113  -48 , 7.110  -29 , 8.95  -44 , 8.104  -44 , 
	   9.95  -43 , 10.75  -35 , 10.80  -11 , 10.98  -22 , 11.89  -18 , 
	   11.118  6 , 12.106  -41 , 12.107  -4 , 13.88  9 , 14.71  0 , 
	   14.108  -12 , 14.115  -31 , 14.119  -52 , 16.77  -3 , 16.111  -49 , 
	   18.98  -18 , 19.111  -54 , 21.110  -23 , 21.120  -1 , 22.114  -29 , 
	   23.82  -18 , 23.84  22 , 23.107  -9 , 25.87  0 , 25.109  -50 , 
	   26.108  12 , 26.117  -27 , 27.94  -36 , 27.98  -22 , 27.99  -37 , 
	   28.96  6 , 28.118  -7 , 29.85  17 , 29.93  -5 , 29.100  4 , 
	   29.113  -46 , 29.114  -24 , 30.71  19 , 30.96  16 , 30.100  0 , 
	   31.74  -55 , 31.98  -21 , 31.102  -10 , 32.113  -50 , 33.72  -38 , 
	   33.74  -54 , 33.102  -9 , 34.75  -28 , 34.102  -4 , 34.105  -42 , 
	   34.115  -6 , 35.96  15 , 35.110  -24 , 36.95  -44 , 37.87  17 , 
	   38.73  -20 , 39.115  -19  /;

parameter a(i,j);
a(i,j) = 1$(c(i,j) ne 0);
a('14','71') = 1; a('25','87') = 1; a('30','100') = 1; 

table qu(i,k) 
                     1           2           3           4           5           6           7           8           9          10          11          12          13          14
1                36.15       18.03       45.49       54.36       55.52       53.05       44.15       59.50       11.84       29.24       35.01       14.75       60.60       50.00
2                25.69       72.49       65.02       69.07       67.73       59.58       54.07       55.69       35.60       41.68       65.25       46.64       69.69       70.93
3                23.71       21.94       40.60       59.22       71.87       37.99       35.80       43.45       49.74       43.88       41.15       44.91       45.50       68.29
4                50.09       69.53       59.73       36.13       37.62       37.34       56.70       16.47       65.36       36.67       26.44       40.90       19.46       38.66
5                47.54       33.61       37.31       27.39       11.62       46.84       47.25       69.72       17.47       73.23        8.25       12.04       29.96       68.11
6                35.74       60.96       68.13       51.74       64.47        8.92       60.99       62.57       46.80       35.31       35.62       38.31       19.76       27.22
7                27.48       48.78       68.19       69.96       27.56       12.61       60.41       42.13       17.49       19.34       40.31       74.40       50.02       69.23
8                20.24       25.42       67.09       63.69       38.60       12.57       56.84       36.98       53.90       53.21       36.56       45.89       21.03       31.15
9                33.01       55.91       48.71       61.26       64.76       12.26       73.52       27.64       70.08       45.58       38.15       17.65       49.79       12.21
10               42.22       72.28       26.33       36.69       39.41       17.26       46.17       70.46       31.41       36.71       32.39       32.44       38.17       29.23
11               16.35       17.88       16.71       68.99       73.09       47.80       63.76       43.77       10.89       45.82       47.13       39.34       32.16       29.36
12               31.16       48.12       55.13       53.00       39.90       71.43       46.97       39.92       15.07       19.82       27.38       65.53       57.19       69.00
13               47.05       30.06       58.20       39.09       60.20       71.08       25.15       47.91       62.81       50.59       14.60       36.91       23.37       49.05
14               66.65       15.92       32.66       35.16       64.75       29.58       25.37       19.16       43.36       37.93       10.32       32.82       45.49       35.99
15               63.98       69.95       10.49       35.30       25.53       61.94       41.37       61.03       64.75       16.54       63.88       40.71        9.33       29.43
16               12.87       21.85       46.28       61.80       61.69       30.23       25.01       64.08       14.30       74.31       31.75       23.99       21.58        9.69
17               18.38       63.93       19.74       43.85       44.27       49.93       58.76       19.63       36.11       17.36       42.27       11.33       44.22       24.81
18               37.28       45.68       67.20       10.85       43.11       22.76       66.71       71.38       43.42       49.46       18.47       32.51       37.04       38.93
19               37.49       34.82       26.38       28.07       38.32       52.44       12.00       18.94       58.06       17.73       34.78       10.86       69.98       53.81
20               20.29       26.92       72.45       28.73       21.75       35.01       68.99       71.74       65.40       60.76       10.29       15.89       26.93       33.19
21               30.65       35.76       28.07        9.13       27.69       54.90       64.35       60.54       54.52       34.66       59.25       60.72       67.05       37.99
22               65.41       73.35       64.66       50.41       61.39       59.22       52.11       13.94       18.68       27.12       45.95       17.62       59.78       74.22
23               26.11       36.96       12.04       46.05       64.43       66.40       57.67       74.28       72.68       32.68       12.06       62.76       69.52       39.37
24                9.69       73.87       70.49       70.89       17.53       20.40       50.72       24.06       53.63       36.71       72.89       21.92       60.42       34.36
25               31.31       46.59       18.22       71.22       50.98       72.84       12.21       59.55       47.21       69.87       46.73       26.07       17.92       54.27
26               44.93       39.43       53.30       37.13       65.79       48.36       52.08       56.06       11.95       10.24       31.74       56.78       12.37       50.29
27               41.54       60.13       50.48       67.47       19.58       61.09       65.58       57.55       71.84       42.60       37.96       26.62       68.28       64.84
28               21.01       73.73       43.01       61.13       25.44       41.74       71.50       36.63       33.66       11.89       67.76       31.10       15.68       20.82
29               29.63       71.47       37.13       35.31       49.79       29.39       13.32       55.98       46.53       23.36        9.22       32.89       21.49       51.50
30               46.88       58.17        9.11       71.62       35.80       40.42       48.04       62.16       36.28       26.97       55.79       62.36       69.54       19.91
31               19.84       28.22       35.73       58.12        8.89        8.25       74.31       35.40        8.30       67.60       37.16       10.12       36.97       63.73
32               21.87       26.06       38.76       55.62       59.08       55.65       37.09       53.12       67.17        8.62       67.11       63.62       72.52       21.26
33               23.81       50.46       58.50       33.18       53.38       54.00       47.70       15.05       52.41       44.70       29.86       71.70       11.89       74.59
34               47.22       31.39       25.16       24.43       14.53       20.91       46.60       60.92       23.84       16.87       13.10       71.12       69.44       61.15
35               52.94       32.37       10.30       35.30       12.15       14.60       70.00       14.77       63.83       68.51       74.34       73.21       49.62       62.33
36                8.38       51.56       20.50       44.90       13.01       58.77       61.60       51.38       22.77       70.55       46.30       60.08       63.60       34.86
37               48.61       63.98       17.73       70.23       48.13       27.62       31.05       55.51        9.61       54.62       11.21       31.01       54.45       54.85
38               65.66       15.93       22.61       42.00       54.75       58.95       23.48       35.15       36.55       36.65       28.38       30.72       51.92       53.34
39               57.79       50.13       70.52       47.96       72.79       45.04       11.04       38.78       14.47       57.12       45.95       62.26       55.19       68.92
40               66.77       52.72       51.59       50.60       10.60       17.39       33.56       51.53       61.49       46.90       32.16       45.24       73.04       37.51
71               34.00       28.57       54.25       49.97       61.90       55.52       26.71       55.40       44.03       61.18       22.80       34.04       24.14       34.68
72               60.09       66.48       65.20       64.46       65.78       65.56       66.88       66.85       65.41       66.88       66.91       66.96       65.74       67.13
73               36.31       26.11       40.90       53.08       64.70       34.12       32.28       46.01       37.03       52.90       29.95       36.91       40.21       38.73
74               23.10       31.29       37.93       59.08       13.27       12.47       74.31       36.21       12.22       67.78       38.21       13.07       39.99       64.13
75               59.99       65.24       63.47       64.10       65.78       65.56       66.88       63.41       63.07       66.88       58.73       66.96       62.72       63.84
76               60.09       66.48       65.20       64.46       65.78       65.56       66.88       66.85       65.41       66.88       66.91       66.96       65.74       66.80
77               59.99       66.36       63.47       64.10       65.78       65.56       66.88       63.41       63.07       66.88       66.91       66.96       62.72       67.13
78               60.09       66.48       65.20       64.46       65.78       65.56       66.88       66.85       65.41       66.88       66.91       66.96       65.74       67.13
79               47.80       68.45       51.09       51.88       58.11       50.47       57.51       20.58       34.03       29.48       44.46       18.25       55.45       52.41
80               60.09       66.48       65.20       64.46       65.78       65.56       66.88       66.85       65.41       66.88       65.60       66.96       65.74       67.13
81               28.45       72.36       65.22       67.34       66.36       58.65       55.27       54.19       39.93       42.52       63.36       46.96       67.06       69.18
82               63.50       69.79       16.61       36.69       28.43       61.22       44.47       61.70       64.79       21.84       63.65       43.44       11.11       32.92
83               60.09       66.48       65.20       64.46       65.78       65.56       66.88       66.85       65.41       66.88       66.91       66.96       65.74       67.13
84               38.27       21.48       46.07       55.12       56.69       53.83       45.66       60.37       15.22       32.17       35.97       19.22       61.66       51.74
85               25.23       51.48       59.52       34.22       54.47       54.94       49.13       19.73       53.55       46.15       31.09       71.93       15.16       74.59
86               50.03       71.52       22.94       39.50       38.08       32.40       45.28       67.81       43.55       32.83       44.76       36.62       31.71       32.08
87               59.99       66.36       63.47       64.10       65.78       65.56       66.88       63.41       63.07       66.88       66.91       66.96       62.72       67.13
88               22.96       28.93       67.47       64.27       40.35       13.83       58.40       39.94       55.36       53.95       39.30       48.42       22.78       33.17
89               27.43       51.03       68.10       69.95       28.72       13.97       61.17       42.52       18.01       19.99       43.40       73.62       51.38       69.58
90               60.09       66.48       65.20       64.46       65.78       65.56       66.88       66.85       65.41       66.88       65.60       66.96       65.74       66.80
91               48.08       35.18       46.39       33.80       32.09       53.72       43.08       62.81       31.10       60.13       14.44       26.16       28.32       61.57
92               48.14       67.51       61.99       42.35       45.92       31.63       58.07       31.49       60.20       38.40       30.77       42.77       21.42       39.09
93               27.17       39.07       61.01       63.15       48.71       15.84       63.37       36.61       60.35       51.81       39.66       38.39       32.88       28.70
94               45.43       34.87       30.02       27.67       25.22       21.23       46.38       59.50       29.82       21.04       16.76       64.95       63.92       56.97
95               60.09       66.48       65.20       64.46       65.78       65.56       66.88       66.85       65.41       66.88       66.91       66.96       65.74       67.13
96               41.12       55.34       38.25       55.73       48.79       33.65       47.63       54.90       45.43       31.21       45.94       43.59       51.00       33.09
97               31.60       36.64       56.71       60.48       40.95       40.16       51.37       49.15       14.80       23.30       35.65       50.15       55.59       61.68
98               35.21       49.56       45.96       64.27       20.40       43.33       69.09       50.32       49.84       52.64       39.46       21.93       57.70       64.93
99               59.99       66.02       63.47       64.10       65.78       65.56       66.88       63.41       64.66       66.88       66.91       66.96       62.98       67.13
100              32.46       71.59       38.51       36.49       50.70       31.63       15.26       57.04       48.02       25.32       14.87       33.76       24.60       52.84
101              20.24       25.42       67.56       63.69       38.60       12.57       58.10       36.98       54.73       53.21       38.90       47.20       21.03       31.15
102              27.84       45.14       56.41       39.13       55.21       54.33       49.19       29.93       43.39       41.65       34.45       58.75       26.16       68.86
103              44.45       63.79       57.18       44.30       46.33       34.23       58.56       26.13       58.31       40.23       29.96       40.35       20.83       36.00
104              27.80       72.55       65.23       69.16       68.09       60.12       54.58       56.68       37.72       44.47       66.05       47.62       69.77       71.22
105              21.34       46.00       42.91       67.64       52.85       41.52       58.05       36.38       27.08       42.30       57.12       30.42       46.87       36.75
106              48.60       33.51       44.61       31.59       30.87       53.04       42.42       63.33       27.96       59.86       12.95       24.16       25.98       61.01
107              27.98       37.26       61.04       63.41       48.45       14.45       63.46       36.31       60.06       51.26       39.49       37.28       34.73       27.73
108              27.32       56.39       35.89       54.99       40.99       52.88       50.67       49.49       36.24       55.82       44.97       43.37       46.28       45.35
109              60.09       66.48       65.20       64.46       65.78       65.56       66.88       66.85       65.41       66.88       66.91       66.96       65.74       67.13
110              34.58       56.28       50.44       61.87       65.11       12.26       73.58       27.64       70.18       47.43       40.43       17.65       51.51       12.21
111              59.99       66.36       61.37       63.21       65.78       64.29       66.17       63.41       63.07       66.88       66.91       66.96       62.98       67.13
112              59.99       66.36       61.37       63.21       65.78       64.29       66.17       63.41       63.07       66.88       66.91       66.96       62.72       67.13
113              28.82       66.73       37.30       37.43       50.76       32.13       15.80       55.68       48.68       21.82       15.26       36.09       26.81       48.35
114              27.10       72.34       64.79       67.33       66.62       59.13       55.09       54.47       37.32       42.12       63.25       47.43       66.90       69.43
115              49.56       52.60       32.36       50.57       44.63       31.19       36.50       53.15       21.28       45.22       23.40       52.28       56.84       61.52
116              31.97       44.54       45.58       64.16       57.90       34.47       63.12       36.22       27.93       38.13       43.13       41.05       45.73       45.46
117              59.99       66.36       61.37       63.21       65.78       64.29       66.17       63.41       63.07       66.88       66.91       66.96       62.98       67.13
118              22.07       73.74       44.26       61.63       27.29       44.52       71.60       38.93       35.36       17.06       68.01       31.98       18.16       25.34
119              20.29       26.92       72.45       28.73       21.75       37.28       69.26       71.90       65.82       61.18       10.29       15.89       26.93       33.19
120              42.76       54.63       23.90       49.71       42.87       39.79       45.21       58.34       29.64       49.67       32.19       44.46       59.56       50.60 ;

table ql(t,k) 
                     1           2           3           4           5           6           7           8           9          10          11          12          13          14
71               32.77       26.63       53.22       48.58       60.82       54.02       25.09       54.66       42.55       60.50       21.76       31.51       22.62       32.61
72                9.22       17.51       10.02       10.04        9.78        9.08       12.14       15.33        9.13        9.48        9.08       11.13       10.26       10.66
73               34.11       23.62       39.10       51.44       64.30       31.62       30.02       44.77       35.30       51.35       28.51       33.83       37.36       37.44
74               19.84       28.22       35.73       58.12        8.89        8.25       74.31       35.40        8.30       67.60       37.16       10.12       36.97       63.73
75                9.22       17.51       11.54       26.87        9.78        9.08       12.14       18.12        9.13       18.19        9.08       11.13       10.26       10.66
76                9.22       17.51       10.02       10.04        9.78        9.08       12.14       15.33        9.13        9.48        9.08       11.13       10.26       10.66
77                9.22       17.51       11.33       10.04        9.78        9.08       12.14       15.33        9.13       11.26        9.08       11.13       10.26       10.66
78                9.22       17.51       10.02       10.04        9.78        9.08       12.14       15.33        9.13        9.48        9.08       11.13       10.26       10.66
79               46.89       68.11       49.07       49.98       56.77       49.89       57.08       17.55       31.05       26.80       43.77       15.75       53.76       50.85
80                9.22       17.51       10.02       11.94        9.78        9.08       12.14       16.56        9.13        9.48        9.08       11.13       10.26       10.66
81               27.10       72.32       64.71       67.16       65.99       58.29       54.22       53.42       37.32       41.39       63.00       46.31       66.78       69.06
82               63.20       69.70       12.09       35.76       26.61       60.47       41.91       61.07       64.25       17.06       63.09       40.64        9.62       29.37
83                9.22       17.51       10.02       10.04        9.78        9.08       12.14       15.33        9.13        9.48        9.08       11.13       10.26       10.66
84               36.15       18.03       45.49       54.36       55.52       53.05       44.15       59.50       11.84       29.24       35.01       14.75       60.60       50.00
85               23.81       50.46       58.50       33.18       53.38       54.00       47.70       15.05       52.41       44.70       29.86       71.70       11.89       74.59
86               49.05       71.46       21.31       36.64       35.20       31.26       44.51       67.36       41.52       30.64       41.94       34.99       29.39       29.58
87                9.22       17.51       11.33       26.87        9.78        9.08       12.14       15.33        9.13       13.08        9.08       11.13       10.26       10.66
88               20.24       25.42       67.09       63.69       38.60       12.57       56.84       36.98       53.90       53.21       36.56       45.89       21.03       31.15
89               26.60       49.47       68.10       69.93       27.79       13.44       60.23       40.23       17.16       19.00       41.03       73.60       50.59       69.28
90                9.22       17.51       10.02       10.04        9.78        9.08       12.14       15.33        9.13        9.48        9.08       11.13       10.26       10.66
91               47.07       33.51       44.61       31.59       30.87       53.04       42.42       62.50       27.96       59.23       12.95       24.16       25.98       61.01
92               46.41       67.28       61.41       40.50       44.60       29.97       57.51       28.68       60.00       36.52       28.62       40.13       19.93       35.92
93               24.69       36.04       60.69       62.84       47.71       12.46       62.65       33.73       59.54       50.55       37.11       36.05       31.05       24.55
94               41.65       33.24       28.83       26.19       21.36       20.17       42.84       58.89       28.21       18.97       16.04       64.28       60.46       54.03
95                9.22       17.51       10.02       10.04        9.78        9.08       12.14       15.33        9.13        9.48        9.08       11.13       10.26       10.66
96               40.59       54.84       36.26       55.28       47.87       29.98       46.40       54.08       44.69       28.58       43.63       42.81       49.51       29.33
97               29.19       34.38       54.23       55.70       37.78       37.28       49.08       48.47       14.09       22.39       33.34       49.33       51.31       56.54
98               33.76       48.68       45.19       64.12       15.75       42.14       68.71       49.60       49.05       51.57       37.67       20.70       57.05       64.44
99                9.22       17.51       11.33       26.87        9.78        9.08       12.14       15.33        9.13       18.19        9.08       11.13       10.26       10.66
100              29.63       71.47       37.13       35.31       49.79       29.39       13.32       55.98       46.53       23.36        9.22       32.89       21.49       51.50
101              19.13       24.41       67.09       58.98       35.86       12.16       56.84       35.46       53.90       48.86       36.56       45.89       20.19       29.80
102              26.80       42.61       55.35       38.30       53.90       53.77       46.84       25.80       42.59       40.96       31.11       57.92       23.67       68.64
103              42.13       62.87       56.48       41.87       45.29       32.87       58.07       25.08       56.93       37.42       28.29       37.98       19.77       33.50
104              25.69       72.49       65.02       69.07       67.73       59.58       54.07       55.69       35.60       41.68       65.25       46.64       69.69       70.93
105              20.12       44.75       41.85       67.34       51.85       39.48       57.66       33.02       25.52       40.24       56.15       28.88       45.67       34.67
106              47.07       32.52       41.22       29.98       28.72       49.11       40.79       62.50       26.16       59.23       12.65       23.04       24.89       55.53
107              24.69       36.04       60.69       62.84       47.71       12.46       62.65       33.73       59.54       50.55       37.11       36.05       31.05       24.55
108              25.86       54.81       33.48       54.06       38.11       52.25       48.86       47.36       33.35       55.20       44.31       40.55       44.75       42.88
109               9.22       17.51       10.02       10.04        9.78        9.08       12.14       16.25        9.13        9.48        9.08       11.13       10.26       10.66
110              33.01       55.91       48.71       61.26       64.76       11.98       73.52       26.68       70.08       45.58       38.15       17.06       49.79       12.08
111              14.16       17.51       11.33       10.04       12.78        9.81       13.20       15.33       10.57       13.08        9.08       11.95       10.26       10.66
112              14.16       17.51       11.33       10.04       12.78        9.81       14.65       15.33       10.57       11.26        9.08       12.46       10.26       10.66
113              27.27       63.68       35.59       35.23       48.11       30.03       15.28       52.88       45.64       20.73       14.64       33.85       25.17       45.29
114              25.72       72.32       64.71       67.16       65.99       58.29       54.22       53.42       35.63       41.39       63.00       46.31       66.78       69.06
115              47.90       50.75       31.18       49.95       41.95       30.11       33.88       51.74       17.76       42.62       18.56       51.20       56.26       60.39
116              30.36       42.12       43.64       64.00       54.20       32.91       58.19       34.10       26.46       35.90       40.46       38.77       43.66       43.21
117              14.16       17.51       11.33       10.04       12.78        9.81       13.20       16.25       10.57       11.26        9.08       11.95       10.26       10.66
118              21.01       73.73       43.01       61.13       25.44       41.74       71.50       36.63       33.66       11.89       67.76       31.10       15.68       20.82
119              19.43       25.95       72.45       27.24       20.89       35.01       68.99       71.74       65.40       60.76       10.12       15.32       25.21       31.91
120              42.11       53.77       21.47       48.13       40.74       37.49       43.09       57.33       25.85       47.40       28.59       41.76       59.01       48.75 ;

parameter bl(i); 
bl(i) = 0; 

parameter bu(i) / 1  113, 2  170, 3  37, 4  159, 5  65, 6  133, 7  146, 8  152, 9  172, 10  128, 
		 11  146, 12  21, 13  72, 14  34, 15  125, 16  70, 17  37, 18  60, 19  34, 20  173, 
		 21  34, 22  115, 23  133, 24  176, 25  37, 26  37, 27  111, 28  28, 29  166, 30  64, 
		 31  169, 32  17, 33  152, 34  128, 35  154, 36  61, 37  163, 38  142, 39  34, 40  140, 
		 
		 41  63, 42  104, 43  121, 44  71, 45  81, 46  106, 47  102, 48  55, 49  107, 50  106, 
		 51  60, 52  51, 53  54, 54  116, 55  66, 56  105, 57  115, 58  57, 59  64, 60  69, 
		 61  102, 62  72, 63  54, 64  117, 65  120, 66  79, 67  105, 68  61, 69  94, 70  128, 
		 
		 71  86, 72  206, 73  154, 74  136, 75  210, 76  75, 77  189, 78  167, 79  93, 80  151, 
		 81  97, 82  151, 83  200, 84  141, 85  90, 86  212, 87  96, 88  119, 89  110, 90  190, 
		 91  139, 92  90, 93  72, 94  73, 95  208, 96  215, 97  105, 98  92, 99  122, 100  202, 
		 101  76, 102  148, 103  198, 104  133, 105  177, 106  88, 107  131, 108  179, 109  158, 110  93, 
		 111  122, 112  108, 113  163, 114  207, 115  216, 116  125, 117  134, 118  211, 119  198, 120  160
		  /;

$include xmodel.gms