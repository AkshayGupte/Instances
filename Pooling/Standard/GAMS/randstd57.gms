$ontext
	 randstd57 pooling problem data.
	 Author: Akshay Gupte, written from AMPL.
$offtext

$eolcom #

set i    /1 * 120/;
set s(i) /1 * 40/;
set t(i) /71 * 120/;
set k    /1 * 14/;


alias (i,j);

parameter c(i,j)
	 / 1.(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 47
	   2.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 48
	   3.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 46
	   4.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 38
	   5.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 43
	   6.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 43
	   7.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 45
	   8.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 45
	   9.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 41
	   10.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 45
	   11.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 45
	   12.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 46
	   13.(41,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 46
	   14.(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 47
	   15.(41,42,43,44,45,46,50,51,52,53,54,56,57,59,61,63,64,68,69) 	 45
	   16.(42,45,46,48,50,53,54,57,59,60,64) 	 49
	   17.(43,47,66) 	 45
	   18.(65,67) 	 49
	   19.(41,42) 	 34
	   20.(41,42,67) 	 41
	   21.(48,58,65,68,69) 	 42
	   22.(41,42) 	 42
	   23.(41,42) 	 27
	   24.(41,42,62) 	 37
	   25.(41,42,63) 	 42
	   26.(41,42,62) 	 46
	   27.(41,42,47) 	 38
	   28.(41,42,70) 	 48
	   29.(41,42,49) 	 37
	   30.(52,61) 	 36
	   31.(41,42,70) 	 48
	   32.(41,42,56) 	 23
	   33.(41,42) 	 36
	   34.(41,42,51) 	 43
	   35.(49,55) 	 38
	   36.(41,42,44) 	 44
	   37.(41,42) 	 27
	   38.(41,42) 	 35
	   39.(58,60) 	 48
	   40.(55,66) 	 33
	   (42,44,45,46,49,51,54,57,58,60,61,62,63,65,67,68,70).71 	 -34
	   (42,44,49,56,60,62,65,66,68,70).72 	 -89
	   (41,46,48,52,57,58,61,70).73 	 -93
	   (42,43,46,49,50,52,56,60,63,64).74 	 -50
	   (44,45,48,49,50,51,52,57,59,61,68,70).75 	 -66
	   (41,45,46,49,51,52,55,57,58,59,61,62,64,66,70).76 	 -45
	   (42,43,44,46,47,51,58,59,60,65,66,67,69,70).77 	 -74
	   (42,47,48,50,51,52,53,60,62,69).78 	 -54
	   (41,43,48,51,52,54,56,57,58,59,65,67,70).79 	 -80
	   (44,46,48,51,55,62,63,68,70).80 	 -77
	   (44,48,49,51,53,54,57,59,60,64,69).81 	 -86
	   (42,44,49,51,52,53,55,59,60,62,64,67).82 	 -97
	   (41,43,46,47,52,54,56,57,58,59,65,66,67).83 	 -57
	   (42,45,49,50,53,54,55,58,61,62,66,69).84 	 -43
	   (43,44,48,50,54,57,58,59,61,62,63,69,70).85 	 -78
	   (46,47,48,52,54,56,62,63,66,67,69).86 	 -68
	   (43,49,51,54,55,58,61,62,64,68,69,70).87 	 -94
	   (45,46,47,49,58,63,66,68).88 	 -38
	   (41,42,48,50,52,59,64,68,70).89 	 -42
	   (43,44,45,50,52,54,55,56,57,59,61,64,65,67,69,70).90 	 -46
	   (45,46,48,51,52,54,58,60,62,63,64,67,68,69).91 	 -53
	   (42,45,47,48,51,52,57,59,60,62,63,64,66,67,68,70).92 	 -19
	   (42,43,46,47,50,51,52,53,55,56,58,59,67,70).93 	 -53
	   (46,48,49,50,51,52,54,57,58,62,64,67,70).94 	 -92
	   (42,46,48,49,50,52,54,55,62,65,66,67,68).95 	 -36
	   (42,43,44,46,50,52,53,54,57,59,60,61,62,63,64,67,68).96 	 -61
	   (44,46,52,54,56,59,62,63,64,67,68).97 	 -68
	   (42,43,44,45,47,48,49,51,55,57,58,60,68,69,70).98 	 -73
	   (42,43,45,46,47,49,53,54,55,58,63,66,67,68,70).99 	 -86
	   (43,46,47,50,51,53,57,59,61,63,65,67,69,70).100 	 -67
	   (41,42,43,44,45,47,48,51,53,54,55,57,59,63,65,70).101 	 -54
	   (44,56,60,61,68,70).102 	 -69
	   (44,47,48,49,55,56,57,58,59,62,65,68,69).103 	 -80
	   (41,42,43,45,51,52,53,54,55,56,57,58,60,63,67,68,69,70).104 	 -22
	   (43,45,50,54,60,61,65,69,70).105 	 -60
	   (41,42,44,45,46,47,49,53,54,55,58,60,64,67,69,70).106 	 -51
	   (41,45,49,50,51,52,53,54,57,63,66,67,68,70).107 	 -29
	   (42,43,44,46,48,49,53,56,58,62,69,70).108 	 -93
	   (43,46,48,49,50,51,54,56,57,61,64,67,68,69,70).109 	 -91
	   (42,45,48,52,53,58,61,64,65).110 	 -54
	   (43,44,45,47,48,50,51,52,53,57,59,62,63,65,66,67,69,70).111 	 -49
	   (41,43,45,46,48,52,54,58,59,60,61,62,64,66,67,68,70).112 	 -88
	   (42,45,49,50,54,55,59,60,61,63,64,66,67).113 	 -23
	   (42,46,47,49,53,60,61,63,67).114 	 -98
	   (41,42,43,44,45,46,57,58,59,61,63,65,66).115 	 -15
	   (41,45,46,47,48,50,54,56,57,58,59,61,62,63,64,65,66,69).116 	 -59
	   (41,44,47,48,50,51,52,53,56,59,61,64,66,67,70).117 	 -84
	   (41,44,46,51,54,56,60,62,67,68,69).118 	 -69
	   (41,42,45,46,51,52,60,62).119 	 -59
	   (43,45,47,49,50,51,53,54,56,62,69).120 	 -65
	   1.72  -42 , 2.82  -49 , 2.87  -46 , 2.101  -6 , 6.88  5 , 
	   7.108  -48 , 9.108  -52 , 10.118  -24 , 11.96  -16 , 12.89  4 , 
	   12.90  0 , 12.95  10 , 12.107  17 , 13.77  -28 , 13.84  3 , 
	   13.104  24 , 14.74  -3 , 14.115  32 , 15.95  9 , 15.97  -23 , 
	   15.99  -41 , 15.103  -35 , 16.71  15 , 16.95  13 , 17.94  -47 , 
	   18.82  -48 , 18.102  -20 , 18.119  -10 , 19.72  -55 , 20.89  -1 , 
	   20.97  -27 , 20.115  26 , 20.119  -18 , 21.73  -51 , 21.76  -3 , 
	   21.98  -31 , 21.113  19 , 22.102  -27 , 22.106  -9 , 22.109  -49 , 
	   23.80  -50 , 23.86  -41 , 23.101  -27 , 23.107  -2 , 24.93  -16 , 
	   24.106  -14 , 24.111  -12 , 24.120  -28 , 25.99  -44 , 25.112  -46 , 
	   26.74  -4 , 26.77  -28 , 26.105  -14 , 26.119  -13 , 27.99  -48 , 
	   27.117  -46 , 28.81  -38 , 28.120  -17 , 29.80  -40 , 29.105  -23 , 
	   30.119  -23 , 31.87  -46 , 31.109  -43 , 31.112  -40 , 31.117  -36 , 
	   32.85  -55 , 33.118  -33 , 35.86  -30 , 35.98  -35 , 35.103  -42 , 
	   35.109  -53 , 35.112  -50 , 36.71  10 , 37.102  -42 , 38.98  -38 , 
	   39.104  26 , 39.109  -43 , 40.82  -64 , 40.112  -55  /;

parameter a(i,j);
a(i,j) = 1$(c(i,j) ne 0);
a('12','90') = 1; 

table qu(i,k) 
                     1           2           3           4           5           6           7           8           9          10          11          12          13          14
1                70.16       53.19       19.15       26.75       52.87       46.20       54.31       27.89       46.88       48.48       71.54       65.96       49.37       37.49
2                73.74       55.61       67.96       55.59       46.80       27.20       22.60       12.15       15.42       10.91       55.42       46.23       28.99       43.72
3                49.34       43.05       70.32       69.59        9.57       67.53       27.05       65.34       50.22       32.47       10.24       39.04       47.55       62.26
4                66.72       41.69       70.65       31.93       50.80       56.96       29.54       34.56       62.17       16.89       48.73       25.15       67.33       53.71
5                10.59       44.89       38.50       12.89       53.28        9.90       49.89       43.24       63.20       23.04       38.60        9.21        8.87       35.82
6                18.20       68.91       54.39       72.21       36.24       70.37       49.12       64.81        9.25       70.91       44.45       41.00       35.29       31.04
7                11.33       27.25       49.65       24.61       34.12       49.76       34.39       44.77       63.41       54.77       69.85       54.23       61.25       44.62
8                64.34       72.98       13.72       62.59       42.10       28.13       44.02       35.52       32.85       41.81       27.95       72.97       61.45       35.02
9                58.85       37.21       36.54       20.11       34.35       47.45       16.55       14.85       34.48       19.06       20.50       41.61       12.87       71.62
10               21.74       37.90       60.04       12.57       39.62       57.47       42.29       46.58       33.96       14.51       69.90       12.17       31.59       21.95
11               70.68       41.24       65.53       16.93       15.61       53.97       45.23       21.77       49.03       18.56       23.34       43.57       28.13       59.16
12               67.80       39.07       29.44       28.15       45.19       32.60       15.32       48.78       33.62       51.42       21.80       17.86       63.08       40.97
13               40.87       29.32       18.53       25.15       43.74       54.64       32.97       46.53       58.82       36.49       49.27       39.80       60.65       37.09
14               58.69       27.68       57.37       27.63       58.51       29.86       51.06       15.23       14.75       47.09       59.42       69.70       29.45       38.67
15               56.29       60.15       38.34       50.26       64.09       52.56       16.82       16.82       25.21       23.30       56.21       50.48       46.83       40.14
16               67.17       21.77       59.72       26.62       43.22       67.76       59.86       69.24       25.38       42.26       29.86       17.56       21.65       60.45
17               29.45       73.54       72.22       66.15        9.80       51.85       36.70       32.08       49.44       11.85       44.62       35.15       18.60       46.46
18               71.83       33.04       60.23       39.23       33.49       14.94       37.04       74.18        9.50       68.73       71.81       12.15       69.36       37.37
19               24.19       44.53       23.95       28.75       28.21       12.92       72.01       54.00       51.80       41.01       22.17       21.45       11.71       22.89
20               41.94       21.72       19.81       64.41        8.19       24.24       30.94       67.85       50.67       47.65       29.88       50.74       31.31       38.27
21               28.44       21.08       18.26       21.89       72.33       62.92       35.02       18.87       46.29       36.00       37.38       71.28       53.64       40.54
22               12.80       27.16       68.74       68.45       53.93       67.20       51.39       71.38       36.79       31.09       74.31       54.41       16.63       55.15
23               66.58       62.55       41.78       50.03       17.20       11.66       14.31        8.77       51.63       36.76       12.63       45.25       25.87       29.15
24               30.17       59.86       56.03       28.02       47.25       18.75       49.10       62.33       55.12       74.08       61.92       40.00       49.09       38.20
25               37.11       60.76       34.98       48.00       54.27       43.24       53.70       42.99       56.62       21.53       57.84       57.78       42.84       16.64
26               28.14       68.92       64.30       38.32       17.48       24.69       64.33       55.37       63.95       51.46       65.07       36.23       56.18       56.55
27               16.73       13.46       36.30       62.59       49.50       47.25       44.38       68.49       32.66        8.38       34.50       24.58       47.43       21.34
28               23.56       52.23       12.55       74.24       16.30       66.42       73.63       59.15       20.45       21.06       31.33       64.80       67.28       17.31
29               59.95       49.03       73.98       45.99       60.81       50.72       22.42       62.83       57.55       43.68       22.14       17.28       56.87       53.63
30               18.92       69.69       12.11       73.68       61.89       64.20       33.13       66.95       43.49        8.05       68.96        9.96       50.54       17.24
31               22.11       46.40       58.98       31.46       36.12       56.25       58.82       52.34       72.06       73.30       12.59       38.40       44.01       19.33
32               42.02       23.67       27.50       70.49       47.14       38.90       52.69       14.37        9.32       11.99       69.65       58.11       22.80       47.34
33               68.84       20.13       44.56       40.62        9.88       27.31       17.06       58.57       36.28       18.68       48.27       65.76       62.17       72.44
34               17.88       70.70       72.02       51.22       47.35       31.93       72.95       65.19       12.31       39.96       35.88       69.54       30.33       68.40
35               33.69       69.87       56.39       74.69       69.01       17.96       11.02       22.97       15.41        9.08       28.95       71.92       52.66       37.39
36               46.17       33.83       18.68       46.83       46.33       21.48       72.82       24.50       14.89       67.55       68.54       27.82       66.59       32.90
37               58.86       23.02       30.21       60.54       52.02       31.49        8.18       68.61       64.19       66.01       53.62       23.60       53.58       44.24
38               68.04       63.05       70.35       36.41       20.85       13.81       15.32       50.88       43.16       35.88       66.15       13.24       36.83       48.96
39                8.99       49.10       49.51       17.82       74.80       22.05       18.90       58.12       12.81       48.19       12.63       34.02       62.05       60.57
40               29.00       71.84       59.42       27.60       19.74       53.88        9.09       22.26       34.62       65.41       29.59       28.06       39.24       68.71
71               66.37       65.68       66.58       67.22       67.32       63.33       66.27       66.76       64.85       66.67       66.88       65.67       62.42       65.20
72               40.03       34.72       38.03       60.27       49.12       36.53       53.52       28.28       22.02       29.60       68.17       54.55       30.66       45.83
73               62.11       54.27       55.55       43.45       26.48       16.28       30.43       46.27       38.46       46.35       64.99       18.89       44.72       46.27
74               57.08       61.34       40.21       50.75       64.36       53.08       21.18       19.79       29.41       25.75       57.79       51.73       48.09       40.98
75               59.02       27.68       57.37       27.63       59.54       29.86       51.57       15.23       14.75       49.11       60.27       69.79       29.45       38.67
76               30.26       25.46       20.66       25.49       72.44       63.36       38.37       23.50       48.40       36.96       38.31       71.37       54.62       42.34
77               49.92       54.76       64.10       32.95       19.91       50.75       51.86       41.69       48.10       39.67       38.69       43.23       39.63       54.05
78               35.06       67.35       61.39       43.57       26.08       31.35       57.51       50.69       58.38       47.26       62.72       40.06       55.51       54.84
79               66.37       66.19       66.58       66.82       67.32       63.33       66.27       66.76       64.85       66.67       66.88       65.67       62.42       65.20
80               60.64       51.01       73.98       48.25       61.49       52.35       23.52       63.05       58.14       45.31       26.48       21.41       57.56       54.38
81               66.37       65.68       66.58       67.22       67.32       63.33       66.27       62.32       57.07       63.82       64.39       65.67       60.60       64.46
82               49.50       34.78       43.97       53.34       42.64       28.80       47.17       41.38       20.98       44.06       67.55       39.23       42.53       43.74
83               18.31       18.66       38.31       63.49       50.89       47.77       45.31       68.96       35.66       10.18       35.53       27.75       48.85       23.90
84               48.45       61.81       54.24       42.41       41.15       55.50       17.96       26.67       37.21       42.10       42.79       38.81       47.60       56.51
85               46.18       34.34       43.11       29.59       48.17       42.58       41.14       32.01       38.08       43.87       54.75       58.12       45.10       42.37
86               57.96       46.22       32.99       56.66       13.60       16.69       23.07       34.03       52.10       41.12       19.53       48.53       28.05       32.80
87               25.77       47.21       59.60       34.06       38.79       57.03       59.96       53.77       72.06       73.34       16.22       39.78       45.19       22.86
88               66.37       66.19       66.58       67.22       67.32       63.33       53.87       62.32       57.07       63.82       64.39       65.67       60.60       64.46
89               66.37       65.68       66.58       66.82       65.10       63.33       66.27       64.24       64.85       66.67       66.88       65.67       60.60       65.20
90               55.18       50.21       53.22       39.12       46.84       31.50       29.81       22.81       33.71       19.29       44.30       38.77       23.71       50.08
91               66.37       65.68       64.82       66.31       67.32       63.33       65.66       66.76       57.56       66.67       64.63       65.67       62.42       64.46
92               66.37       66.19       66.58       66.82       67.32       63.33       66.27       66.76       64.85       66.67       66.88       65.67       62.42       65.20
93               66.37       66.19       66.58       67.22       67.32       63.33       66.27       66.76       64.85       66.67       66.88       65.67       62.42       65.20
94               42.14       72.38       58.28       64.15       19.37       47.59       40.80       35.76       46.58       19.67       40.49       44.50       34.50       46.00
95               70.41       53.20       23.97       28.08       53.51       47.33       54.73       29.76       48.48       49.39       70.68       65.00       49.66       39.57
96               66.37       66.19       66.58       66.82       67.32       63.33       66.27       66.76       64.85       66.67       66.88       65.67       62.42       65.20
97               54.67       48.55       19.94       62.41       27.77       28.22       38.76       50.43       43.33       44.42       31.42       60.98       49.79       37.61
98               36.40       69.06       56.84       72.58       68.80       20.55       17.81       26.53       18.61       11.17       32.55       69.79       51.80       38.05
99               28.66       50.55       25.96       60.84       38.01       53.32       61.37       53.76       38.38       19.47       43.65       55.95       53.52       17.58
100              60.00       37.21       36.54       20.11       34.35       49.36       16.55       14.85       35.89       19.06       20.50       41.61       12.87       71.62
101              66.37       66.19       66.58       67.22       65.10       63.33       66.27       66.76       64.85       66.67       66.88       65.67       62.42       65.20
102              60.17       24.79       31.21       61.62       52.62       33.16       10.44       68.99       64.56       66.46       54.10       27.62       54.64       45.90
103              44.72       54.01       60.68       39.37       46.13       39.45       30.65       28.54       31.92       13.79       38.82       48.90       38.67       42.29
104              66.03       34.51       46.09       28.43       48.94       54.79       48.46       57.49       32.06       46.60       38.31       30.62       38.75       52.41
105              44.78       44.29       57.28       49.17       40.03       69.07       54.95       67.21       18.00       55.91       39.05       31.82       30.94       47.00
106              20.26       32.96       68.16       60.74       51.01       65.50       50.86       65.40       40.81       32.50       69.18       52.43       21.09       54.20
107              38.98       61.35       36.98       49.12       55.11       43.79       55.15       44.83       57.26       25.12       59.08       58.26       43.90       20.23
108              48.48       29.83       46.18       43.81       49.11       33.85       50.96       19.39       22.70       28.75       58.19       55.11       27.34       45.91
109              18.14       50.60       40.59       38.25       56.58       37.47       38.09       59.32       16.73       41.84       22.39       46.38       64.00       47.15
110              66.37       65.68       66.58       66.82       67.32       63.33       66.27       66.76       64.85       66.67       66.88       65.67       62.42       65.20
111              32.91       69.73       57.44       32.28       23.97       52.20       14.47       25.17       36.81       66.09       33.88       30.81       43.29       66.53
112              66.37       66.19       66.58       67.22       67.32       63.33       66.27       66.76       64.85       66.67       66.88       65.67       62.42       65.20
113              66.37       66.19       66.58       67.22       67.32       63.33       66.27       66.76       64.85       66.67       66.88       65.67       62.42       65.20
114              66.37       66.19       66.58       67.22       67.32       63.33       66.27       66.76       64.85       66.67       66.88       65.67       62.42       65.20
115              47.74       36.55       22.10       48.70       46.99       23.70       72.85       26.85       17.11       68.13       68.75       30.58       66.71       36.18
116              25.83       56.02       19.88       62.47       55.20       58.82       31.70       57.76       40.36       10.08       55.42       21.28       43.31       29.01
117              39.06       42.38       50.03       26.49       36.32       52.40       40.31       35.92       56.69       51.15       16.05       39.81       30.37       44.78
118              18.20       69.25       55.41       72.36       37.29       70.37       50.14       65.35        9.25       71.10       45.69       42.94       36.41       33.15
119              31.96       59.81       69.33       47.58       47.66       41.36       70.20       66.30       20.43       42.33       35.46       58.75       29.94       66.84
120              29.73       61.84       57.84       30.28       40.73       20.05       52.43       60.81       57.05       69.13       62.61       39.17       50.64       42.22 ;

table ql(t,k) 
                     1           2           3           4           5           6           7           8           9          10          11          12          13          14
71                9.89       14.81       13.32       13.83        9.01       10.89        9.00        9.65       10.18        8.86       11.26       10.13        9.76       18.30
72               39.01       32.85       34.74       59.71       47.17       33.79       51.78       26.54       20.94       27.74       67.69       53.51       29.47       45.02
73               61.20       53.56       54.79       40.51       25.29       15.89       28.19       45.26       36.55       44.37       64.77       18.20       43.91       44.40
74               56.29       60.15       38.34       50.26       64.09       52.56       16.82       16.82       25.21       23.30       56.21       50.48       46.83       40.14
75               58.69       27.29       53.86       26.56       58.51       27.85       51.06       15.00       14.44       47.09       59.42       69.70       27.61       36.99
76               28.44       21.08       18.26       21.89       72.33       62.92       35.02       18.87       46.29       36.00       37.38       71.28       53.64       40.54
77               49.36       53.92       63.15       30.85       18.99       48.92       51.20       38.90       45.84       37.21       35.57       41.08       37.16       53.29
78               33.08       66.81       60.51       41.08       24.37       30.23       55.96       49.78       57.62       46.59       62.08       38.49       54.49       54.21
79                9.89       14.81       13.32       13.83        9.01       10.89        9.00        9.65       10.18        8.86       11.26       10.13        9.76       18.30
80               59.95       49.03       73.98       45.99       60.81       50.72       22.42       62.83       57.55       43.68       22.14       17.28       56.87       53.63
81                9.89       23.19       13.81       13.83       10.53       10.89       12.12       13.37       10.18        9.99       11.26       10.13        9.76       19.04
82               48.90       33.51       41.31       51.71       41.54       27.05       45.08       38.30       17.98       42.49       67.17       36.48       39.79       42.23
83               16.73       13.46       36.30       62.59       49.50       47.25       44.38       68.49       32.66        8.38       34.50       24.58       47.43       21.34
84               46.04       61.31       53.14       40.51       40.44       54.79       16.03       24.92       35.33       40.15       41.04       37.58       46.27       54.95
85               42.24       30.95       40.99       27.81       44.93       40.42       38.41       29.06       36.27       40.10       51.03       53.30       43.22       41.31
86               56.72       42.81       31.46       55.78       13.29       16.20       20.96       32.40       51.25       37.63       18.87       47.45       26.10       31.15
87               22.11       46.40       58.98       31.46       36.12       56.25       58.82       52.34       72.06       73.30       12.59       38.40       44.01       19.33
88                9.89       14.81       15.09       13.83       10.53       10.89       10.00       13.37       10.18        9.22       11.26       10.13        9.76       18.30
89               11.65       14.81       13.32       13.83        9.01       10.89        9.00        9.65       10.18        8.86       11.26       10.13        9.76       18.30
90               54.26       48.26       52.63       35.94       45.24       28.07       27.84       20.56       32.15       16.00       42.34       35.86       19.88       48.87
91                9.89       23.19       13.32       13.83        9.01       10.89       16.85       13.37       10.18        8.86       11.26       10.13        9.76       18.30
92                9.89       14.81       13.32       13.83        9.01       10.89        9.00        9.65       10.18        8.86       11.26       10.13        9.76       18.30
93                9.89       14.81       13.32       13.83        9.01       10.89        9.00        9.65       10.18        8.86       11.26       10.13        9.76       18.30
94               39.56       68.48       57.22       58.69       18.20       45.95       38.34       33.04       45.61       18.62       38.77       40.89       31.11       43.77
95               70.09       52.51       19.97       26.76       52.64       46.50       54.13       28.80       46.39       48.39       70.42       64.73       48.96       37.94
96                9.89       14.81       13.32       13.83        9.01       10.89        9.00        9.65       10.18        8.86       11.26       10.13        9.76       18.30
97               52.38       47.12       19.35       61.48       26.62       26.23       37.38       49.64       42.49       42.82       30.09       60.24       48.60       36.37
98               32.85       68.96       55.74       72.45       68.44       17.67       12.43       23.70       17.14        9.59       29.30       69.65       51.07       37.33
99               27.04       47.65       25.00       57.80       35.48       50.50       60.56       53.24       36.90       18.33       40.87       50.91       50.04       17.48
100              58.85       34.82       35.12       19.57       32.67       47.45       16.46       14.64       34.48       18.49       19.73       38.82       12.52       71.62
101              11.65       14.81       13.81       13.83        9.01       10.89        9.00        9.65       10.18        9.22       11.26       10.13        9.76       18.30
102              58.86       23.02       30.21       60.54       52.02       31.49        8.18       68.61       64.19       66.01       53.62       23.60       53.58       44.24
103              42.94       52.17       60.07       37.31       43.72       37.80       28.58       27.37       29.71       13.32       37.03       47.07       35.94       41.00
104              65.65       32.67       44.91       26.63       46.75       54.27       47.68       56.34       30.87       45.66       35.64       27.74       37.49       51.80
105              41.85       43.33       52.98       47.47       36.71       68.95       52.50       61.33       17.15       55.36       36.53       28.28       27.89       45.20
106              19.05       29.28       67.82       59.56       49.21       65.24       50.16       64.83       37.79       28.72       69.04       50.43       18.79       53.24
107              37.11       60.76       34.98       48.00       54.27       43.24       53.70       42.99       56.62       21.53       57.84       57.78       42.84       16.64
108              46.78       28.56       43.96       41.23       44.92       33.03       47.06       18.64       21.91       27.29       56.96       54.28       23.90       43.69
109              13.73       50.12       37.49       36.17       55.78       36.48       36.70       58.45       15.29       39.37       18.71       44.03       63.75       46.50
110               9.89       14.81       13.32       13.83        9.01       10.89        9.00        9.65       10.18        8.86       11.26       10.13        9.76       18.30
111              30.10       69.40       56.81       28.83       21.44       51.80       13.18       22.40       33.36       65.55       32.09       28.04       40.99       66.41
112               9.89       14.81       13.32       13.83        9.01       10.89        9.00        9.65       10.18        8.86       11.26       10.13        9.76       18.30
113               9.89       14.81       13.32       13.83        9.01       10.89        9.00        9.65       10.18        8.86       11.26       10.13        9.76       18.30
114               9.89       14.81       13.32       13.83        9.01       10.89        9.00        9.65       10.18        8.86       11.26       10.13        9.76       18.30
115              46.17       33.83       18.68       46.83       46.33       21.48       72.82       24.50       14.89       67.55       68.54       27.82       66.59       32.90
116              24.65       51.48       19.40       57.70       51.80       54.50       29.76       54.04       38.29        9.91       51.98       17.71       41.44       27.63
117              38.20       39.54       49.15       25.73       35.34       49.20       38.05       33.37       55.60       49.55       15.62       37.87       28.83       42.23
118              17.60       68.91       54.39       72.21       36.24       70.37       49.12       64.81        9.25       70.91       44.45       41.00       35.29       31.04
119              29.44       59.22       69.13       45.45       46.38       40.33       69.88       66.14       15.38       40.50       34.47       57.35       28.29       66.54
120              27.83       57.66       53.82       29.18       37.53       19.11       48.45       58.22       52.14       63.75       58.50       36.04       47.94       40.13 ;

parameter bl(i); 
bl(i) = 0; 

parameter bu(i) / 1  132, 2  76, 3  17, 4  34, 5  61, 6  155, 7  28, 8  112, 9  169, 10  42, 
		 11  137, 12  12, 13  37, 14  161, 15  159, 16  139, 17  109, 18  66, 19  89, 20  146, 
		 21  17, 22  130, 23  123, 24  166, 25  175, 26  155, 27  110, 28  127, 29  138, 30  98, 
		 31  169, 32  151, 33  79, 34  101, 35  133, 36  168, 37  12, 38  90, 39  112, 40  154, 
		 
		 41  129, 42  134, 43  119, 44  111, 45  108, 46  72, 47  119, 48  112, 49  138, 50  59, 
		 51  62, 52  74, 53  134, 54  54, 55  92, 56  51, 57  83, 58  101, 59  87, 60  58, 
		 61  124, 62  122, 63  115, 64  117, 65  75, 66  73, 67  139, 68  121, 69  80, 70  108, 
		 
		 71  209, 72  166, 73  197, 74  88, 75  162, 76  80, 77  123, 78  104, 79  97, 80  137, 
		 81  100, 82  209, 83  71, 84  189, 85  155, 86  213, 87  74, 88  85, 89  175, 90  153, 
		 91  181, 92  105, 93  149, 94  153, 95  125, 96  110, 97  130, 98  83, 99  134, 100  128, 
		 101  73, 102  161, 103  214, 104  106, 105  164, 106  156, 107  214, 108  140, 109  163, 110  207, 
		 111  205, 112  135, 113  216, 114  137, 115  106, 116  144, 117  189, 118  214, 119  170, 120  169
		  /;

$include xmodel.gms