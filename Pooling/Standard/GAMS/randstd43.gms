$ontext
	 randstd43 pooling problem data.
	 Author: Akshay Gupte, written from AMPL.
$offtext

$eolcom #

set i    /1 * 115/;
set s(i) /1 * 40/;
set t(i) /71 * 115/;
set k    /1 * 10/;


alias (i,j);

parameter c(i,j)
	 / 1.(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 42
	   2.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 39
	   3.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 33
	   4.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 40
	   5.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 27
	   6.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 43
	   7.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 31
	   8.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 42
	   9.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 39
	   10.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 39
	   11.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 41
	   12.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 41
	   13.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,65,66,67,68,69,70) 	 31
	   14.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,56,57,58,59,60,61,62,63,65,66,67,69,70) 	 38
	   15.(41,42,44,45,46,47,49,50,52,54,56,57,58,59,60,61,62,63,65,66,67,69) 	 35
	   16.(41,42,44,52,54,60,62) 	 42
	   17.(49,51,55) 	 45
	   18.(41,42) 	 33
	   19.(41,42,70) 	 32
	   20.(42,55) 	 37
	   21.(42,47,64) 	 26
	   22.(65,68) 	 29
	   23.(41,42) 	 36
	   24.(41,46,57) 	 26
	   25.(53,58,68) 	 29
	   26.(43,45) 	 36
	   27.(41,42,64) 	 34
	   28.(41,42) 	 32
	   29.(53,55,69) 	 43
	   30.(41,42) 	 33
	   31.(41,42) 	 39
	   32.(41,42,67) 	 40
	   33.(48,64) 	 51
	   34.(42,56,63,66) 	 31
	   35.(50,51) 	 33
	   36.(41,42,59) 	 32
	   37.(41,42) 	 36
	   38.(41,43,61,64,68,70) 	 36
	   39.(41,42,48) 	 35
	   40.(41,42) 	 30
	   (41,42,43,45,49,52,59,60,63,67,68).71 	 -40
	   (43,44,46,47,48,52,53,55,56,57,59,62,64,66,68,69).72 	 -52
	   (41,42,44,46,47,49,52,53,56,58,59,63,64,66,68).73 	 -82
	   (42,44,45,50,51,53,55,59,61,62,63,66).74 	 -26
	   (42,46,47,48,51,53,54,55,56,57,58,61,62,66,68,69,70).75 	 -89
	   (45,48,49,51,53,54,57,58,59,63,64,65,66).76 	 -18
	   (42,46,50,51,54,57,59,60,61,62,63,65,68,69,70).77 	 -98
	   (42,43,45,46,47,50,53,54,57,58,59,62,66,67,68).78 	 -26
	   (42,45,46,48,50,52,54,55,57,58,66,67,69,70).79 	 -88
	   (41,43,46,49,51,52,57,59,60,61,62,63,64,65,68).80 	 -32
	   (41,42,45,50,54,58,59,63,65,66).81 	 -61
	   (42,44,48,49,50,52,55,56,58,63,64,66,67).82 	 -65
	   (42,44,46,48,49,50,52,55,59,60,61,64,65).83 	 -97
	   (46,49,52,60,61).84 	 -50
	   (44,45,46,48,54,57,59,60,63,66,67,68).85 	 -47
	   (42,43,44,50,51,54,57,58,61,63,65,66,67,68).86 	 -18
	   (42,43,46,48,53,55,56,57,59,61,63).87 	 -93
	   (41,44,45,46,47,50,52,56,58,61,63,69).88 	 -50
	   (43,44,45,47,49,51,53,54,55,57,58,62,64,65,66,68).89 	 -87
	   (42,44,46,51,52,53,58,59,60,61,64,69).90 	 -74
	   (41,43,45,49,55,61,62,66,68,69,70).91 	 -88
	   (42,43,44,47,49,51,57,61,64,66,67).92 	 -47
	   (44,45,49,53,54,63,66,69,70).93 	 -43
	   (42,48,49,50,51,52,58,59,65,66,67,68,69).94 	 -61
	   (43,51,52,53,57,58,61,62,70).95 	 -46
	   (41,43,51,52,61,68).96 	 -48
	   (41,42,43,49,50,51,53,58,62,65,68,69).97 	 -57
	   (41,42,43,47,49,50,52,56,62,63,64,65,66,68).98 	 -70
	   (42,43,49,54,56,58,59,60,61,64,67,68,69,70).99 	 -46
	   (41,44,45,47,49,51,59,60,61,63,64,68,69,70).100 	 -17
	   (44,45,47,49,52,57,59,61,65,69,70).101 	 -20
	   (41,45,49,51,52,54,56,57,60,61,62,63,67).102 	 -33
	   (42,43,44,48,50,51,53,56,57,61,63,65).103 	 -56
	   (43,45,47,49,50,51,52,54,57,58,62,63,67,68,69).104 	 -70
	   (42,43,45,46,47,48,49,51,56,60,61,65,66,68).105 	 -31
	   (45,48,51,52,54,58,59,66,68).106 	 -74
	   (42,43,44,46,52,53,54,56,59,60,67,70).107 	 -23
	   (41,44,45,47,48,49,50,51,53,58,60,61,63,67,69).108 	 -87
	   (44,45,46,49,54,55,56,59,65,66,70).109 	 -84
	   (41,42,44,46,54,56,58,59,60,61,63,66,70).110 	 -15
	   (48,52,53,54,57,60,61,64,65,66,69,70).111 	 -70
	   (43,47,51,56,63,65,68,70).112 	 -22
	   (44,49,50,54,56,61,63,64,65,66,67).113 	 -17
	   (41,42,43,44,45,47,49,50,55,64,65,68,69).114 	 -55
	   (42,44,46,50,54,61,62,63,64).115 	 -91
	   1.92  -5 , 1.108  -45 , 2.71  -1 , 2.86  21 , 3.84  -17 , 
	   3.93  -10 , 3.113  16 , 4.74  14 , 4.88  -10 , 4.114  -15 , 
	   5.87  -66 , 6.94  -18 , 6.99  -3 , 6.103  -13 , 7.96  -17 , 
	   7.115  -60 , 8.96  -6 , 10.80  7 , 10.93  -4 , 12.75  -48 , 
	   12.88  -9 , 14.75  -51 , 14.103  -18 , 15.83  -62 , 15.90  -39 , 
	   16.101  22 , 17.91  -43 , 17.114  -10 , 18.72  -19 , 20.77  -61 , 
	   21.73  -56 , 21.76  8 , 21.109  -58 , 22.77  -69 , 22.107  6 , 
	   22.111  -41 , 23.74  10 , 23.94  -25 , 24.102  -7 , 25.76  11 , 
	   25.77  -69 , 25.98  -41 , 25.99  -17 , 26.111  -34 , 27.92  -13 , 
	   27.103  -22 , 27.109  -50 , 28.80  0 , 28.103  -24 , 31.83  -58 , 
	   33.109  -33 , 34.96  -17 , 35.92  -14 , 36.95  -14 , 37.74  10 , 
	   37.83  -61 , 38.86  18 , 39.92  -12 , 40.71  -10  /;

parameter a(i,j);
a(i,j) = 1$(c(i,j) ne 0);
a('28','80') = 1; 

table qu(i,k) 
                     1           2           3           4           5           6           7           8           9          10
1                49.44       68.73       74.29       65.95       52.91       67.46       71.07       53.98       68.94       67.19
2                48.32       47.01       19.14       12.39        8.12       28.25       66.41       47.71       13.86       49.84
3                 9.44       62.18       20.63       34.23       67.62       44.43       59.17       73.74       44.68       17.00
4                71.19        8.17       34.36        8.63       42.66       29.96       11.80       67.81       13.46       40.81
5                74.59       68.72       22.26       27.88       22.59       28.07       65.17       38.77       63.24       42.55
6                65.06       16.52       55.70       24.07       41.95       31.23       42.83       14.80       51.69       49.69
7                29.78       37.34        8.20       16.92       47.05       17.21       30.52       47.05       23.31       24.94
8                55.72       70.74       27.02       19.49       36.38       41.58       25.05       32.70       27.04       69.92
9                59.61       62.24       62.35       26.36       37.66       57.67       50.90       23.28       32.76       45.99
10               60.71       48.90       60.28       18.06       66.65       32.09       67.55       43.02       18.15       56.24
11               27.39       37.79       29.02       13.50       36.54       48.22       11.16       72.97       26.10       72.80
12               69.97       73.36       60.81       25.50       11.64       54.20       42.71       42.01       63.48       53.20
13               14.84       33.60       40.01       59.10       20.12       21.21       39.94       26.78       64.11       74.21
14               40.98       26.53       27.02       13.86       21.72       17.63       37.40       52.65       56.64       67.59
15               46.93       64.84       60.88       48.42       11.49       23.02       39.87       36.66       61.21       56.17
16               22.03       41.13       70.17       62.96       24.38       69.30       58.29       67.52       69.83       31.26
17               39.35       55.72       30.03       48.53       45.00       22.44       34.28       68.90       53.75       41.29
18               60.43       22.60       64.93       52.08       22.54       69.74       25.01       28.27       18.44       19.75
19               33.02       26.06       20.57       45.52       62.49       69.58       35.99       12.59       46.38       50.19
20               30.71       20.64       66.88       11.76       35.41       45.77       40.50       53.02       73.95       22.14
21               14.26       62.88       10.30       53.94       64.10       72.66       73.52       67.25       70.21       42.23
22               62.86       57.32       35.31       27.53       73.25       17.17       63.13       60.85       44.06       50.35
23               26.13       74.39       66.48       26.05       53.95       45.71       61.44       54.64       28.99       74.58
24               28.17       52.30        8.58       73.85       64.66       11.42       26.53       26.55       62.59       18.11
25               34.05       66.33       14.82       24.02       65.01       50.76       66.18       73.31       42.59       51.82
26               51.23       35.29       68.82       41.25       19.69       16.03       40.21       43.18       32.21       60.08
27               26.64       61.29        8.83       69.76       21.19       67.11       38.68       36.61       17.83       27.61
28               69.26       46.21       49.53       52.32       21.66       14.97       50.53       52.08       25.29       59.50
29               66.98       26.00       23.30       48.29       33.91       18.92       53.50       64.41       49.64       26.36
30               55.72       49.12       17.62       47.31       26.05       34.63       21.07       50.64       63.14       72.84
31               61.90       67.59       63.25       65.83       33.38       15.97       44.83       30.01       42.38       42.85
32               19.96       72.53       60.95       26.50       70.06       58.36       61.40       59.59       31.54       20.30
33               65.70       47.79       17.72       49.40       16.70       28.96       38.53       35.42        9.01       65.01
34               67.06       31.97       47.05       27.40       27.59       48.47       38.22       50.76       54.79       66.03
35                8.40       43.97       60.22       61.53       35.78       56.11       56.90       46.45       63.19       73.20
36               17.33       57.94       63.50       61.42       18.97       50.61       30.25       32.76        9.87       30.57
37               56.27       28.38       14.94       61.84       67.84       16.40       52.77       54.23       29.65       10.35
38               26.83       21.10       39.59       24.34       29.85       11.52       44.28       70.02       11.51       52.67
39               52.53       51.00       45.30       52.91       56.48       55.06       61.30       54.62       19.70       66.44
40               20.55       32.17       21.72       15.91       62.46        9.62       15.77       50.65       36.78       60.36
71               26.57       37.24       29.50       24.02       63.80       18.34       22.66       53.04       40.82       62.33
72               47.29       42.65       36.81       45.60       43.75       40.74       49.70       48.53       46.64       56.81
73               14.44       35.73       42.15       59.53       23.66       22.94       41.37       30.28       62.66       70.45
74               44.33       27.96       50.60       36.78       51.32       39.57       48.75       56.52       58.91       24.73
75               36.52       20.64       67.94       11.76       35.41       45.77       45.42       53.02       73.95       22.14
76               53.06       69.12       74.29       66.79       54.68       68.16       71.31       56.76       69.08       67.88
77               48.86       60.74       35.37       33.42       71.63       32.19       63.56       66.01       48.02       42.32
78               25.21       72.72       62.46       32.21       70.53       60.36       62.53       60.97       36.17       26.25
79               34.84       47.57       24.33       60.61       38.04       18.67       39.46       28.96       64.56       50.32
80               69.75       48.99       52.22       54.45       27.87       22.99       53.46       55.10       31.00       61.15
81               67.13       66.95       66.86       66.47       65.92       65.39       66.17       66.37       66.56       67.12
82               40.64       45.74       11.72       66.49       46.45       43.15       48.95       44.93       23.41       19.46
83               43.13       53.21       29.84       57.55       66.45       23.45       44.33       37.58       51.68       34.82
84               31.94       54.41       17.31       73.85       64.93       16.60       32.45       31.11       63.31       26.36
85               49.26       36.26       40.83       20.74       37.62       27.34       47.15       52.50       49.11       65.93
86               67.13       66.95       66.86       66.47       65.92       65.39       66.17       66.37       66.56       67.12
87               67.13       66.95       66.86       66.47       63.05       65.39       66.17       66.37       66.56       67.12
88               63.65       62.25       43.45       42.27       25.87       45.84       37.53       50.14       63.22       64.99
89               33.51       56.81       28.22       44.59       48.07       54.88       63.54       52.39       56.60       45.97
90               55.10       54.86       31.91       46.02       33.45       45.55       50.19       43.30       14.54       54.11
91               49.62       54.49       35.95       35.43       37.20       35.27       52.66       54.80       40.23       48.32
92               33.69       40.41       65.57       50.68       27.82       34.79       48.47       45.02       46.57       65.76
93               49.23       47.68       52.77       36.71       43.29       40.85       56.27       53.81       57.78       67.00
94               54.57       73.86       64.59       25.73       29.61       53.74       50.67       51.03       51.81       64.04
95               17.33       57.94       63.50       61.42       18.97       50.61       30.25       32.76        9.87       30.57
96               43.98       58.49       35.74       51.61       47.30       27.36       38.93       69.38       55.52       45.25
97               50.74       61.99       48.21       52.51       56.27       55.80       66.98       63.33       59.19       56.54
98               46.25       49.86       19.61       54.20       43.38       42.80       42.71       46.86       28.48       37.34
99               67.13       66.95       66.86       62.78       65.92       65.39       66.17       66.37       66.56       67.12
100              67.13       66.95       66.86       66.47       65.92       65.39       66.17       66.37       63.19       67.12
101              67.13       66.02       66.86       66.47       65.92       65.39       66.17       66.37       63.19       66.79
102              53.74       58.56       47.48       46.32       30.37       50.09       63.27       53.98       66.72       42.92
103              69.76       49.21       52.96       55.00       27.27       20.68       53.46       54.64       31.66       61.05
104              13.43       49.60       60.56       61.68       40.69       58.02       59.72       47.38       64.46       72.69
105              67.13       66.95       66.86       66.47       65.92       65.39       66.17       66.37       66.56       67.12
106              67.13       66.02       66.86       59.36       65.92       62.37       63.96       66.37       62.85       66.79
107              36.52       30.88       26.46       48.37       64.05       69.88       41.43       20.07       49.31       52.63
108              67.13       66.95       66.86       66.47       63.05       65.39       66.17       66.37       63.19       67.12
109              65.70       47.79       17.72       49.40       16.70       28.96       38.53       35.42        9.01       65.01
110              36.61       43.27       39.86       26.00       35.89       43.04       32.78       66.89       37.99       61.97
111              29.81       35.91       36.74       38.67       37.12       37.10       47.10       56.31       51.52       38.68
112              54.60       41.26       69.97       45.57       27.90       25.30       45.31       48.36       38.26       62.64
113              57.69       58.56       38.29       28.40       36.69       46.62       34.37       41.12       40.29       69.70
114              68.12       25.40       23.77       46.86       34.25       19.39       52.00       65.68       48.34       26.94
115              70.44       16.09       41.47       19.47       43.01       35.08       21.85       67.89       21.47       44.84 ;

table ql(t,k) 
                     1           2           3           4           5           6           7           8           9          10
71               20.55       32.17       21.72       15.91       62.46        9.62       15.77       50.65       36.78       60.36
72               43.53       39.74       34.54       42.64       40.82       37.99       47.60       45.43       42.13       54.91
73               14.00       32.54       38.57       57.25       22.67       21.42       37.92       28.76       58.82       69.95
74               40.73       23.67       46.53       31.39       48.12       34.26       45.31       53.49       56.59       17.52
75               30.71       19.52       66.88       11.46       33.84       43.77       40.50       49.99       73.95       21.55
76               49.44       68.73       74.29       65.95       52.91       67.46       71.07       53.98       68.94       67.19
77               45.05       58.94       30.42       29.76       71.37       26.26       61.81       65.15       44.27       39.23
78               19.96       72.53       60.95       26.50       70.06       58.36       61.40       59.59       31.54       20.30
79               31.37       43.05       22.95       58.97       36.24       18.06       36.49       27.75       63.35       46.24
80               69.26       46.21       49.53       52.32       21.66       14.97       50.53       52.08       25.29       59.50
81                9.24        8.99        9.02        9.49        8.93       10.58       12.28       13.85       10.86       11.38
82               36.90       42.83       11.33       66.02       43.23       40.54       45.34       41.44       21.58       18.77
83               38.80       51.19       25.48       55.62       65.31       18.17       39.94       31.93       48.07       30.57
84               28.17       52.30        8.58       73.85       64.66       11.42       26.53       26.55       62.59       18.11
85               45.95       32.17       35.40       14.92       33.04       21.27       45.00       50.22       46.94       64.73
86                9.24        8.99        9.02        9.49        8.93       10.58       12.28       13.85       10.86       11.38
87               10.38        8.99        9.02        9.49        8.93       10.58       12.28       13.85        9.91       11.38
88               62.67       60.35       38.47       37.26       19.23       43.31       31.82       46.65       62.44       63.38
89               31.81       54.37       25.97       40.64       43.74       51.79       61.89       50.40       54.98       42.62
90               52.15       52.29       28.08       42.69       31.54       41.66       47.51       38.12       14.23       50.80
91               45.35       51.60       31.64       29.81       31.49       31.44       50.41       51.68       35.40       44.21
92               31.76       38.60       59.97       48.08       26.07       32.35       46.26       43.12       42.79       59.32
93               46.67       45.34       49.13       34.13       39.20       38.34       53.96       51.94       56.45       66.01
94               51.35       73.80       63.22       24.49       28.04       50.59       45.63       47.38       48.83       62.28
95               16.21       55.16       57.90       56.23       17.88       45.86       27.79       31.14        9.87       28.97
96               39.35       55.72       30.03       48.53       45.00       22.44       34.28       68.90       53.75       41.29
97               47.63       60.22       45.81       49.18       53.39       53.27       66.31       62.13       56.92       54.82
98               44.13       47.46       19.03       51.03       39.46       39.30       39.74       42.24       27.43       35.21
99               10.38        8.99        9.02        9.49        8.93       10.58       12.28       13.85        9.91       11.38
100               9.24        8.99        9.02        9.49        8.93       10.58       12.28       13.85        9.91       11.38
101              10.38        8.99        9.02        9.49        8.93       12.56       12.28       13.85       10.86       18.70
102              50.58       56.12       44.14       43.90       23.41       46.90       62.03       51.90       66.25       37.39
103              69.26       46.21       49.53       52.32       21.66       14.97       50.53       52.08       25.29       59.50
104              12.97       45.85       56.68       60.47       37.02       56.02       57.68       45.73       63.55       72.44
105               9.24        8.99        9.02        9.49        8.93       10.58       12.28       13.85        9.91       11.38
106               9.24        8.99        9.02        9.49        8.93       12.67       12.28       16.28        9.91       18.70
107              33.02       26.06       20.57       45.52       62.49       69.58       35.99       12.59       46.38       50.19
108               9.24        8.99        9.02        9.49        8.93       10.58       12.28       13.85        9.91       11.38
109              62.02       44.28       16.84       45.54       16.08       27.97       35.48       32.91        9.01       60.80
110              32.04       38.08       35.56       20.54       32.25       40.33       26.44       65.98       31.98       60.57
111              27.81       33.79       34.12       33.59       31.71       34.84       42.89       52.89       49.84       35.95
112              51.09       37.96       69.26       43.22       22.34       20.13       42.67       44.04       35.14       60.65
113              56.21       57.17       33.62       24.41       32.78       42.18       29.81       37.46       37.46       69.10
114              67.11       23.19       22.54       44.94       31.41       18.48       49.34       64.52       44.69       25.50
115              62.72       10.26       35.74       10.61       39.91       31.25       13.84       67.33       15.37       41.72 ;

parameter bl(i); 
bl(i) = 0; 

parameter bu(i) / 1  168, 2  71, 3  75, 4  84, 5  102, 6  28, 7  28, 8  77, 9  28, 10  99, 
		 11  89, 12  166, 13  126, 14  172, 15  21, 16  104, 17  124, 18  21, 19  123, 20  163, 
		 21  74, 22  114, 23  65, 24  168, 25  34, 26  127, 27  83, 28  147, 29  146, 30  68, 
		 31  121, 32  149, 33  142, 34  34, 35  167, 36  157, 37  89, 38  28, 39  69, 40  65, 
		 
		 41  71, 42  127, 43  138, 44  87, 45  62, 46  139, 47  112, 48  110, 49  123, 50  81, 
		 51  71, 52  62, 53  105, 54  79, 55  94, 56  88, 57  74, 58  87, 59  55, 60  50, 
		 61  134, 62  138, 63  120, 64  52, 65  88, 66  127, 67  92, 68  64, 69  127, 70  58, 
		 
		 71  127, 72  197, 73  190, 74  74, 75  169, 76  155, 77  171, 78  136, 79  151, 80  99, 
		 81  196, 82  111, 83  153, 84  196, 85  77, 86  121, 87  174, 88  142, 89  123, 90  202, 
		 91  142, 92  211, 93  100, 94  189, 95  103, 96  195, 97  105, 98  136, 99  119, 100  118, 
		 101  209, 102  162, 103  77, 104  219, 105  175, 106  182, 107  189, 108  182, 109  122, 110  168, 
		 111  108, 112  140, 113  70, 114  140, 115  82 /;

$include xmodel.gms