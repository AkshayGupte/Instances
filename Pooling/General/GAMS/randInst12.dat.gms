$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3,pl4,pl5,pl6/;
set ARCS(NODES,NODES) / f1.(pl2,pl3,pl4),
		f2.(pl1,pl2,pl4,pl5,pl6),
		f3.(pl1,pl2,pl4,pl5,pl6),
		f4.(pl2,pl3,pl4,pl5,pl6),
		f5.(pl2,pl3,pl4),
		f6.(pl2,pl3,pl4,pl5),
		f7.(pl2,pl3,pl4,pl6),
		f8.(pl1,pl2,pl3,pl5),
		pl1.(pl8),
		pl2.(pl10),
		pl3.(pl8,pl10,B1,B5),
		pl4.(pl7,pl8,pl9,pl10,B3),
		pl5.(pl7,pl8,pl9,B4),
		pl6.(pl7,pl8,B3),
		pl7.(B1,B2,B4,B5),
		pl8.(B1,B2,B5),
		pl9.(B1,B5),
		pl10.(B3,B4) /;

alias(NODES,NODES2);

set FullHorizon /0 * 15/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;
table varcost(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 	 9	 16	 15	 	 	 	 	 	 	 	 	 	 	 
f2	 17	 13	 	 11	 12	 17	 	 	 	 	 	 	 	 	 
f3	 17	 10	 	 17	 13	 11	 	 	 	 	 	 	 	 	 
f4	 	 11	 13	 11	 10	 16	 	 	 	 	 	 	 	 	 
f5	 	 12	 9	 9	 	 	 	 	 	 	 	 	 	 	 
f6	 	 17	 12	 10	 16	 	 	 	 	 	 	 	 	 	 
f7	 	 13	 10	 9	 	 14	 	 	 	 	 	 	 	 	 
f8	 15	 14	 9	 	 12	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 	 7	 	 	 	 	 	 	 
pl2	 	 	 	 	 	 	 	 	 	 6	 	 	 	 	 
pl3	 	 	 	 	 	 	 	 9	 	 5	 16	 	 	 	 10
pl4	 	 	 	 	 	 	 6	 6	 7	 10	 	 	 10	 	 
pl5	 	 	 	 	 	 	 6	 9	 11	 	 	 	 	 11	 
pl6	 	 	 	 	 	 	 5	 9	 	 	 	 	 11	 	 
pl7	 	 	 	 	 	 	 	 	 	 	 13	 16	 	 14	 12
pl8	 	 	 	 	 	 	 	 	 	 	 10	 15	 	 	 16
pl9	 	 	 	 	 	 	 	 	 	 	 17	 	 	 	 17
pl10	 	 	 	 	 	 	 	 	 	 	 	 	 11	 12	 ;

parameter capacity(NODES) / f1 96,f2 234,f3 201,f4 201,f5 300,f6 120,f7 153,f8 120,pl1 85,pl2 70,pl3 92,pl4 92,pl5 92,pl6 105,pl7 212,pl8 137,pl9 160,pl10 212,B1 70,B2 70,B3 79,B4 90,B5 95 /;

parameter duration(CONTRACTPOOLS) / pl1 5,pl2 8,pl3 5,pl4 5,pl5 5,pl6 2 /;

parameter fixcost(POOLS) / pl1 144,pl2 144,pl3 125,pl4 120,pl5 125,pl6 120,pl7 131,pl8 130,pl9 135,pl10 112 /;

parameter revenue(BLENDS) / 
B1 47,B2 47,B3 44,B4 36,B5 39 /;

parameter initialinv(NODES) / B1 23 ,B2 28 ,B3 21 ,B4 25 ,B5 28  /;

table flowlbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 	 5	 7	 5	 	 	 	 	 	 	 	 	 	 	 
f2	 8	 8	 	 5	 6	 8	 	 	 	 	 	 	 	 	 
f3	 8	 8	 	 9	 7	 5	 	 	 	 	 	 	 	 	 
f4	 	 5	 8	 9	 5	 9	 	 	 	 	 	 	 	 	 
f5	 	 9	 6	 6	 	 	 	 	 	 	 	 	 	 	 
f6	 	 5	 6	 5	 5	 	 	 	 	 	 	 	 	 	 
f7	 	 6	 5	 6	 	 5	 	 	 	 	 	 	 	 	 
f8	 6	 6	 6	 	 9	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 	 5	 	 	 	 	 	 	 
pl2	 	 	 	 	 	 	 	 	 	 3	 	 	 	 	 
pl3	 	 	 	 	 	 	 	 2	 	 3	 7	 	 	 	 5
pl4	 	 	 	 	 	 	 2	 4	 3	 3	 	 	 9	 	 
pl5	 	 	 	 	 	 	 3	 3	 3	 	 	 	 	 8	 
pl6	 	 	 	 	 	 	 5	 5	 	 	 	 	 9	 	 
pl7	 	 	 	 	 	 	 	 	 	 	 7	 6	 	 9	 5
pl8	 	 	 	 	 	 	 	 	 	 	 8	 7	 	 	 5
pl9	 	 	 	 	 	 	 	 	 	 	 9	 	 	 	 6
pl10	 	 	 	 	 	 	 	 	 	 	 	 	 9	 8	 ;

table flowupbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 	 70	 92	 92	 	 	 	 	 	 	 	 	 	 	 
f2	 85	 70	 	 92	 92	 105	 	 	 	 	 	 	 	 	 
f3	 85	 70	 	 92	 92	 105	 	 	 	 	 	 	 	 	 
f4	 	 70	 92	 92	 92	 105	 	 	 	 	 	 	 	 	 
f5	 	 70	 92	 92	 	 	 	 	 	 	 	 	 	 	 
f6	 	 70	 92	 92	 92	 	 	 	 	 	 	 	 	 	 
f7	 	 70	 92	 92	 	 105	 	 	 	 	 	 	 	 	 
f8	 85	 70	 92	 	 92	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 	 85	 	 	 	 	 	 	 
pl2	 	 	 	 	 	 	 	 	 	 70	 	 	 	 	 
pl3	 	 	 	 	 	 	 	 92	 	 92	 70	 	 	 	 92
pl4	 	 	 	 	 	 	 92	 92	 92	 92	 	 	 79	 	 
pl5	 	 	 	 	 	 	 92	 92	 92	 	 	 	 	 90	 
pl6	 	 	 	 	 	 	 105	 105	 	 	 	 	 79	 	 
pl7	 	 	 	 	 	 	 	 	 	 	 70	 70	 	 90	 95
pl8	 	 	 	 	 	 	 	 	 	 	 70	 70	 	 	 95
pl9	 	 	 	 	 	 	 	 	 	 	 70	 	 	 	 95
pl10	 	 	 	 	 	 	 	 	 	 	 	 	 79	 90	   ;

table prodrate(INPUTS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10	 11	 12	 13	 14	 15
f1	 39	 44	 26	 29	 32	 40	 16	 15	 15	 14	 21	 29	 14	 11	 27
f2	 45	 28	 47	 25	 37	 34	 19	 28	 21	 24	 21	 18	 27	 26	 25
f3	 28	 39	 27	 30	 43	 32	 11	 28	 23	 22	 28	 22	 19	 23	 23
f4	 31	 48	 26	 32	 41	 48	 15	 16	 26	 27	 28	 19	 29	 26	 28
f5	 27	 26	 48	 25	 25	 42	 13	 26	 22	 24	 16	 19	 27	 23	 27
f6	 35	 36	 30	 30	 39	 42	 16	 20	 24	 27	 28	 16	 10	 16	 18
f7	 36	 46	 47	 35	 49	 35	 10	 23	 19	 21	 11	 24	 23	 20	 23
f8	 39	 41	 37	 40	 46	 42	 27	 21	 23	 19	 26	 28	 21	 26	 26  ;

table demand(BLENDS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10	 11	 12	 13	 14	 15
B1	 13	 10	 21	 13	 19	 17	 23	 25	 29	 28	 23	 23	 26	 19	 18
B2	 15	 13	 20	 10	 8	 8	 25	 24	 24	 25	 23	 20	 19	 18	 27
B3	 11	 10	 19	 11	 11	 9	 28	 22	 28	 26	 19	 20	 23	 19	 26
B4	 17	 8	 17	 13	 21	 10	 25	 26	 18	 25	 27	 19	 26	 22	 19
B5	 15	 13	 15	 12	 9	 21	 29	 18	 29	 20	 28	 27	 21	 18	 21  ;

table speclevel(INPUTS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
f1		 0.42	 0.57	 0.71	 0.4
f2		 0.74	 0.49	 0.57	 0.2
f3		 0.38	 0.71	 0.63	 0.29
f4		 0.27	 0.64	 0.62	 0.36
f5		 0.33	 0.26	 0.32	 0.57
f6		 0.27	 0.71	 0.28	 0.66
f7		 0.25	 0.34	 0.45	 0.49
f8		 0.64	 0.54	 0.59	 0.31  ;

table minspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.28	 0.31	 0.35	 0.26
B2		 0.29	 0.36	 0.35	 0.24
B3		 0.29	 0.41	 0.42	 0.41
B4		 0.4	 0.46	 0.45	 0.28
B5		 0.32	 0.35	 0.42	 0.26  ;

table maxspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.69	 0.67	 0.7	 0.65
B2		 0.64	 0.69	 0.68	 0.61
B3		 0.45	 0.57	 0.58	 0.55
B4		 0.59	 0.62	 0.59	 0.45
B5		 0.67	 0.59	 0.63	 0.52  ;

$include xmodel.gms