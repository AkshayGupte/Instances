$ontext
	 randstd36 pooling problem data.
	 Author: Akshay Gupte, written from AMPL.
$offtext

$eolcom #

set i    /1 * 87/;
set s(i) /1 * 30/;
set t(i) /53 * 87/;
set k    /1 * 10/;


alias (i,j);

parameter c(i,j)
	 / 1.(33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 30
	   2.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 34
	   3.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 31
	   4.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 34
	   5.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 32
	   6.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 27
	   7.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 30
	   8.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 31
	   9.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 31
	   10.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 30
	   11.(31,32,33,34,36,37,38,39,41,42,43,44,45,46,47,48,49,50,51,52) 	 40
	   12.(32,34,35,38,39,41,42,48,49,50,52) 	 34
	   13.(31,32) 	 23
	   14.(31,32) 	 29
	   15.(40,51) 	 30
	   16.(31,32) 	 21
	   17.(31,32,36) 	 24
	   18.(31,32) 	 18
	   19.(31,32,33) 	 36
	   20.(31,32,35) 	 46
	   21.(31,32,37) 	 41
	   22.(31,32) 	 29
	   23.(31,32,40) 	 27
	   24.(31,32) 	 23
	   25.(31,32,43) 	 23
	   26.(31,32,46) 	 36
	   27.(31,32,47) 	 21
	   28.(31,32,45) 	 21
	   29.(31,32) 	 22
	   30.(32,44) 	 36
	   (37,38,41,42,43,44,49,51).53 	 -21
	   (35,37,38,44,48,49,51,52).54 	 -87
	   (32,35,37,41,43,44,45,48,52).55 	 -60
	   (32,33,34,35,36,40,41,47,48,49,52).56 	 -30
	   (32,33,37,40,41,42,43,45,47,49,50,52).57 	 -91
	   (31,33,37,39,43,48,49,51).58 	 -31
	   (31,38,40,41,42,44,49,50,51,52).59 	 -91
	   (31,33,36,39,40,41,42,44,45,46,47,49,50,51).60 	 -49
	   (33,34,35,42,45,49,51,52).61 	 -53
	   (33,34,37,41,42,43,44,45,46,47,48,52).62 	 -41
	   (33,37,39,40,41,42,43,44,45,47,48,50,52).63 	 -24
	   (33,34,39,40,43,45,47,48,49,50).64 	 -28
	   (33,34,35,36,37,40,41,42,44,47,50).65 	 -97
	   (33,37,44,47,48).66 	 -62
	   (34,37,46,50,51).67 	 -97
	   (31,33,35,39,44,50,51,52).68 	 -43
	   (31,32,33,34,36,37,45,47,49,50).69 	 -64
	   (33,34,35,37,38,39,42,44,45,51).70 	 -69
	   (32,33,35,37,42,45,46,49,50).71 	 -47
	   (32,33,34,35,41,42).72 	 -52
	   (31,32,36,38,41,42,47,48,52).73 	 -21
	   (32,33,34,37,38,39,41,45,46,48,50,52).74 	 -91
	   (34,36,38,40,41,42,46,47,49,50,51).75 	 -38
	   (31,36,37,39,40,41,47,49,50,52).76 	 -23
	   (31,32,34,35,37,40,43,44,45,47,48,50,51).77 	 -79
	   (35,41,42,43,48,49,50,51).78 	 -88
	   (32,33,34,35,37,43,44,45,46,47,49,51).79 	 -77
	   (32,33,34,40,42,43,50,51).80 	 -64
	   (32,33,36,43,44,45,47,49,52).81 	 -18
	   (31,32,36,39,43,45,49,50,51,52).82 	 -16
	   (32,40,41,43,46,49,52).83 	 -85
	   (31,33,38,43,47,48,52).84 	 -81
	   (32,34,35,37,38,40,41,42,43,45,47,49,51).85 	 -83
	   (32,37,38,40,43,46,49).86 	 -49
	   (32,34,37,38,40,41,44,45,49,50,51).87 	 -75
	   1.59  -61 , 1.84  -51 , 3.55  -29 , 3.72  -21 , 3.82  15 , 
	   5.54  -55 , 6.63  3 , 7.53  9 , 7.84  -51 , 9.73  10 , 
	   10.59  -61 , 10.70  -39 , 10.81  12 , 11.63  16 , 11.64  12 , 
	   14.65  -68 , 14.73  8 , 15.57  -61 , 15.74  -61 , 18.77  -61 , 
	   19.59  -55 , 19.70  -33 , 19.76  13 , 20.73  25 , 22.67  -68 , 
	   23.70  -42 , 25.87  -52 , 26.73  15 , 26.83  -49 , 27.70  -48 , 
	   27.74  -70 , 28.66  -41 , 28.80  -43  /;

parameter a(i,j);
a(i,j) = 1$(c(i,j) ne 0);


table qu(i,k) 
                     1           2           3           4           5           6           7           8           9          10
1                55.99       13.48       17.58       68.14       45.62       27.55       15.80       19.48       12.76       39.18
2                38.16       35.85        8.54       66.18       63.34       10.97       16.24       62.65       52.70       40.20
3                16.02       58.98       10.58       54.88       17.59       70.51       21.11       59.36       71.82       56.86
4                60.99       48.94       16.56       35.41       70.21       21.44       49.04       68.51       17.37       22.89
5                21.38       39.67       54.36       52.98       16.93       35.22       28.77       70.69       54.11       74.91
6                34.52       30.38       14.71       20.40       41.26       62.56       46.18       37.25       37.89       19.92
7                55.38       73.05       62.92       41.52       68.57       53.39       53.97       50.01       63.55       27.99
8                20.25       23.95       73.19       12.43       45.57       53.62       25.48       70.60       72.86       32.95
9                14.52       44.28       11.73       56.65       26.24       72.12       62.88       66.72       23.07       59.99
10               67.33       21.35       65.44       69.91       71.11       31.30       66.85       57.95       19.46       38.32
11               61.13       65.04       30.37       16.08       15.73       42.02       29.46       15.90       59.10       40.58
12               46.01       25.10       51.82       56.14       51.74       25.65       12.81       18.75        8.21       18.82
13               46.21       61.06       54.06       40.41       16.39       44.35       51.28       42.78       39.58       34.25
14               60.33       50.57       28.63       23.21       62.55       24.39       29.91       37.02       44.32       39.37
15               46.16       43.19       43.40       58.87       43.78       56.56       47.05       59.57       33.65       59.71
16               36.98       40.15       58.75       60.49       52.92       58.02       52.58        8.35       45.52       59.69
17               24.56       15.40       16.58       37.35       61.03       67.60       26.23       23.14       39.22       55.10
18               66.81       40.96       54.22       33.04       24.43       46.47       30.39        8.95       11.92       66.15
19                9.73       71.50       42.32       41.93       37.80       58.10       37.74       57.50       11.81       65.16
20               12.67       29.09       48.98       57.82       56.78       71.79       53.36       14.75       70.42       15.95
21               53.21       38.98       19.41       39.64       23.92       47.16       61.40       57.30       22.77       13.49
22               70.61       36.95       29.71       52.58       20.34       52.58       62.73       54.64       71.45       37.78
23               69.92       17.51       31.62       15.14       49.92       31.96       64.80       58.22       31.05       50.49
24               55.52       44.01       42.19       68.25       66.07       16.49       63.20       38.44       40.44       51.89
25               66.78       34.77       31.38       40.44       15.31       23.62       34.17       23.96       11.03       69.90
26                9.90       61.49       67.80       63.94       16.42       54.34       12.66       74.53       18.41       42.19
27               42.15       73.10       37.94       29.45       33.54       29.74       74.61       49.71       48.10       51.70
28               46.52       52.44       22.05       73.47       45.38       22.24       22.61       15.37       40.93       25.42
29               45.43       35.10       74.80       20.94       11.79       31.33       27.66       15.06       10.00       35.18
30               67.23       69.59       19.59       31.09       22.08       34.10       74.63        9.83       50.40       67.36
53               51.10       27.68       22.84       67.65       54.49       27.87       22.36       40.38       34.07       43.20
54               60.60       65.75       65.87       62.92       64.00       64.91       67.17       63.62       65.57       67.42
55               51.32       50.41       23.07       28.70       37.82       52.85       59.73       31.94       47.38       44.07
56               28.26       44.01       56.92       55.15       23.80       39.26       35.08       71.18       56.38       74.91
57               63.55       65.79       67.32       66.12       64.00       64.91       67.17       67.08       65.57       67.42
58               25.67       29.08       73.41       18.77       48.40       55.17       29.72       70.92       72.86       39.21
59               63.55       65.79       67.32       66.12       64.00       64.91       67.17       67.08       65.57       67.42
60               48.98       30.87       55.18       57.82       53.86       32.08       17.81       24.83       17.69       26.20
61               49.92       64.65       58.62       47.45       59.24       49.42       50.74       57.63       59.17       43.27
62               20.69       61.85       47.19       61.15       22.47       62.60       22.61       68.56       46.18       51.94
63               45.26       73.10       40.92       33.07       36.81       34.93       74.61       51.63       51.60       54.18
64               62.93       65.79       65.87       66.12       64.00       64.91       67.15       63.62       65.57       67.42
65               62.93       65.79       65.87       62.92       64.00       64.91       67.17       63.62       65.57       67.42
66               60.60       65.79       65.87       66.12       64.00       64.91       67.17       63.62       65.57       67.42
67               70.61       36.95       29.71       52.58       20.34       55.10       63.31       54.64       71.60       37.78
68               41.56       44.75       59.45       62.74       55.90       56.28       55.64       19.74       48.91       60.85
69               63.55       65.79       67.32       66.12       64.00       64.91       67.17       67.08       65.57       67.42
70               62.93       65.79       65.87       66.12       64.00       64.91       67.17       63.62       65.57       67.42
71               63.55       65.79       67.32       66.12       64.00       64.91       67.17       67.08       65.57       67.42
72               67.76       28.42       66.39       70.27       71.11       36.17       67.68       60.22       25.18       43.05
73               19.72       41.55       55.85       61.34       50.36       67.93       47.73       36.00       59.02       29.45
74               49.38       47.43       43.40       60.12       43.78       56.56       49.42       59.57       33.65       61.69
75               24.64       39.27       42.69       50.73       45.12       63.51       24.99       48.30       36.28       51.99
76               20.23       66.79       32.52       50.80       34.70       64.40       34.44       60.30       41.87       63.02
77               50.34       53.73       29.33       73.11       49.51       28.52       29.95       24.43       44.75       31.76
78               60.60       65.75       65.87       62.92       64.00       64.91       60.16       63.62       65.57       67.42
79               49.34       33.39       35.19       43.93       41.56       43.06       53.74       62.07       38.93       23.13
80               63.55       65.79       67.32       66.12       64.00       64.91       67.17       67.08       65.57       67.42
81               44.40       35.89       22.01       64.39       47.73       36.73       26.38       44.60       42.29       45.91
82               63.55       65.79       67.32       66.12       64.00       64.91       67.17       67.08       65.57       67.42
83               34.52       35.38       14.71       20.40       44.73       63.79       50.14       37.25       43.03       19.92
84               63.55       65.79       67.32       66.12       64.00       64.91       67.15       67.08       65.57       67.42
85               46.94       60.82       24.70       28.43       18.93       52.88       39.63       31.37       51.30       49.13
86               63.55       65.79       67.32       66.12       64.00       64.91       67.17       67.08       65.57       67.42
87               67.10       39.25       31.38       40.44       15.31       28.27       37.97       23.96       11.03       70.42 ;

table ql(t,k) 
                     1           2           3           4           5           6           7           8           9          10
53               49.25       21.93       14.16       67.40       52.31       21.29       15.97       35.79       27.85       39.57
54               13.94       14.83        9.39       13.67       17.30       12.07       14.09       10.81        9.03       14.84
55               47.99       46.53       16.72       24.80       33.36       50.84       57.89       25.96       43.04       39.45
56               21.38       39.67       54.36       52.98       16.93       35.22       28.77       70.69       54.11       74.91
57               10.70       14.83        9.39       13.67       12.97       12.07       13.93        9.19        9.03       14.84
58               20.25       23.95       73.19       12.43       45.57       53.62       25.48       70.60       72.86       32.95
59               10.70       14.83        9.39       13.67       12.97       12.07       13.93        9.19        9.03       14.84
60               46.01       25.10       51.82       56.14       51.74       25.65       12.81       18.75        8.21       18.82
61               48.30       63.57       57.06       43.54       57.23       46.62       47.95       56.19       57.51       37.98
62               12.55       60.40       43.06       60.02       16.93       61.33       16.31       67.97       41.51       48.53
63               42.15       73.10       37.94       29.45       33.54       29.74       74.61       49.71       48.10       51.70
64               10.70       14.83        9.39       13.67       16.84       12.07       14.09       16.91        9.03       20.70
65               10.70       14.83        9.39       13.67       17.30       12.07       14.09       10.81        9.03       14.84
66               10.70       14.83        9.39       13.67       17.30       12.07       14.09       10.81        9.03       14.84
67               70.61       35.46       27.13       49.60       20.02       52.58       62.73       52.01       71.45       34.96
68               38.65       40.50       57.26       61.19       54.10       54.28       53.54       11.06       45.06       58.99
69               10.70       14.83        9.39       13.67       12.97       12.07       13.93        9.19        9.03       14.84
70               10.70       14.83        9.39       13.67       17.30       12.07       14.09       10.81        9.03       14.84
71               10.70       14.83        9.39       13.67       12.97       12.07       13.93        9.19        9.03       14.84
72               67.33       21.35       65.44       69.91       71.11       31.30       66.85       57.95       19.46       38.32
73               11.99       37.05       53.60       59.32       46.87       67.50       43.36       29.43       57.65       22.39
74               46.16       43.19       39.68       58.87       40.72       51.63       47.05       54.35       31.86       59.71
75               18.54       34.32       37.61       48.27       42.72       62.16       20.66       44.24       30.68       49.80
76               12.56       65.87       28.04       47.76       28.71       63.68       30.26       58.34       38.81       61.42
77               47.23       51.77       23.64       73.06       47.01       21.79       25.81       17.19       40.89       27.51
78               13.94       14.83        9.39       13.67       16.84       12.07       14.09       16.23        9.03       17.55
79               46.82       31.58       32.60       40.39       38.02       39.38       50.47       60.61       35.44       22.10
80               10.70       14.83        9.39       13.67       12.97       12.07       13.93        9.19        9.03       14.84
81               41.47       30.32       13.40       62.96       44.34       33.53       18.19       40.98       37.81       42.62
82               10.70       14.83        9.39       13.67       12.97       12.07       13.93        9.19        9.03       14.84
83               31.41       30.38       14.25       19.57       41.26       62.56       46.18       33.79       37.89       19.19
84               10.70       14.83        9.39       13.67       12.97       12.07       13.93        9.19        9.03       14.84
85               44.59       58.72       22.69       27.61       18.05       51.18       36.59       30.06       48.13       46.49
86               10.70       14.83        9.39       13.67       12.97       12.07       13.93        9.19        9.03       14.84
87               66.78       34.77       29.69       37.97       14.86       23.62       34.17       22.80       10.87       69.90 ;

parameter bl(i); 
bl(i) = 0; 

parameter bu(i) / 1  84, 2  63, 3  134, 4  10, 5  82, 6  161, 7  81, 8  141, 9  28, 10  121, 
		 11  64, 12  28, 13  131, 14  37, 15  28, 16  101, 17  105, 18  178, 19  110, 20  86, 
		 21  155, 22  10, 23  169, 24  152, 25  97, 26  109, 27  84, 28  70, 29  120, 30  28, 
		 
		 31  111, 32  76, 33  127, 34  110, 35  56, 36  56, 37  73, 38  97, 39  113, 40  119, 
		 41  102, 42  119, 43  109, 44  68, 45  119, 46  81, 47  96, 48  115, 49  135, 50  103, 
		 51  54, 52  122, 
		 53  94, 54  198, 55  75, 56  201, 57  209, 58  143, 59  134, 60  122, 61  187, 62  172, 
		 63  182, 64  181, 65  79, 66  216, 67  150, 68  167, 69  116, 70  94, 71  174, 72  204, 
		 73  145, 74  137, 75  95, 76  200, 77  172, 78  117, 79  218, 80  170, 81  173, 82  183, 
		 83  214, 84  154, 85  119, 86  90, 87  151 /;

$include xmodel.gms