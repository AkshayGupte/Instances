$ontext
	 randstd29 pooling problem data.
	 Author: Akshay Gupte, written from AMPL.
$offtext

$eolcom #

set i    /1 * 77/;
set s(i) /1 * 25/;
set t(i) /48 * 77/;
set k    /1 * 10/;


alias (i,j);

parameter c(i,j)
	 / 1.(28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47) 	 30
	   2.(26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47) 	 38
	   3.(26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47) 	 39
	   4.(26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47) 	 30
	   5.(26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47) 	 34
	   6.(26,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47) 	 28
	   7.(26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47) 	 9
	   8.(28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47) 	 30
	   9.(26,27,28,30,33,34,35,36,37,38,39,41,43,44,45,46,47) 	 30
	   10.(26,27,28,30,33,37,38,39,45,46,47) 	 34
	   11.(26,27,42) 	 29
	   12.(26,27,32) 	 14
	   13.(26,27,34) 	 18
	   14.(31,35,36) 	 33
	   15.(26,27) 	 21
	   16.(29,32,40) 	 31
	   17.(26,27) 	 26
	   18.(26,27) 	 16
	   19.(26,27,44) 	 32
	   20.(26,27,41) 	 34
	   21.(40,42) 	 20
	   22.(26,27,29) 	 26
	   23.(26,27,31) 	 28
	   24.(26,27,43) 	 29
	   25.(26,27) 	 8
	   (31,35,39,41,43,45,46).48 	 -95
	   (28,29,30,36,38,42,43,44,47).49 	 -73
	   (27,34,36,39,41,43,46,47).50 	 -30
	   (30,34,35,38,39,40,41,44,46).51 	 -46
	   (26,27,29,30,31,32,38,39,40,41,46).52 	 -59
	   (28,30,35,37,38,40,41,43,45,47).53 	 -32
	   (29,32,34,35,40,41,42,44,45).54 	 -98
	   (28,29,33,34,35,36,37,42,43,44,46).55 	 -67
	   (26,28,29,31,45,47).56 	 -36
	   (26,28,32,33,34,35,39,41).57 	 -42
	   (26,27,29,32,33,35,37,39,40,42,43).58 	 -86
	   (26,28,29,32,33,35,47).59 	 -79
	   (26,29,31,32,33,34,38,41,46).60 	 -78
	   (26,27,30,31,34,35,36,37,39,41,42,45).61 	 -60
	   (29,32,35,36,37,41,43,45,47).62 	 -74
	   (26,27,32,33,35,36,39,40,41,42,43,44,46,47).63 	 -28
	   (35,36,41,42,43,44,46,47).64 	 -46
	   (27,32,34,36,38,39,41,43,45).65 	 -99
	   (28,31,33,36,40,41,42,44,46).66 	 -83
	   (26,28,32,34,35,37,38,40,42,43,44,47).67 	 -20
	   (29,31,33,35,36,38,44).68 	 -21
	   (27,30,32,34,36,40,44,45,46).69 	 -36
	   (29,31,36,41,47).70 	 -67
	   (27,28,33,34,38,41,47).71 	 -62
	   (27,30,32,33,43,44,45,46).72 	 -31
	   (27,31,33,35,36,38,39,44).73 	 -18
	   (28,29,30,31,32,33,37,44,45,46).74 	 -83
	   (27,34,35,36,39,40,41,44).75 	 -80
	   (27,28,29,31,38,42,45).76 	 -21
	   (27,28,30,31,38,42,43,44,45).77 	 -76
	   1.62  -44 , 1.73  12 , 2.50  8 , 2.63  10 , 3.57  -3 , 
	   3.61  -21 , 3.71  -23 , 3.73  21 , 4.74  -53 , 5.55  -33 , 
	   6.60  -50 , 6.69  -8 , 7.74  -74 , 8.50  0 , 8.65  -69 , 
	   9.66  -53 , 10.56  -2 , 14.67  13 , 14.72  2 , 15.57  -21 , 
	   16.49  -42 , 16.76  10 , 17.65  -73 , 17.72  -5 , 18.48  -79 , 
	   19.70  -35 , 20.55  -33 , 20.69  -2 , 21.50  -10 , 23.52  -31 , 
	   24.63  1 , 24.69  -7 , 24.76  8  /;

parameter a(i,j);
a(i,j) = 1$(c(i,j) ne 0);
a('8','50') = 1; 

table qu(i,k) 
                     1           2           3           4           5           6           7           8           9          10
1                44.77       68.57       21.76       24.21        8.07       59.55       73.81       29.57       36.57       54.21
2                46.13       70.32       26.78       62.39       16.74       41.69       33.17       55.41       44.99       54.33
3                48.21       28.01       17.19       37.93       57.69       62.13       68.82       36.44       29.18       64.98
4                59.69       53.05       13.65       20.46       65.78       51.61       13.11       51.94       37.95       56.88
5                14.04       40.28       41.25       37.97       32.21       50.87       25.92       17.00       31.20       58.43
6                17.55       21.30       37.42       44.53       52.96       23.39       65.72       32.43        8.45       61.49
7                55.35       35.07       32.38       62.02       32.45       65.56       62.01       17.08       11.39       17.14
8                58.69       28.03       65.54       39.23       31.15       65.38       72.55       51.22       59.11       54.81
9                17.31       67.22       41.62       19.71       57.08       56.47       43.71       73.95       62.33       11.22
10               28.77       61.51       48.87       52.57       43.43       29.12       54.57       34.89       46.21       29.00
11               15.74       28.56       22.49       41.13       10.87       57.00       48.94       61.37       25.23       46.93
12               23.28       71.74       38.04       63.89       54.78       25.39       38.73       57.15       29.69       64.93
13               20.78       20.99       10.63       38.05       38.76       43.24       20.86       30.85       16.93       52.37
14               10.94       50.89       39.94       64.88       74.53       73.72       29.80       45.04       72.81       21.02
15               28.27       56.54        8.40       56.00       35.19       22.30       23.35       46.80       56.13       19.01
16               53.36       60.70       62.71       53.10       68.20       41.63       34.70       42.21       72.98       52.34
17               54.84       58.65       54.07       51.00       62.60       38.09       63.03       37.63       41.24       56.12
18               62.25       66.14       51.44       34.31       26.35       59.13       26.34        8.96       29.66       11.04
19               32.67       48.67       40.18       54.67       35.32       52.13       67.66       68.45       59.44       31.38
20               74.16       32.93       67.73       46.54       51.31       20.93       21.01       32.74       45.56       13.05
21               18.23       20.96       24.34       53.41       24.00       52.92       57.67       55.61       23.77       60.56
22               52.78       46.16       21.93       54.79       56.28       48.66       35.33       23.58       60.04       10.19
23               57.87       12.23       34.05       73.93        9.14       74.59       66.03       53.89       51.21       35.56
24               22.23       46.09       14.94       68.79       67.09       13.69       47.69       15.34       46.90       50.83
25               41.35       14.77       25.06       74.52       44.95       69.47       25.95       73.01       71.94       45.94
48               43.36       60.53       54.13       55.51       51.40       67.62       44.07       22.24       51.07       14.71
49               53.72       63.29       58.99       61.91       67.08       66.35       66.43       66.56       65.68       58.48
50               30.03       56.93       47.46       68.20       74.53       74.04       40.96       55.41       72.81       33.49
51               53.97       51.42       23.80       40.55       56.76       54.39       32.49       58.29       33.35       58.88
52               38.46       63.59       55.45       58.94       52.30       40.99       61.80       49.34       53.10       41.45
53               66.74       63.29       60.96       61.91       67.08       66.35       66.43       66.56       65.68       58.48
54               64.81       34.71       49.67       56.39       48.41       50.46       55.03       22.49       23.18       16.16
55               54.23       45.76       37.50       59.89       46.81       64.37       62.38       41.19       38.18       37.40
56               61.62       30.03       45.32       74.12       33.44       74.59       68.54       59.90       58.00       47.64
57               43.12       62.17       29.40       60.99       48.24       32.85       40.54       57.35       61.92       37.37
58               56.14       37.50       22.79       60.23       60.54       61.96       32.74       37.22       65.69       20.05
59               53.18       69.78       32.22       38.23       26.69       65.03       73.81       39.60       48.17       58.68
60               30.67       66.68       30.67       63.36       52.12       30.09       36.70       59.85       52.85       54.09
61               66.74       64.57       60.96       67.07       67.08       67.13       66.43       66.56       65.53       58.48
62               66.74       64.57       60.96       61.91       67.08       66.35       66.43       66.56       65.68       58.48
63               66.74       64.57       60.96       67.07       67.08       67.13       66.43       66.56       65.68       58.48
64               66.74       63.29       60.96       61.91       67.08       66.35       66.43       66.56       65.53       58.48
65               57.87       51.90       45.95       48.12       65.12       55.26       66.92       37.37       38.58       59.59
66               66.74       63.29       60.96       66.54       67.08       67.13       66.43       66.56       65.68       58.48
67               39.85       58.32       48.45       46.47       53.19       61.49       46.08       52.96       55.21       44.91
68               51.55       45.34       34.70       45.70       62.83       65.30       70.61       51.55       42.06       64.98
69               22.23       46.09       14.94       68.79       67.09       13.69       47.69       15.34       46.90       50.83
70               32.67       57.69       40.18       60.46       35.32       56.95       68.93       69.67       63.96       38.35
71               66.74       64.57       60.96       67.07       60.38       67.13       66.43       66.56       64.75       58.48
72               66.74       64.57       60.96       67.07       67.08       67.13       66.43       66.56       65.68       58.48
73               66.74       64.57       60.96       67.07       67.08       67.13       66.43       66.56       65.53       58.48
74               41.00       66.92       39.96       63.69       32.67       43.71       52.36       55.81       45.72       49.35
75               58.89       58.42       59.20       59.87       66.24       56.96       37.48       37.66       64.33       39.47
76               61.23       64.94       64.30       61.96       70.61       49.13       44.07       52.81       72.98       57.55
77               38.01       29.87       43.26       42.76       35.36       51.83       61.31       54.47       23.30       52.61 ;

table ql(t,k) 
                     1           2           3           4           5           6           7           8           9          10
48               33.02       48.02       47.21       45.56       44.09       64.50       27.61       17.70       45.54       14.11
49               12.03       23.06       15.02       21.68        8.88       15.06       14.42       16.87        9.29       11.21
50               10.94       50.89       39.94       64.88       74.53       73.72       29.80       45.04       72.81       21.02
51               45.02       45.80       19.47       33.90       45.93       41.50       29.23       48.49       29.53       57.10
52               28.77       61.51       48.87       52.57       43.43       29.12       54.57       34.89       46.21       29.00
53               12.03       23.06       15.02       21.68        8.88       15.06       14.42       16.87        9.29       12.34
54               61.57       32.21       44.18       44.52       38.54       42.99       48.32       21.24       18.36       15.18
55               48.55       33.64       27.96       56.23       32.76       61.20       54.78       20.08       13.31       25.00
56               57.87       12.23       34.05       73.93        9.14       74.59       66.03       53.89       51.21       35.56
57               28.27       56.54        8.40       56.00       35.19       22.30       23.35       46.80       56.13       19.01
58               49.63       29.71       18.47       51.43       53.15       54.40       26.18       28.64       63.32       16.46
59               44.77       68.57       21.76       24.21        8.07       59.55       73.81       29.57       36.57       54.21
60               25.22       63.29       25.12       59.24       42.43       26.31       28.20       53.45       41.75       49.61
61               12.03       13.45        9.24       21.68        8.88       15.06       14.42        9.86        9.29       11.21
62               12.03       23.43       15.02       21.68        8.88       15.06       14.42       16.87        9.29       11.21
63               12.03       13.45        9.24       21.68        8.88       15.06       14.42        9.86        9.29       11.21
64               12.03       23.06       15.02       21.68        8.88       15.06       14.42       16.87        9.29       12.34
65               53.38       40.69       37.43       40.37       61.52       43.38       64.30       29.47       30.14       58.07
66               12.03       13.45       15.02       21.68        8.88       23.02       14.42       18.70        9.29       12.34
67               20.25       52.44       38.61       32.74       42.84       52.46       36.66       44.32       44.16       39.81
68               48.21       28.01       17.19       37.93       57.69       62.13       68.82       36.44       29.18       64.98
69               20.18       39.74       12.96       59.22       49.84       13.69       40.57       12.96       40.24       40.71
70               25.01       48.67       32.25       54.67       26.97       52.13       67.66       68.45       59.44       31.38
71               15.44       13.45        9.24       21.68        8.88       15.06       14.42        9.86        9.29       11.21
72               12.03       13.45        9.24       21.68        8.88       15.06       14.42        9.86        9.29       11.21
73               12.03       13.45        9.24       21.68        8.88       15.06       14.42        9.86        9.29       11.21
74               35.77       65.06       33.80       56.53       28.30       34.19       45.94       43.16       39.49       39.21
75               50.13       53.03       55.28       55.38       61.62       47.81       29.02       29.21       60.59       31.30
76               53.36       60.70       62.71       53.10       68.20       41.63       34.70       42.21       72.98       52.34
77               23.69       23.64       28.71       38.29       28.60       45.12       58.14       45.44       20.97       37.00 ;

parameter bl(i); 
bl(i) = 0; 

parameter bu(i) / 1  79, 2  135, 3  120, 4  61, 5  70, 6  97, 7  148, 8  17, 9  63, 10  169, 
		 11  85, 12  107, 13  21, 14  125, 15  146, 16  166, 17  85, 18  115, 19  98, 20  178, 
		 21  128, 22  42, 23  137, 24  105, 25  86, 
		 26  54, 27  58, 28  82, 29  95, 30  73, 31  67, 32  95, 33  78, 34  109, 35  86, 
		 36  135, 37  60, 38  73, 39  94, 40  96, 41  92, 42  123, 43  64, 44  62, 45  74, 
		 46  116, 47  109, 
		 48  182, 49  123, 50  184, 51  143, 52  73, 53  217, 54  167, 55  126, 56  95, 57  77, 
		 58  217, 59  74, 60  217, 61  184, 62  74, 63  200, 64  92, 65  109, 66  142, 67  210, 
		 68  127, 69  86, 70  122, 71  79, 72  99, 73  104, 74  124, 75  153, 76  146, 77  215
		  /;

$include xmodel.gms