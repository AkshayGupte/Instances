$ontext
	 randstd20 pooling problem data.
	 Author: Akshay Gupte, written from AMPL.
$offtext

$eolcom #

set i    /1 * 68/;
set s(i) /1 * 25/;
set t(i) /44 * 68/;
set k    /1 * 8/;


alias (i,j);

parameter c(i,j)
	 / 1.(26,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43) 	 45
	   2.(26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43) 	 48
	   3.(26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43) 	 47
	   4.(26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43) 	 44
	   5.(26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43) 	 1
	   6.(26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43) 	 48
	   7.(26,27,28,29,30,31,32,33,34,35,37,38,39,40,41,42,43) 	 17
	   8.(26,27,28,29,30,31,32,33,34,35,37,38,39,40,41,42,43) 	 45
	   9.(26,27,28,29,30,31,32,33,37,38,39,40,41,42,43) 	 34
	   10.(26,27,29,30,31,32,38,41,42) 	 25
	   11.(26,27) 	 26
	   12.(26,27) 	 29
	   13.(26,27) 	 27
	   14.(26,27,36) 	 44
	   15.(26,27,33) 	 15
	   16.(26,27,35) 	 36
	   17.(28,36) 	 29
	   18.(26,27,39) 	 28
	   19.(26,27) 	 18
	   20.(26,27,34) 	 44
	   21.(36,40) 	 41
	   22.(36,37) 	 34
	   23.(27,34,43) 	 36
	   24.(26,27) 	 13
	   25.(26,27,35) 	 25
	   (29,33,35,36,37,38,39).44 	 -88
	   (26,27,28,29,30,31,33,35,37,40,43).45 	 -26
	   (27,31,35,37,43).46 	 -84
	   (30,31,35,37,41,42).47 	 -63
	   (26,27,32,36,39,41).48 	 -30
	   (26,29,30,34,36,37,38,42).49 	 -92
	   (32,33,36,37,38,39,41,43).50 	 -88
	   (31,34,36,37,38,39,40).51 	 -93
	   (26,29,30,31,34,35,36,38,41).52 	 -64
	   (27,28,36,38,43).53 	 -78
	   (28,29,30,31,34,36,38,41,42).54 	 -22
	   (27,29,30,32,34,35,38,39,41).55 	 -44
	   (29,30,31,32,34,35,38,39,43).56 	 -57
	   (35,37,38,39,43).57 	 -93
	   (28,30,31,32,33,36,37,40).58 	 -30
	   (26,27,28,33,34,37,41).59 	 -22
	   (27,31,33,34,35,36,43).60 	 -57
	   (26,27,28,33,36,39,40,41,42).61 	 -45
	   (31,37,38,39).62 	 -26
	   (26,27,28,29,32,33,34,36,39).63 	 -80
	   (27,32,36,40,41,42).64 	 -27
	   (26,29,30,31,33,37,39,40,42).65 	 -50
	   (27,28,29,30,35,39,41,42,43).66 	 -45
	   (26,27,29,30,35,36,42).67 	 -65
	   (26,27,29,30,34,35,36).68 	 -73
	   2.58  18 , 2.66  3 , 3.45  21 , 4.45  18 , 4.53  -34 , 
	   4.64  17 , 4.65  -6 , 5.68  -72 , 7.51  -76 , 8.52  -19 , 
	   9.55  -10 , 9.61  -11 , 9.64  7 , 9.66  -11 , 10.47  -38 , 
	   10.57  -68 , 12.50  -59 , 14.59  22 , 15.64  -12 , 16.59  14 , 
	   17.48  -1 , 17.59  7 , 18.50  -60 , 20.44  -44 , 20.59  22 , 
	   20.67  -21 , 21.68  -32 , 22.63  -46 , 23.61  -9 , 23.67  -29
	     /;

parameter a(i,j);
a(i,j) = 1$(c(i,j) ne 0);


table qu(i,k) 
                     1           2           3           4           5           6           7           8
1                73.18       45.16       19.47       24.20       42.66       35.76       52.08       56.15
2                69.53       35.33       70.39       69.69       34.56       26.60       10.31       53.99
3                14.19       60.94       53.80       33.71       32.95       39.74       59.65       26.53
4                56.68       51.10       11.09       74.04       24.25       64.60       72.70       55.10
5                21.37       41.55       41.30       35.59       57.90       55.05       68.48       45.13
6                71.10       23.05        8.30       42.54       38.76       13.88       23.13       28.16
7                21.22       30.76       36.83       27.36       71.28       46.06       21.69       67.71
8                16.39       49.29        9.96       61.65       42.25       29.61       54.42       68.89
9                73.02       37.37       40.59       48.40       44.80       39.70       46.31       21.10
10               35.81       25.69       58.11       25.21       59.11        8.31       61.63       39.28
11               37.47       59.20       29.20       67.59       14.29       19.21       29.52       53.08
12               23.06       14.41       21.93       19.96       35.09       58.99       52.07       21.31
13               51.08       67.27       67.01       13.91       16.60       66.62       22.46       41.39
14               35.51       53.81        9.20       61.89       41.25       68.04       68.59       29.95
15               65.85       56.94       70.97       19.44       56.69       28.76       51.17       23.73
16               55.96       23.61       11.34       16.26       51.43       32.36       58.35       38.90
17               35.81       19.40        9.95       54.68       69.86       40.00       39.05       23.02
18               69.56       62.99       72.47       42.00       33.13       23.57       19.28       26.84
19               34.00       65.67       60.97       16.28       29.24       61.25       16.65       37.42
20               24.33       13.26       25.23       47.85       34.85       20.27       17.53       42.44
21               66.77       38.45       36.53       61.23       45.35       29.65       58.79       69.61
22               39.38       37.83       30.03       60.09       50.40       58.54       30.42       57.15
23               67.77       46.85        8.24       11.66       65.42       65.14       48.06       24.65
24               62.27       71.12       30.55       40.78       63.91       39.52       15.82       12.41
25               39.61       33.20       31.99       63.15       46.67       20.19       19.40       16.96
44               25.58       43.01       35.89       42.42       57.26       57.35       67.91       43.86
45               57.63       53.53       17.58       71.67       28.11       63.00       68.60       53.24
46               42.15       44.16       23.13       57.03       45.05       33.95       52.35       49.07
47               55.96       23.61       11.34       16.26       52.06       32.36       59.44       38.90
48               65.86       64.01       65.22       66.64       64.15       61.24       65.43       62.65
49               49.32       49.47       30.15       43.57       52.93       32.86       16.49       24.26
50               69.56       62.99       72.47       42.00       33.13       23.57       19.28       26.84
51               73.03       37.37       42.95       48.40       47.15       39.70       46.31       21.10
52               65.73       49.26       15.69       46.71       34.35       49.27       62.34       56.74
53               31.50       43.68       20.93       50.76       54.05       58.18       52.37       42.54
54               42.38       31.46       58.98       34.84       55.49       18.82       54.84       43.67
55               32.56       21.22       26.19       47.11       38.98       24.66       25.85       46.35
56               22.47       58.85       50.70       32.52       34.29       40.96       58.88       30.48
57               65.86       56.69       65.22       66.64       64.15       58.63       65.43       62.00
58               73.18       46.06       22.96       28.43       44.67       37.70       53.18       57.18
59               41.44       22.25       14.22       47.98       65.92       39.91       45.42       29.15
60               22.69       30.90       39.57       27.23       71.23       48.14       21.91       67.35
61               57.26       42.21       34.55       50.04       49.87       37.98       47.97       60.73
62               65.86       56.69       65.22       66.64       64.15       58.14       65.43       62.00
63               39.14       56.96       41.97       54.33       28.44       33.50       27.54       42.67
64               67.17       50.50       70.15       36.64       50.87       29.50       41.21       35.54
65               66.50       27.92       18.28       49.02       42.98       20.64       32.99       42.64
66               17.67       45.11       20.84       52.58       49.92       33.96       46.59       68.60
67               52.55       35.08       14.19       24.34       54.71       49.42       37.36       30.88
68               21.37       41.55       43.28       37.01       59.02       56.10       68.86       46.48 ;

table ql(t,k) 
                     1           2           3           4           5           6           7           8
44               23.77       42.46       33.50       39.80       56.05       56.30       67.50       42.33
45               57.10       52.60       12.55       71.55       27.22       62.72       68.43       51.90
46               40.74       41.03       21.80       55.95       43.35       32.50       50.93       48.34
47               52.21       23.56       11.03       16.26       51.43       29.76       58.35       36.71
48               15.61       14.59        9.06       12.83       15.72        9.14       11.34       13.65
49               47.30       48.30       28.45       41.36       52.45       31.93       16.07       23.30
50               64.44       59.35       66.42       38.97       32.51       22.63       18.47       26.36
51               73.02       35.11       40.59       45.14       44.80       36.64       42.80       21.10
52               60.22       47.84       15.31       43.81       33.09       48.78       61.39       55.68
53               29.89       42.25       17.29       47.28       51.18       57.70       50.79       39.88
54               39.74       28.78       57.94       33.22       55.08       15.95       54.19       42.06
55               30.55       17.32       24.50       44.84       35.84       22.24       21.93       44.18
56               21.89       58.55       48.89       31.36       33.77       39.01       58.36       29.79
57               15.61       25.36        9.06       12.83       26.68        9.14       11.34       18.66
58               73.18       45.16       19.47       24.20       42.66       35.76       52.08       56.15
59               40.32       20.34       10.26       46.08       65.73       38.29       43.37       26.58
60               21.61       28.99       36.59       26.07       71.23       46.22       21.00       61.90
61               55.77       40.83       33.68       48.99       48.69       36.45       46.87       60.10
62               15.61       25.36        9.13       26.62       26.68        9.14       11.34       23.21
63               37.98       56.55       39.43       52.53       24.40       30.55       24.07       41.89
64               67.02       50.05       69.98       34.73       49.86       27.92       38.62       32.81
65               66.24       27.02       17.27       46.65       41.12       19.81       30.74       41.09
66               17.45       44.39       17.06       49.76       47.96       32.13       45.77       68.58
67               49.09       33.78       13.85       22.98       51.00       45.20       34.80       29.52
68               20.79       39.87       41.30       35.59       57.90       55.05       68.48       45.13 ;

parameter bl(i); 
bl(i) = 0; 

parameter bu(i) / 1  148, 2  69, 3  110, 4  153, 5  173, 6  138, 7  167, 8  121, 9  156, 10  115, 
		 11  65, 12  72, 13  159, 14  72, 15  104, 16  162, 17  122, 18  81, 19  79, 20  174, 
		 21  166, 22  88, 23  112, 24  131, 25  21, 
		 26  118, 27  122, 28  87, 29  127, 30  131, 31  120, 32  80, 33  134, 34  119, 35  107, 
		 36  90, 37  100, 38  113, 39  128, 40  130, 41  93, 42  72, 43  118, 
		 44  130, 45  120, 46  189, 47  176, 48  80, 49  180, 50  77, 51  203, 52  156, 53  96, 
		 54  185, 55  88, 56  190, 57  174, 58  73, 59  134, 60  90, 61  77, 62  160, 63  111, 
		 64  151, 65  207, 66  140, 67  157, 68  210 /;

$include xmodel.gms