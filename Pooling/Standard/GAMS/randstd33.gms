$ontext
	 randstd33 pooling problem data.
	 Author: Akshay Gupte, written from AMPL.
$offtext

$eolcom #

set i    /1 * 87/;
set s(i) /1 * 30/;
set t(i) /53 * 87/;
set k    /1 * 10/;


alias (i,j);

parameter c(i,j)
	 / 1.(32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 23
	   2.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 37
	   3.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 15
	   4.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 45
	   5.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 43
	   6.(33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 48
	   7.(31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 43
	   8.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 46
	   9.(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 42
	   10.(33,34,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) 	 39
	   11.(31,32,33,34,36,38,39,40,41,42,43,44,45,46,47,49,50,51,52) 	 47
	   12.(33,34,35,36,37,38,39,41,42,49,50,51) 	 36
	   13.(31,32,47) 	 35
	   14.(31,32) 	 45
	   15.(31,32,35) 	 40
	   16.(31,32,45) 	 31
	   17.(31,32) 	 31
	   18.(31,32,37) 	 38
	   19.(31,32) 	 45
	   20.(31,32,44) 	 38
	   21.(31,32) 	 38
	   22.(31,32) 	 45
	   23.(31,32) 	 38
	   24.(31,32,48) 	 49
	   25.(31,32) 	 25
	   26.(31,32,48) 	 41
	   27.(43,52) 	 34
	   28.(40,46) 	 35
	   29.(31,32) 	 38
	   30.(31,32,35) 	 45
	   (31,32,33,34,36,38,41,44,48,49,51).53 	 -89
	   (32,34,37,38,39,40,41,42,44,46,49,50,52).54 	 -38
	   (33,34,36,38,39,40,42,44,49,51,52).55 	 -51
	   (32,36,39,40,41,42,45,47,48).56 	 -88
	   (32,33,35,36,38,47,50,51,52).57 	 -70
	   (35,46,47,50,52).58 	 -59
	   (36,37,38,40,47,48,50,51).59 	 -50
	   (31,35,36,38,42,43,44,47,52).60 	 -64
	   (31,36,37,41,44,46,47,49).61 	 -82
	   (32,35,36,37,40,41,42,44,45,52).62 	 -57
	   (31,32,33,36,37,39,46,47).63 	 -39
	   (31,34,41,42,46,47,50,52).64 	 -63
	   (34,35,37,45,46,47,48,50).65 	 -61
	   (32,33,34,36,37,40,41,42,44,46,51,52).66 	 -89
	   (32,34,35,37,38,39,41,49,50).67 	 -78
	   (31,32,37,39,50,52).68 	 -38
	   (31,35,36,38,40,41,43,47,48,51).69 	 -27
	   (33,35,38,39,44,45,50,52).70 	 -32
	   (32,34,36,37,38,39,41,42,44,46,47,48,49,50).71 	 -55
	   (35,37,39,41,42,43,44,47,49,50,51,52).72 	 -73
	   (33,38,39,41,42,44,51).73 	 -82
	   (31,36,38,39,40,43,45,46,47,48,49,52).74 	 -60
	   (37,38,41,42,43,44,45,46,52).75 	 -88
	   (32,33,34,36,37,38,39,42,44,45,49,50).76 	 -95
	   (31,32,35,36,40,41,44,46,49,51,52).77 	 -80
	   (31,32,35,36,38,39,40,43,50,51,52).78 	 -49
	   (33,36,45,47,48,49).79 	 -79
	   (35,38,41,43,44,45,49,52).80 	 -42
	   (31,34,35,36,38,40,41,45,52).81 	 -26
	   (32,33,36,38,40,46,49,52).82 	 -80
	   (31,32,33,34,36,37,39,43,44,48,49,50,51,52).83 	 -91
	   (32,34,35,37,44,47,52).84 	 -95
	   (34,36,37,42,43,51,52).85 	 -80
	   (31,38,39,41,44,46,48,49,50,52).86 	 -21
	   (32,34,36,40,42,45,46,47,48,52).87 	 -31
	   1.60  -41 , 3.69  -12 , 6.55  -3 , 6.78  -1 , 7.72  -30 , 
	   7.74  -17 , 9.62  -15 , 10.72  -34 , 12.58  -23 , 13.70  3 , 
	   14.79  -34 , 15.63  1 , 16.56  -57 , 18.81  12 , 20.54  0 , 
	   20.68  0 , 20.74  -22 , 21.65  -23 , 21.74  -22 , 22.55  -6 , 
	   22.71  -10 , 22.79  -34 , 24.74  -11 , 26.86  20 , 27.66  -55 , 
	   29.72  -35 , 30.75  -43  /;

parameter a(i,j);
a(i,j) = 1$(c(i,j) ne 0);
a('20','54') = 1; a('20','68') = 1; 

table qu(i,k) 
                     1           2           3           4           5           6           7           8           9          10
1                69.14       60.24       53.88       23.62       63.47       37.27       28.93       13.62       48.08       20.68
2                19.81       72.54       51.42       59.29       57.86       65.29       47.29       24.61       23.69       42.22
3                60.08       65.23       57.83       63.40        8.12       12.41       34.31       72.76       55.32       46.28
4                16.29       73.45       46.13        9.82       27.59       39.83       56.47       53.41       74.22       37.65
5                15.84       66.78       11.40       23.02       50.25       19.85       30.58       31.85       51.38       17.46
6                11.64       13.01       47.07       12.25       25.93       69.18       53.49       15.08       10.39       57.10
7                17.52       64.35       40.12       25.97       45.37       34.96       14.28       71.96       68.18       21.71
8                21.21       63.96       30.03       51.53       38.22       29.04       20.78       74.96       73.36       10.75
9                30.60       50.13       40.66       55.02       62.57       62.24       64.08       14.69       59.37       21.54
10               17.83       36.01       21.23       56.19        8.61       45.60       12.52       63.02       41.35       57.05
11               11.69       70.02       26.22       20.66       71.48       47.83       45.53       10.60       22.72       53.08
12               25.61       15.19       42.93       29.21        8.35       27.35       68.58       59.76       62.30       59.84
13               19.79       46.63       38.16       33.02       57.25       28.64       59.09       58.98       28.13       60.83
14               32.70       41.22       73.23       11.54       60.34       65.16       10.16       19.86       69.62       72.34
15               39.30       14.70       32.12       11.78       31.56       55.67       37.65       17.61       44.03       58.39
16               13.37       20.89       47.30       38.74       65.66       20.82       39.34       66.97       36.85       61.33
17               17.12       27.98       48.91       49.83       23.09       55.85       28.54       34.10       45.85       73.36
18               12.37       24.27       14.08       33.13       42.12       37.53       19.20       24.20       65.45       35.12
19               42.13       28.60       15.12       34.01       41.91       67.82       67.86       26.77       65.54       33.79
20               17.56       48.39       62.29       36.39       72.85       52.52       63.98       43.96       33.86       57.35
21               32.20       44.49       31.35       13.19       40.42       31.40       13.41       11.83       28.87       27.33
22               55.78       14.28       50.94       18.17       68.33       30.62       21.63       13.80       49.52       37.72
23               20.51       52.53       25.72       33.70       45.99       36.98       24.23       13.09       13.04       65.66
24               70.38       33.89        8.21       57.08       10.71       66.34       18.33       22.06       17.43       68.71
25               63.45       56.25       25.96       58.85       37.59       62.28       26.73       14.80       29.30        8.92
26               15.04       21.09       19.94       24.23       56.51       49.64       68.80       13.12       73.32       57.52
27               44.79       17.56       29.18        8.15       23.31       64.66       35.60       50.57       60.12       26.76
28               29.15       33.36       16.70       28.10       49.61       54.15       67.39       13.96       63.40       38.08
29               49.74       30.48       28.06       22.09       36.81       40.03       64.32       64.20       37.19       22.21
30               12.15       39.58       46.13       73.56       25.30       16.97       11.94       66.66       62.81       43.78
53               26.04       55.03       30.48       37.62       44.69       38.63       26.47       21.81       19.62       63.81
54               22.70       71.09       46.14       33.43       39.35       44.15       49.15       57.69       68.85       37.35
55               18.75       31.57       48.15       20.69       33.66       63.48       53.54       29.02       29.91       52.25
56               28.35       38.29       48.64       42.93       23.72       39.12       62.90       52.70       53.82       56.45
57               63.34       66.11       65.91       66.20       65.56       62.26       61.92       67.46       66.80       66.02
58               62.23       66.11       52.05       66.20       64.33       62.26       61.72       67.46       66.80       54.75
59               63.34       66.11       52.05       57.06       64.33       62.26       61.92       67.46       66.80       61.84
60               21.61       67.12       25.46       30.49       60.89       39.21       44.53       26.06       44.44       37.38
61               18.12       37.58       23.74       54.62       15.82       43.09       19.42       63.94       39.39       59.91
62               21.29       67.73       21.47       28.57       53.01       28.79       36.25       35.23       52.89       23.88
63               46.91       54.15       45.89       55.87       25.27       26.41       34.71       58.62       60.61       46.63
64               63.34       66.11       65.91       66.20       65.56       62.26       61.92       67.46       66.80       66.02
65               18.52       25.91       48.69       41.86       65.62       27.57       42.44       67.83       42.18       62.06
66               47.21       17.56       29.18        8.15       23.31       65.18       35.60       53.62       61.75       26.76
67               57.33       51.36       44.78       25.58       60.11       42.35       27.13       16.03       51.39       24.53
68               63.34       66.11       65.91       66.20       65.56       62.26       61.92       67.46       66.80       66.02
69               42.08       23.34       37.41       20.53       37.03       57.13       41.28       22.83       47.97       60.26
70               62.23       66.11       56.06       66.20       65.56       62.26       61.72       67.46       66.80       55.20
71               20.38       31.15       28.85       31.65       57.30       50.34       64.28       25.07       72.94       55.80
72               35.06       61.09       44.71       39.23       56.52       46.13       31.50       48.10       62.59       26.39
73               62.23       66.11       56.06       57.06       65.56       62.26       61.72       67.46       66.80       53.86
74               28.85       45.29       50.73       40.81       59.57       55.47       54.22       39.28       30.35       59.78
75               62.23       66.11       56.06       66.20       65.56       62.26       61.72       67.46       66.80       55.20
76               63.34       66.11       65.91       66.20       65.56       62.26       61.92       67.46       66.80       66.02
77               23.31       32.89       42.13       28.29       26.11       34.78       53.16       64.78       65.28       49.01
78               23.16       71.20       46.09       18.54       35.10       42.14       54.38       51.90       67.27       44.74
79               57.59       20.42       53.92       22.00       68.73       35.28       25.86       22.59       53.13       42.12
80               47.29       23.15       33.35       15.72       27.36       65.09       39.45       53.16       61.51       31.88
81               63.34       66.11       65.91       66.20       65.56       62.26       61.92       67.46       66.80       66.02
82               30.64       36.66       43.55       21.14       55.99       60.11       43.34       16.44       67.08       55.41
83               63.34       66.11       65.91       66.20       65.56       62.26       61.92       67.46       66.80       66.02
84               63.34       66.11       65.91       66.20       65.56       62.26       61.92       67.46       66.80       66.02
85               62.23       66.11       52.05       57.06       64.33       62.26       61.72       67.46       66.80       53.86
86               44.76       55.27       44.99       48.62       36.11       33.37       48.84       50.79       58.74       53.73
87               63.34       66.11       65.91       66.20       65.56       62.26       61.92       67.46       66.80       66.02 ;

table ql(t,k) 
                     1           2           3           4           5           6           7           8           9          10
53               24.68       49.69       28.32       35.16       41.31       33.74       24.72       21.22       18.77       62.35
54               17.98       70.86       42.53       26.44       33.86       39.95       46.08       55.72       68.16       31.14
55               13.07       26.10       46.04       15.46       27.72       62.57       51.81       24.27       23.46       51.23
56               23.81       32.99       45.56       38.55       22.55       36.26       61.97       48.85       50.32       54.37
57               12.80       14.31        9.03        8.97        8.93       13.65       11.18       11.66       11.43        9.81
58               12.80       14.31       12.54        8.97        8.93       13.65       13.13       11.66       11.43       11.83
59               12.80       14.31        9.03       10.80        8.93       13.65       13.77       11.66       11.43       11.83
60               15.95       66.33       21.10       26.41       59.82       36.10       40.27       21.75       40.74       31.99
61               17.74       35.27       22.52       52.76       15.43       39.84       18.64       62.42       36.84       57.61
62               16.01       67.03       13.16       24.61       50.58       21.85       31.31       31.53       50.16       18.55
63               43.38       50.89       42.52       52.81       20.02       21.20       29.02       55.76       58.87       42.37
64               12.80       14.31        9.03        8.97        8.93       13.65       11.18       11.66       11.43        9.81
65               13.88       21.38       47.42       39.01       65.03       20.73       39.28       67.03       37.05       61.16
66               44.79       17.28       26.88        8.15       22.03       64.66       33.78       50.57       60.12       25.46
67               55.39       46.52       42.87       23.60       58.04       37.84       25.72       15.60       49.13       22.56
68               12.80       14.31        9.03        8.97        8.93       13.65       11.18       11.66       11.43        9.81
69               39.30       14.70       32.12       11.78       31.56       55.67       37.65       17.61       44.03       58.39
70               12.80       14.31       12.54        8.97        8.93       13.65       13.13       11.66       11.43       11.83
71               15.28       25.24       21.88       24.40       55.44       48.23       63.57       18.76       72.83       54.09
72               32.07       59.45       43.16       33.73       54.05       43.19       29.86       43.45       61.46       21.45
73               12.80       14.31       12.54       10.80        8.93       13.65       13.77       11.66       11.43       11.83
74               27.62       42.19       45.74       37.40       53.50       51.00       50.53       36.74       27.94       55.77
75               12.80       14.31       12.54        8.97        8.93       13.65       13.13       11.66       11.43       11.83
76               12.80       14.31        9.03       10.80        8.93       13.65       11.18       11.66       11.43        9.81
77               22.38       29.15       39.78       26.11       18.86       29.51       50.20       63.22       63.97       44.59
78               16.82       70.84       43.58       12.81       29.89       39.47       52.44       48.37       66.57       41.15
79               55.78       14.28       50.94       18.17       68.33       30.62       21.63       13.80       49.52       37.72
80               44.79       17.56       29.18        8.15       23.31       64.66       35.60       50.57       60.12       26.76
81               12.80       14.31        9.03        8.97        8.93       13.65       11.18       11.66       11.43        9.81
82               28.45       34.11       40.46       19.65       54.12       58.78       39.27       15.99       66.01       52.48
83               12.80       14.31        9.03        8.97        8.93       13.65       11.18       11.66       11.43        9.81
84               12.80       14.31        9.03        8.97        8.93       13.65       11.18       11.66       11.43        9.81
85               12.80       14.31       12.54        8.97        8.93       13.65       13.77       11.66       11.43       11.83
86               40.30       53.01       42.44       46.11       30.93       28.13       45.91       46.83       56.09       50.49
87               12.80       14.31        9.03        8.97        8.93       13.65       11.18       11.66       11.43        9.81 ;

parameter bl(i); 
bl(i) = 0; 

parameter bu(i) / 1  111, 2  37, 3  171, 4  158, 5  87, 6  67, 7  71, 8  34, 9  37, 10  69, 
		 11  68, 12  98, 13  12, 14  88, 15  103, 16  90, 17  97, 18  110, 19  166, 20  103, 
		 21  145, 22  74, 23  90, 24  28, 25  131, 26  101, 27  79, 28  80, 29  34, 30  135, 
		 
		 31  69, 32  58, 33  109, 34  69, 35  73, 36  58, 37  77, 38  98, 39  91, 40  65, 
		 41  81, 42  91, 43  56, 44  63, 45  139, 46  94, 47  89, 48  66, 49  96, 50  77, 
		 51  134, 52  130, 
		 53  71, 54  111, 55  86, 56  181, 57  215, 58  186, 59  192, 60  129, 61  146, 62  83, 
		 63  170, 64  83, 65  174, 66  169, 67  124, 68  178, 69  128, 70  83, 71  73, 72  122, 
		 73  132, 74  209, 75  86, 76  84, 77  81, 78  151, 79  87, 80  121, 81  185, 82  198, 
		 83  147, 84  185, 85  90, 86  120, 87  179 /;

$include xmodel.gms