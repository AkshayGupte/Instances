$ontext
	 randstd44 pooling problem data.
	 Author: Akshay Gupte, written from AMPL.
$offtext

$eolcom #

set i    /1 * 115/;
set s(i) /1 * 40/;
set t(i) /71 * 115/;
set k    /1 * 10/;


alias (i,j);

parameter c(i,j)
	 / 1.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 22
	   2.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 37
	   3.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 39
	   4.(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 36
	   5.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 34
	   6.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 44
	   7.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 35
	   8.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 37
	   9.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 36
	   10.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 37
	   11.(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 35
	   12.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 38
	   13.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70) 	 35
	   14.(41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,70) 	 39
	   15.(41,42,43,44,45,46,47,50,51,53,54,55,56,57,58,59,60,62,63,66,67,70) 	 38
	   16.(41,42,44,47,51,54,55,58,60,61,62,66,67,70) 	 39
	   17.(41,42,68) 	 33
	   18.(41,42,65) 	 37
	   19.(45,50) 	 35
	   20.(41,42) 	 33
	   21.(41,42) 	 36
	   22.(41,42,53) 	 38
	   23.(41,42,69) 	 34
	   24.(42,52) 	 31
	   25.(41,42) 	 34
	   26.(41,42) 	 33
	   27.(41,42) 	 35
	   28.(41,42) 	 40
	   29.(41,42,48) 	 44
	   30.(52,68) 	 29
	   31.(46,57,65) 	 33
	   32.(41,42) 	 35
	   33.(41,42,48) 	 39
	   34.(64,69) 	 1
	   35.(41,42,63) 	 40
	   36.(49,61) 	 36
	   37.(56,64) 	 36
	   38.(59,69) 	 44
	   39.(41,42) 	 41
	   40.(43,49) 	 26
	   (41,44,45,50,54,55,57,58,59,61,63,64,66).71 	 -60
	   (41,46,47,49,52,55,63,66,69).72 	 -18
	   (42,43,44,46,47,49,50,54,55,59,68).73 	 -77
	   (41,42,44,48,50,51,52,56,58,61,62,64,67).74 	 -54
	   (41,48,56,57,58,59,60,63,66,67).75 	 -81
	   (44,45,49,50,51,53,54,55,59,60,61,62,64,65,66,68,69,70).76 	 -48
	   (41,42,43,45,48,52,54,57,59,64,68).77 	 -19
	   (41,43,45,46,47,52,53,55,61,64,65,67,68,69,70).78 	 -71
	   (44,45,46,48,51,53,56,57,59,61,63,64,66,69).79 	 -78
	   (41,46,49,51,55,60,62,63,64,67,69,70).80 	 -67
	   (44,50,51,52,54,55,56,60,62,63,65,66,67,68).81 	 -32
	   (41,42,46,55,56,58,59,65,66,67,68,69).82 	 -71
	   (44,46,49,50,51,53,54,57,59,60,63,66).83 	 -65
	   (44,45,47,49,51,52,54,58,61,62,63,65,67,70).84 	 -21
	   (42,49,51,52,53,54,59,64,65,66,70).85 	 -33
	   (41,43,44,45,47,48,50,51,57,58,59,60,62,64,66,67,70).86 	 -59
	   (41,43,47,52,56,58,59,61,62,65,66).87 	 -46
	   (41,47,49,53,54,56,58,59,63,66).88 	 -94
	   (41,42,43,46,48,50,52,53,58,60,64,66,70).89 	 -62
	   (46,48,51,54,57,58,59,63,64,65,69).90 	 -40
	   (45,50,51,52,53,58,61,68).91 	 -27
	   (41,44,45,49,50,51,52,56,59,60,61,64,65,68,69).92 	 -19
	   (41,42,43,46,48,50,51,56,57,58,61,62,63,65,68,69,70).93 	 -35
	   (41,45,51,56,57,60,61,62,63,67,68,69).94 	 -21
	   (42,43,44,45,48,49,52,53,64,68,69,70).95 	 -36
	   (41,43,44,46,47,51,53,57,58,59,62,63,64,65,66,68,70).96 	 -55
	   (44,46,48,52,53,54,55,56,57,61,64,65,67,69).97 	 -45
	   (43,47,49,53,55,58,59,61,62,66,68,69).98 	 -33
	   (42,45,49,51,52,54,55,57,59,64,69).99 	 -98
	   (44,46,48,53,54,55,56,57,59,61,63,64,66,67).100 	 -79
	   (42,44,45,47,49,50,52,54,55,57,60,61,66,70).101 	 -35
	   (41,47,48,49,52,53,56,59,63,69,70).102 	 -88
	   (42,46,47,51,54,55,59,63,66,68,69,70).103 	 -91
	   (41,42,43,45,46,48,49,50,52,53,54,56,59,62,67,69).104 	 -46
	   (42,44,50,52,58,60,64,68,69,70).105 	 -81
	   (41,42,43,44,46,52,56,59,62,63,67,68,69,70).106 	 -25
	   (44,47,49,50,51,53,54,55,56,57,60,61,62,64,66,67,69).107 	 -90
	   (43,44,46,49,51,53,57,59,64,65,68).108 	 -45
	   (41,45,49,52,55,56,58,60,61,62,63,65,69,70).109 	 -79
	   (41,42,45,52,59,61,63,64,65,66,67,69).110 	 -89
	   (47,48,50,51,56,57,62).111 	 -39
	   (41,43,48,50,51,52,54,56,57,58,59,60,64,65).112 	 -33
	   (42,44,46,47,48,56,58,60,62,63,65).113 	 -87
	   (41,42,47,49,50,51,52,54,56,58,59,63,65,68).114 	 -40
	   (43,44,49,51,52,53,56,59,60,61,65,67,68,69).115 	 -29
	   1.73  -55 , 1.97  -23 , 1.103  -69 , 1.105  -59 , 1.115  -7 , 
	   2.75  -44 , 2.99  -61 , 3.106  14 , 5.100  -45 , 6.82  -27 , 
	   6.84  23 , 6.86  -15 , 6.109  -35 , 7.90  -5 , 8.75  -44 , 
	   8.78  -34 , 9.102  -52 , 9.112  3 , 10.75  -44 , 10.86  -22 , 
	   11.72  17 , 11.93  0 , 12.111  -1 , 13.96  -20 , 13.104  -11 , 
	   15.76  -10 , 16.85  6 , 17.85  0 , 17.89  -29 , 17.112  0 , 
	   19.97  -10 , 20.71  -27 , 20.82  -38 , 20.115  4 , 21.73  -41 , 
	   21.78  -35 , 22.105  -43 , 23.78  -37 , 23.81  2 , 23.98  1 , 
	   23.99  -64 , 24.80  -36 , 26.74  -21 , 27.71  -25 , 27.86  -24 , 
	   31.79  -45 , 31.86  -26 , 31.90  -7 , 32.97  -10 , 32.100  -44 , 
	   33.89  -23 , 34.92  -18 , 34.94  -20 , 37.97  -9 , 38.85  11 , 
	   38.91  17 , 38.94  23 , 38.101  9 , 39.74  -13 , 39.93  6 , 
	   39.96  -14 , 39.99  -57 , 40.96  -29  /;

parameter a(i,j);
a(i,j) = 1$(c(i,j) ne 0);
a('11','93') = 1; a('17','85') = 1; a('17','112') = 1; 

table qu(i,k) 
                     1           2           3           4           5           6           7           8           9          10
1                35.56       14.59       20.48       58.76       22.63       73.41       65.74       30.50       32.41       64.74
2                53.09        8.09       45.41       48.93       52.07       61.29       10.65       15.60       56.44       45.65
3                41.69       56.43       51.76       69.44       36.64       57.70       40.02       72.37       16.89       13.62
4                26.47       54.68       71.85       12.32       14.04       42.61       58.42       50.68       22.95       22.89
5                24.72       63.16       27.66       30.56       20.66       20.51       54.33       54.46       26.21       35.34
6                53.12       54.10       20.17       42.63       54.29       26.35       32.89       44.15       52.20       59.09
7                48.65       71.14       54.99       48.61       35.79       14.61       31.66       38.99       28.15       46.33
8                67.16       13.82       49.08       24.23       53.47       10.64       24.28       37.21       22.43       42.88
9                69.25       36.41       50.71       68.84       72.94       66.58       46.71       42.44       28.33       27.10
10               15.92       69.18       48.58       62.13       18.13       40.04       67.40       26.07       62.11       35.87
11               20.34       49.73       41.86       47.80       56.97       47.19       48.59       60.71       14.57       33.88
12               42.17       14.39       71.09       38.41       31.34       65.91       53.93       32.03       19.47       45.41
13               25.04       13.72       23.13       19.51       66.57       56.82       48.64       20.90       33.48       52.21
14               16.20       18.63       40.11       26.10       58.26       28.58       52.72       32.33       17.13       62.36
15               14.59       38.31       68.69       36.32       28.54       68.96       56.37       48.05       23.19       39.44
16               19.58       34.31       64.25       23.94       68.84       34.73       25.49       25.50       58.33       31.77
17               48.01       54.42       42.92       10.88       15.18       40.45        8.61       17.74       48.22       48.94
18               53.42       62.20       37.17       68.61       13.10       45.77       71.43       62.85       29.77       62.37
19               39.18       11.90       57.60       18.77       68.23       59.18       59.61       74.27       24.14       17.14
20               10.11       66.06       67.37       26.02       30.40       47.67       74.17       22.18       73.10       57.00
21               33.48       56.54       62.74       31.66       39.20       36.96       29.53       28.14       66.08       57.88
22               19.65       50.33       63.46       47.20       20.27       51.73       30.47       23.77       52.49       39.09
23               30.12       44.97       21.39       26.24       36.91       32.08       68.23       64.94       53.33       27.30
24               54.56       50.85       59.56       40.03       16.85       55.22       42.81       18.28       72.34       56.07
25               12.64       10.48       70.59       64.12        9.80        8.57       43.74       58.80       39.49       24.38
26               50.77       50.14       72.61       16.77       41.60       67.96       17.88       56.85       16.24       12.25
27               16.77       48.40       60.77       12.53       15.37       43.69       30.23       65.51       42.98       13.69
28               57.32       41.59       47.61       30.38       21.64       32.68       56.88       59.99       72.11       10.57
29               20.41       48.02       34.54        9.90       44.48       15.86       25.63       38.23       16.03       54.69
30               36.75       61.97       23.67       50.33       33.13       46.32       33.89       70.04       71.21       71.86
31               31.94       32.47       49.70       34.19       54.18       34.36       73.25       24.45       68.84       28.58
32               13.06       69.10       23.46       12.05       22.47       69.17       67.13        8.49       41.83        8.92
33               16.93       57.29       67.47       63.62       22.84       55.11       40.79       28.96       45.41       73.66
34               67.02       50.59       51.66       65.88       27.54       58.05       42.28       46.66       15.38       28.40
35               28.06       65.17       56.85       74.89       51.97       50.65       26.11       20.42       11.71       20.90
36               18.41       57.39       70.74       55.52       49.57       54.86       56.10       44.51       47.93       28.29
37               24.62       56.59       68.71       62.31       64.77       51.41       33.98       72.13       55.81       33.80
38               11.72       69.80        8.89       24.86       13.63       68.34       12.18       28.99       36.39       50.75
39               17.57       23.20       56.59       51.86       33.18       40.85       73.50       67.77       56.65       72.69
40               64.33       63.00       38.17       44.54       23.28       53.02       24.46       60.99       70.45       29.51
71               18.79       66.77       68.13       32.77       35.58       51.52       74.17       28.76       73.10       58.53
72               52.38       36.71       51.21       41.85       46.04       25.78       42.06       38.76       41.39       43.30
73               63.09       62.25       37.83       48.26       33.84       51.22       31.48       59.21       67.55       39.98
74               46.95       52.02       66.63       30.43       49.07       63.88       30.99       58.95       21.50       23.05
75               34.93       63.15       53.62       67.35       34.40       51.91       52.29       52.96       36.88       29.10
76               20.71       47.73       69.68       46.50       40.43       64.91       58.21       50.79       35.30       39.20
77               26.93       49.75       47.26       51.03       57.53       51.91       52.15       60.51       21.52       40.17
78               67.38       13.82       51.69       24.23       55.54       10.64       24.28       37.21       22.43       42.88
79               62.33       64.03       64.66       67.40       65.65       66.07       65.92       66.84       61.96       66.29
80               38.47       54.25       38.50       48.41       57.52       42.06       45.85       54.75       34.76       48.08
81               35.32       47.94       25.92       30.60       41.70       36.08       68.73       66.31       55.52       31.73
82               62.33       64.03       65.35       67.40       65.65       66.07       66.75       65.13       65.79       66.29
83               45.22       14.39       71.15       38.41       31.34       66.77       56.82       32.03       19.47       47.65
84               62.33       64.03       64.66       67.40       65.65       66.07       65.92       66.84       65.11       64.67
85               28.08       52.75       64.26       50.30       29.11       54.99       35.37       31.32       53.83       43.15
86               62.33       64.03       65.35       67.40       65.65       66.07       66.75       66.84       65.79       66.29
87               62.33       64.03       65.35       67.40       65.65       66.07       66.75       65.13       65.79       66.29
88               18.41       59.14       71.00       55.52       49.57       57.48       58.36       44.51       50.30       28.29
89               24.67       58.71       68.05       64.57       28.46       57.04       45.45       33.24       47.94       73.66
90               32.79       34.45       49.97       34.93       55.90       33.35       71.12       25.19       67.05       29.49
91               42.57       28.02       32.07       57.54       25.92       70.73       62.48       34.97       41.94       64.07
92               37.85       30.86       48.09       44.92       58.86       44.22       50.71       39.51       27.52       54.02
93               49.81       45.10       49.20       59.15       26.96       57.01       65.91       51.42       32.64       58.46
94               16.57       69.98       18.12       31.40       19.15       68.86       20.44       32.93       40.63       53.26
95               46.53       57.30       45.66       26.45       23.33       47.06       21.41       32.77       54.40       53.13
96               38.91       44.53       53.97       39.21       43.59       44.16       35.64       50.52       64.75       43.24
97               38.40       53.34       46.47       29.19       33.03       62.88       57.97       30.65       53.03       33.38
98               62.33       64.03       64.66       62.50       65.65       66.07       61.41       65.13       64.09       64.67
99               17.57       23.20       56.59       51.86       33.18       40.85       73.50       67.77       56.65       72.69
100              62.33       64.03       64.66       67.40       65.65       66.07       65.92       65.13       61.96       66.29
101              34.11       57.37       58.85       56.47       46.23       52.81       35.23       42.15       28.69       25.97
102              35.96       54.82       64.37       49.02       58.52       56.96       32.75       65.92       34.01       27.41
103              28.68       21.07       34.12       30.60       60.52       52.88       45.40       24.44       32.79       49.93
104              60.18       50.22       51.94       58.42       57.95       48.05       36.78       41.86       31.14       36.97
105              62.33       64.03       65.35       67.40       65.65       66.07       66.75       66.84       65.79       66.29
106              30.42       63.40       35.92       37.22       28.77       29.46       52.77       53.84       32.63       40.84
107              39.04       14.96       21.29       59.07       23.49       72.78       66.18       30.41       36.51       64.19
108              33.46       42.33       57.89       40.93       32.50       43.70       56.43       37.09       32.35       46.92
109              55.42       55.87       20.17       42.63       55.89       26.35       36.57       48.58       52.20       60.34
110              62.33       64.03       65.35       67.40       65.65       66.07       66.75       66.84       65.79       66.29
111              62.33       64.03       64.66       62.50       65.65       66.07       65.92       66.84       61.96       66.29
112              51.42       33.53       62.31       31.23       54.72       64.47       31.97       51.79       34.09       27.49
113              62.33       64.03       65.35       67.40       65.65       66.07       66.75       65.13       65.79       66.29
114              62.33       64.03       65.35       67.40       65.65       66.07       66.75       66.84       65.79       66.29
115              28.87       36.44       69.52       37.27       37.94       61.73       54.28       43.71       31.01       41.83 ;

table ql(t,k) 
                     1           2           3           4           5           6           7           8           9          10
71               10.11       66.06       67.37       26.02       30.40       47.67       74.17       22.18       73.10       57.00
72               49.56       32.84       48.91       37.25       41.33       20.74       39.09       33.38       36.06       40.47
73               62.05       61.19       34.51       44.15       29.59       47.59       26.18       57.56       66.74       35.53
74               44.11       50.29       65.70       23.91       44.88       62.81       24.74       57.48       16.01       17.36
75               30.54       62.06       50.34       66.12       30.45       49.59       49.61       50.57       33.72       23.08
76               15.90       44.84       69.39       42.90       35.74       64.13       56.28       46.84       31.66       35.62
77               21.78       47.40       43.79       47.18       55.28       48.42       48.94       58.82       14.89       34.64
78               67.16       13.13       49.08       22.85       53.47       10.38       23.07       34.12       21.19       40.25
79               12.89        8.90        9.78       10.89       14.99       11.70       11.72       17.16       12.88       14.98
80               35.45       52.25       32.77       45.57       55.20       37.17       41.26       52.86       31.38       45.24
81               30.12       44.97       21.39       26.24       36.91       32.08       68.23       64.94       53.33       27.30
82               11.12        8.90        9.78       10.89       10.78        9.43        9.47        9.34       12.88        9.81
83               42.17       13.85       71.09       35.90       29.07       65.91       53.93       29.91       18.86       45.41
84               16.05        8.90       22.19       13.55       14.41       11.70       11.72       17.16       12.88       14.98
85               21.43       49.83       63.00       47.98       22.16       52.26       31.05       24.44       51.62       38.66
86               11.12        8.90        9.78       10.89       10.78        9.43        9.47        9.34       12.88        9.81
87               11.12        8.90        9.78       10.89       10.78        9.43        9.47        9.34       12.88        9.81
88               17.76       57.39       70.74       50.29       46.25       54.86       56.10       41.12       47.93       27.21
89               16.93       57.29       67.47       63.62       22.84       55.11       40.79       28.96       45.41       73.66
90               31.03       33.09       47.85       32.72       53.24       31.07       66.37       24.26       66.76       28.66
91               38.81       20.79       27.16       55.56       21.64       70.30       61.82       28.41       39.24       63.26
92               34.33       25.71       43.83       40.28       56.84       40.92       48.53       35.43       20.62       50.60
93               46.93       41.49       47.12       57.33       20.31       55.20       64.89       48.34       27.36       56.29
94               11.72       69.80        8.89       24.86       13.63       68.34       12.18       28.99       36.39       50.75
95               43.61       55.07       42.13       20.53       18.56       42.53       14.66       26.18       51.98       51.28
96               36.85       39.81       51.03       36.37       40.83       39.83       33.75       48.40       63.31       39.81
97               34.47       51.01       44.25       24.42       28.92       61.74       56.06       24.85       50.57       29.18
98               12.89        8.90        9.78       11.97       14.99       11.70        9.47       17.16       16.03       14.98
99               16.79       21.47       50.63       46.67       30.44       36.91       67.87       61.31       54.03       66.31
100              12.89        8.90        9.78       10.89       14.99       11.70       11.72        9.34       12.88        9.81
101              28.81       56.01       57.30       53.96       42.28       50.13       29.04       36.73       24.10       19.67
102              31.35       53.00       63.34       45.24       55.98       55.30       31.28       64.81       32.66       25.69
103              26.64       19.40       30.37       26.01       59.43       50.94       42.86       23.37       31.70       47.30
104              59.06       47.88       49.12       55.40       55.42       44.52       33.83       38.26       29.24       33.65
105              11.12        8.90        9.78       10.89       10.78        9.43        9.47        9.34       12.88        9.81
106              26.15       62.37       30.60       31.17       21.74       23.86       49.62       51.29       27.76       35.36
107              35.26       14.37       20.60       58.12       22.29       72.69       64.99       28.52       32.89       64.13
108              28.27       39.90       55.80       38.29       30.94       41.09       54.91       33.29       30.35       44.35
109              53.12       54.10       19.36       40.56       54.29       24.96       32.89       44.15       48.18       59.09
110              11.12        8.90        9.78       10.89       10.78        9.43        9.47        9.34       12.88        9.81
111              16.05        8.90       22.19       10.89       15.44       11.70       11.72       17.16       16.03       14.98
112              48.31       27.40       60.53       26.78       51.90       63.62       27.06       49.43       30.22       23.41
113              11.12        8.90       22.19       10.89       10.78        9.43        9.47        9.34       12.88        9.81
114              11.12        8.90        9.78       10.89       10.78        9.43        9.47        9.34       12.88        9.81
115              25.11       32.81       69.29       32.19       32.42       60.27       52.09       40.79       26.38       38.06 ;

parameter bl(i); 
bl(i) = 0; 

parameter bu(i) / 1  135, 2  87, 3  103, 4  42, 5  130, 6  92, 7  88, 8  161, 9  118, 10  169, 
		 11  178, 12  179, 13  96, 14  176, 15  130, 16  82, 17  96, 18  130, 19  91, 20  175, 
		 21  97, 22  134, 23  151, 24  178, 25  145, 26  172, 27  42, 28  119, 29  114, 30  163, 
		 31  167, 32  72, 33  176, 34  28, 35  153, 36  128, 37  34, 38  63, 39  144, 40  166, 
		 
		 41  115, 42  117, 43  113, 44  59, 45  137, 46  73, 47  75, 48  78, 49  122, 50  121, 
		 51  81, 52  82, 53  139, 54  54, 55  69, 56  52, 57  106, 58  63, 59  91, 60  74, 
		 61  139, 62  53, 63  123, 64  79, 65  90, 66  98, 67  107, 68  115, 69  131, 70  125, 
		 
		 71  96, 72  112, 73  149, 74  74, 75  197, 76  73, 77  199, 78  88, 79  206, 80  110, 
		 81  207, 82  186, 83  203, 84  93, 85  127, 86  145, 87  183, 88  97, 89  143, 90  189, 
		 91  105, 92  217, 93  201, 94  89, 95  117, 96  172, 97  174, 98  176, 99  106, 100  108, 
		 101  106, 102  167, 103  184, 104  128, 105  150, 106  145, 107  172, 108  193, 109  94, 110  87, 
		 111  219, 112  214, 113  140, 114  197, 115  186 /;

$include xmodel.gms