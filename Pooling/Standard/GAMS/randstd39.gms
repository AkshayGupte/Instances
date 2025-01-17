$ontext
	 randstd39 pooling problem data.
	 Author: Akshay Gupte, written from AMPL.
$offtext

$eolcom #

set i    /1 * 87/;
set s(i) /1 * 30/;
set t(i) /53 * 87/;
set k    /1 * 10/;


alias (i,j);

parameter c(i,j)
	 / 1.(33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 40
	   2.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 41
	   3.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 42
	   4.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 15
	   5.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 43
	   6.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 42
	   7.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 47
	   8.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 43
	   9.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 42
	   10.(31,32,33,34,35,36,37,38,39,40,41,42,43,45,46,47,48,49,50,51,52) 	 41
	   11.(33,35,36,37,38,39,40,41,42,43,45,46,47,50,51,52) 	 41
	   12.(31,32,33,35,36,38,41,42,45,47,50) 	 43
	   13.(31,32) 	 40
	   14.(34,49) 	 22
	   15.(44,46) 	 41
	   16.(37,44) 	 45
	   17.(39,48,52) 	 47
	   18.(31,32) 	 37
	   19.(31,32) 	 33
	   20.(31,32) 	 40
	   21.(31,32) 	 46
	   22.(40,51) 	 42
	   23.(31,32,34) 	 40
	   24.(31,32) 	 37
	   25.(31,32,43) 	 45
	   26.(31,32,48) 	 42
	   27.(44,49) 	 40
	   28.(31,32) 	 38
	   29.(31,32) 	 37
	   30.(31,32) 	 36
	   (31,33,37,38,42,44,46).53 	 -73
	   (33,36,40,41,45,48,50).54 	 -41
	   (34,35,37,40,42,43,45,47,49,50,51,52).55 	 -72
	   (33,34,37,39,41,42,43,45,46,47,50,52).56 	 -64
	   (33,36,37,44,49,50).57 	 -75
	   (32,35,43,46,49).58 	 -30
	   (32,35,36,38,41,43,45,46,48,49,50,51).59 	 -66
	   (33,36,38,44,47,48,49,51,52).60 	 -31
	   (32,33,34,41,42,44,45,46,47,49).61 	 -65
	   (33,34,39,40,41,42,44,45,46,49,50).62 	 -50
	   (32,33,36,38,41,44,45,46,47,49).63 	 -82
	   (33,34,35,37,38,39,40,43,45,46,52).64 	 -69
	   (31,35,36,37,38,42,45).65 	 -76
	   (31,39,44,45,51,52).66 	 -43
	   (35,42,43,45,48,52).67 	 -86
	   (32,33,35,36,37,38,39,42,44,45,48,50,52).68 	 -52
	   (33,36,40,41,42,45,46,47,49).69 	 -43
	   (33,35,37,39,41,44,46,48,49,50,51).70 	 -94
	   (31,36,37,40,44,45).71 	 -38
	   (32,34,36,37,40,41,48,49).72 	 -63
	   (32,35,37,40,45,47,48,51).73 	 -99
	   (32,33,34,37,40,42,49).74 	 -17
	   (33,36,37,38,39,40,43,44,45,47,48,50,51,52).75 	 -72
	   (32,37,40,41,43,48,49,50).76 	 -74
	   (31,35,40,44,46,49,50,51,52).77 	 -37
	   (32,33,37,38,39,40,41,44,45,46,47,51,52).78 	 -40
	   (33,36,37,38,42,44,45,50,51,52).79 	 -87
	   (32,34,35,36,39,40,44,48,50).80 	 -47
	   (32,34,36,37,39,40,42,44,45,48,51,52).81 	 -93
	   (32,33,35,40,42,45,46,48,49,50).82 	 -96
	   (31,36,39,41,42,43,50).83 	 -49
	   (31,34,38,40,42,44,48,49,51,52).84 	 -60
	   (32,33,36,37,38,39,42,44,45,48,50,51,52).85 	 -66
	   (31,32,33,38,39,44,49,50,51).86 	 -64
	   (34,36,39,40,41,43,45,46,49,50,52).87 	 -70
	   3.55  -30 , 3.68  -10 , 3.74  25 , 4.81  -78 , 5.69  0 , 
	   5.70  -51 , 7.82  -49 , 8.57  -32 , 8.67  -43 , 8.77  6 , 
	   9.60  11 , 11.77  4 , 12.66  0 , 13.60  9 , 13.64  -29 , 
	   13.70  -54 , 14.65  -54 , 14.79  -65 , 15.81  -52 , 16.78  5 , 
	   16.80  -2 , 17.59  -19 , 17.74  30 , 18.54  -4 , 18.68  -15 , 
	   18.80  -10 , 18.84  -23 , 19.55  -39 , 19.59  -33 , 19.60  2 , 
	   19.74  16 , 20.70  -54 , 20.82  -56 , 21.57  -29 , 21.67  -40 , 
	   21.78  6 , 22.57  -33 , 22.61  -23 , 23.79  -47 , 24.60  6 , 
	   25.56  -19 , 25.71  7 , 25.74  28 , 26.65  -34 , 26.66  -1 , 
	   27.61  -25 , 27.72  -23 , 27.73  -59 , 27.79  -47 , 27.82  -56 , 
	   27.85  -26 , 28.56  -26 , 28.87  -32 , 30.65  -40  /;

parameter a(i,j);
a(i,j) = 1$(c(i,j) ne 0);
a('5','69') = 1; a('12','66') = 1; 

table qu(i,k) 
                     1           2           3           4           5           6           7           8           9          10
1                31.81       67.28       59.76       37.80       48.94       17.30       61.46       62.34       20.97       68.74
2                28.79       21.09       50.55       65.74       57.33       37.19       56.69        8.42       25.91       35.96
3                42.35       30.00       31.89       59.66       34.20       44.62       28.37       41.04       56.28       58.19
4                57.35       58.49       74.86       68.98       72.17       38.51       20.40       27.80       21.46       39.90
5                26.50       70.48       40.55       10.85       43.95       33.85       16.55       44.44       15.50       32.46
6                68.28       36.61       69.86       17.50       56.69       45.49       16.30       31.27       27.63       24.16
7                63.47       41.69       25.10       28.88       63.21       13.29       60.04       27.64       32.51       40.45
8                29.86       17.33       65.47       18.45       73.92       16.62       73.62       47.84       36.20       55.59
9                70.25       33.99       27.93       36.29       17.38       11.27       33.51       65.16       40.38       65.07
10               54.83       21.47       23.57       27.15       50.30       38.54       52.12       13.89       22.17       50.13
11               56.89       48.79       41.62       45.80       38.14       63.85       50.42       39.12       65.00       67.04
12               23.20       53.90       58.33       41.55       53.84       51.76       72.54       18.21       54.99       42.78
13               44.28       25.81       19.14       47.91       24.25       41.86       38.38       23.18       44.98       52.61
14               29.77       72.60       38.14       14.95       62.16       74.34       70.07       32.02       67.76       60.75
15               72.21       37.01       12.35       21.68       51.09       74.38       55.39       28.13       44.16       32.79
16               61.45       73.45       32.80       10.73       19.47       10.38       49.29       29.87       74.56       16.26
17               12.89       21.40       11.13       71.53       61.85       25.98       63.28       61.99       37.17       66.83
18                8.05       70.16       34.88       11.31       42.62       15.33       15.31       46.35       54.79       57.69
19               49.31       13.76       55.98       40.62       45.36       63.25       54.11       60.41       18.56       28.56
20               56.98       11.21       25.72       31.00       56.89       56.96       38.04       51.95       58.51       53.28
21               60.38       39.24       14.37       13.42       50.35       30.66       61.76       18.57       58.88       29.37
22               35.82       63.94       69.34       52.78       24.97       62.85       11.06        8.11       17.74       41.96
23               12.83       41.10       34.23       56.77       72.49       40.02       45.63       37.36        9.80       23.32
24               55.53       39.23       48.59       38.80       14.56       59.40       30.52       43.55       42.06       71.59
25               41.76       71.59       23.97       47.34       11.13       66.03       11.65       37.74        9.42       42.05
26               51.85       46.37       18.17       13.44       55.61       65.15       73.40       12.59       34.29       46.21
27                9.14       19.51       12.95       67.60       61.72       60.40       27.58       69.60       47.60       53.04
28               43.38       47.50       66.39        8.00       47.61       57.77       36.48       42.66       13.87       14.39
29               55.74       38.94       54.09       29.32       26.83       12.12       63.43       13.33       14.03       38.72
30               28.81       60.32       18.22       24.43       55.41       33.09       47.62       27.81       69.00       24.33
53               42.84       33.09       20.78       34.98       47.46       43.39       45.49       33.28       58.79       43.29
54               36.08       67.68       61.20       42.37       52.32       24.35       63.24       62.65       24.50       68.74
55               49.31       13.76       55.98       40.62       45.36       63.25       54.11       60.41       18.56       28.56
56               57.75       45.11       64.13       27.44       56.40       46.68       27.45       34.86       30.31       31.28
57               64.99       66.11       67.37       62.08       66.53       66.94       66.26       62.64       67.10       61.87
58               64.99       65.34       67.37       62.08       66.53       66.94       66.26       62.64       62.10       64.43
59               51.66       13.76       58.47       44.12       48.90       64.60       56.46       61.75       18.56       33.26
60               55.42       43.20       52.19       43.83       25.40       60.08       38.71       44.08       47.34       69.43
61               70.47       33.99       27.93       39.84       17.38       11.27       33.51       65.77       40.38       65.74
62               35.97       32.43       67.08       32.71       64.65       32.01       61.17       41.78       35.67       54.03
63               64.99       66.11       67.37       62.08       66.53       66.94       66.26       62.64       67.10       64.43
64               61.72       34.54       45.45       25.26       54.40       38.45       41.37       24.73       31.63       40.64
65               53.62       48.89       26.07       13.44       57.39       66.08       73.43       12.59       38.11       49.52
66               64.99       66.11       67.37       64.38       66.53       66.94       66.26       62.64       67.10       64.43
67               61.65       39.24       14.37       13.42       50.35       30.66       61.76       24.40       59.65       29.37
68               39.02       52.67       52.32       42.55       58.58       40.66       69.58       25.25       50.92       45.72
69               64.99       65.34       67.37       62.08       66.53       66.94       66.26       62.64       60.98       61.87
70               33.81       69.65       39.55       17.99       62.85       69.88       69.92       35.46       65.21       58.28
71               64.99       66.11       67.37       62.08       66.53       66.94       66.26       62.64       67.10       64.43
72               39.03       56.98       54.79       27.26       46.61       32.70       39.12       37.94       36.83       45.20
73               57.48       58.14       73.97       68.45       72.24       41.67       21.23       27.80       21.69       43.34
74               44.07       71.75       31.21       49.35       19.30       67.02       19.55       42.29       16.82       44.55
75               49.77       54.43       44.77       37.90       57.03       15.03       62.31       45.24       27.52       54.96
76               63.23       66.11       67.37       64.38       66.53       66.91       66.26       62.64       67.10       64.43
77               45.74       23.87       49.37       28.47       63.77       33.78       64.95       36.61       34.18       54.87
78               63.26       63.80       35.36       25.25       33.65       36.38       52.72       37.34       68.67       34.67
79               50.93       53.38       43.28       46.30       40.47       51.74       53.78       47.96       54.09       65.07
80               64.99       66.11       67.37       64.38       66.53       66.94       66.26       62.64       67.10       64.43
81               67.76       31.64       27.11       34.58       23.55       16.38       37.00       57.11       42.44       63.21
82               17.97       25.87       20.28       68.14       63.07       62.01       32.97       69.60       50.68       55.20
83               52.36       47.60       66.08       33.88       58.16       49.57       43.60       29.27       43.37       36.21
84               30.67       46.54       35.94       35.19       56.37       37.02       42.80       37.05       36.52       48.64
85               24.05       36.99       36.32       52.61       60.61       39.93       66.44       46.12       46.04       57.07
86               64.99       66.11       67.37       64.38       66.53       66.94       66.26       62.64       67.10       64.43
87               32.61       44.94       39.18       52.97       64.45       51.73       51.45       39.55       30.60       37.06 ;

table ql(t,k) 
                     1           2           3           4           5           6           7           8           9          10
53               39.53       30.65       20.25       31.92       44.43       41.59       41.39       30.17       57.08       40.15
54               31.81       67.28       59.76       37.80       48.94       17.30       61.46       62.34       20.97       68.74
55               44.99       13.76       50.43       37.47       42.15       60.52       50.57       55.64       17.50       27.16
56               55.97       40.59       62.57       21.37       54.86       41.96       21.75       31.57       25.48       27.51
57               10.05       19.06       13.59       11.80       19.12       11.42       12.17        8.92       17.05       17.89
58                8.86       12.33       13.59        8.80       12.24       12.40       12.82        9.26       10.36       15.83
59               49.31       13.55       55.98       40.62       45.36       63.25       54.11       60.41       17.85       28.56
60               52.72       40.54       49.41       39.06       18.05       58.75       34.24       41.33       43.26       69.07
61               70.25       32.03       26.59       36.29       16.88       11.18       32.17       65.16       37.85       65.07
62               31.16       27.46       66.31       25.91       63.28       26.67       60.02       39.20       32.19       52.63
63                8.86       12.33       13.59        8.80       12.24       11.42       12.82        9.26       10.36       15.83
64               60.59       33.66       41.41       23.51       52.32       36.61       37.14       23.51       25.25       37.92
65               51.85       46.37       18.17       12.79       55.61       65.15       73.40       12.06       34.29       46.21
66                8.86       12.33       12.24        8.80       12.24       11.42       12.17        8.92       10.36       15.83
67               60.38       36.41       14.15       13.28       45.79       28.27       58.96       18.57       58.88       29.07
68               34.82       50.38       48.74       37.90       56.54       37.46       68.93       20.93       48.51       42.11
69               10.05       19.06       13.59       11.94       19.12       12.40       12.17        8.92       17.05       26.58
70               30.44       65.87       37.56       17.39       61.42       66.89       64.36       30.55       61.03       54.32
71                8.86       12.33       13.59        8.80       12.24       11.42       12.17        8.92       10.36       15.83
72               34.80       55.01       51.61       21.95       42.55       26.38       34.20       34.19       30.56       40.76
73               53.77       54.38       73.82       68.14       71.98       37.98       20.55       25.70       20.41       39.91
74               41.76       71.59       23.97       47.34       11.13       66.03       11.65       37.74        9.42       42.05
75               46.95       52.77       40.10       32.74       53.87       14.79       60.65       42.66       25.92       52.69
76                8.86       12.33       12.24        8.80       12.24       11.42       12.17        8.92       10.36       15.83
77               41.65       19.29       45.68       22.56       62.77       26.97       63.47       31.81       29.57       53.01
78               61.97       62.53       31.84       20.32       28.32       31.87       50.43       31.73       67.97       30.25
79               46.14       50.23       39.18       43.69       38.02       48.99       50.95       45.13       51.00       64.70
80                8.86       12.33       12.24        8.80       12.24       11.42       12.17        8.92       10.36       15.83
81               67.36       29.17       26.22       33.09       22.46       15.73       34.62       55.55       36.97       62.27
82                9.14       19.51       12.95       67.60       61.72       60.40       27.58       69.60       47.60       53.04
83               49.72       43.73       65.11       27.40       55.52       48.07       39.46       25.89       38.90       31.83
84               26.92       43.83       30.46       29.88       53.80       30.89       37.54       31.68       30.06       45.31
85               23.24       31.42       32.25       49.83       59.25       35.89       65.59       43.42       42.19       53.48
86                8.86       12.33       12.24        8.80       12.24       11.42       12.17        8.92       10.36       15.83
87               28.40       42.07       32.99       50.43       63.36       48.72       47.72       36.58       24.46       32.79 ;

parameter bl(i); 
bl(i) = 0; 

parameter bu(i) / 1  151, 2  10, 3  12, 4  94, 5  17, 6  170, 7  134, 8  104, 9  140, 10  130, 
		 11  147, 12  162, 13  37, 14  84, 15  42, 16  94, 17  83, 18  84, 19  117, 20  150, 
		 21  86, 22  10, 23  141, 24  121, 25  171, 26  129, 27  127, 28  34, 29  100, 30  34, 
		 
		 31  101, 32  136, 33  62, 34  135, 35  104, 36  75, 37  96, 38  55, 39  102, 40  118, 
		 41  135, 42  102, 43  114, 44  66, 45  102, 46  108, 47  53, 48  114, 49  72, 50  85, 
		 51  61, 52  96, 
		 53  182, 54  70, 55  87, 56  96, 57  84, 58  192, 59  200, 60  133, 61  117, 62  94, 
		 63  135, 64  164, 65  175, 66  70, 67  94, 68  93, 69  104, 70  83, 71  175, 72  153, 
		 73  82, 74  161, 75  134, 76  108, 77  72, 78  150, 79  120, 80  92, 81  132, 82  136, 
		 83  94, 84  72, 85  185, 86  152, 87  167 /;

$include xmodel.gms