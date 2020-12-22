$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3,pl4,pl5/;
set ARCS(NODES,NODES) / f1.(pl1,pl2,pl3,pl4),
		f2.(pl2),
		f3.(pl5),
		f4.(pl1,pl3,pl5),
		f5.(pl3,pl4,pl5),
		f6.(pl2,pl4,pl5),
		f7.(pl1,pl3,pl4,pl5),
		f8.(pl1,pl2,pl4),
		pl1.(pl7,pl8,pl9,pl10),
		pl2.(pl6,pl7,pl8,pl9,B3),
		pl3.(pl6,pl7,B3),
		pl4.(pl6,pl7,pl8,pl9,pl10),
		pl5.(pl7,pl8,pl9,pl10),
		pl6.(B2,B3,B5),
		pl7.(B1,B2),
		pl8.(B3),
		pl9.(B2,B5),
		pl10.(B2,B3,B4) /;

alias(NODES,NODES2);

set FullHorizon /0 * 15/;
set ZeroSolveHorizon(FullHorizon) /0 * 10/;
set SolveHorizon(ZeroSolveHorizon) /1 * 10/;
set SolveTime(ZeroSolveHorizon) /1 * 10/;

scalar Warmup /2/;
table varcost(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 13	 10	 9	 14	 	 	 	 	 	 	 	 	 	 	 
f2	 	 14	 	 	 	 	 	 	 	 	 	 	 	 	 
f3	 	 	 	 	 17	 	 	 	 	 	 	 	 	 	 
f4	 13	 	 15	 	 12	 	 	 	 	 	 	 	 	 	 
f5	 	 	 14	 14	 12	 	 	 	 	 	 	 	 	 	 
f6	 	 17	 	 13	 9	 	 	 	 	 	 	 	 	 	 
f7	 16	 	 10	 15	 11	 	 	 	 	 	 	 	 	 	 
f8	 14	 17	 	 10	 	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 9	 11	 8	 7	 	 	 	 	 
pl2	 	 	 	 	 	 9	 7	 9	 9	 	 	 	 17	 	 
pl3	 	 	 	 	 	 7	 5	 	 	 	 	 	 16	 	 
pl4	 	 	 	 	 	 6	 7	 8	 7	 9	 	 	 	 	 
pl5	 	 	 	 	 	 	 9	 10	 6	 5	 	 	 	 	 
pl6	 	 	 	 	 	 	 	 	 	 	 	 13	 10	 	 10
pl7	 	 	 	 	 	 	 	 	 	 	 17	 16	 	 	 
pl8	 	 	 	 	 	 	 	 	 	 	 	 	 13	 	 
pl9	 	 	 	 	 	 	 	 	 	 	 	 16	 	 	 10
pl10	 	 	 	 	 	 	 	 	 	 	 	 12	 12	 9	 ;

parameter capacity(NODES) / f1 201,f2 147,f3 168,f4 201,f5 201,f6 168,f7 300,f8 147,pl1 85,pl2 70,pl3 70,pl4 105,pl5 105,pl6 200,pl7 170,pl8 212,pl9 205,pl10 125,B1 90,B2 70,B3 79,B4 82,B5 64 /;

parameter duration(CONTRACTPOOLS) / pl1 2,pl2 8,pl3 2,pl4 5,pl5 8 /;

parameter fixcost(POOLS) / pl1 120,pl2 127,pl3 128,pl4 119,pl5 113,pl6 134,pl7 144,pl8 144,pl9 137,pl10 128 /;

parameter revenue(BLENDS) / 
B1 43,B2 42,B3 38,B4 41,B5 42 /;

parameter initialinv(NODES) / B1 43 ,B2 28 ,B3 31 ,B4 34 ,B5 43  /;

table flowlbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 9	 8	 6	 9	 	 	 	 	 	 	 	 	 	 	 
f2	 	 5	 	 	 	 	 	 	 	 	 	 	 	 	 
f3	 	 	 	 	 8	 	 	 	 	 	 	 	 	 	 
f4	 8	 	 7	 	 5	 	 	 	 	 	 	 	 	 	 
f5	 	 	 9	 6	 9	 	 	 	 	 	 	 	 	 	 
f6	 	 5	 	 5	 8	 	 	 	 	 	 	 	 	 	 
f7	 5	 	 8	 9	 5	 	 	 	 	 	 	 	 	 	 
f8	 6	 6	 	 7	 	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 2	 3	 2	 4	 	 	 	 	 
pl2	 	 	 	 	 	 3	 3	 2	 5	 	 	 	 7	 	 
pl3	 	 	 	 	 	 2	 3	 	 	 	 	 	 6	 	 
pl4	 	 	 	 	 	 5	 2	 3	 3	 4	 	 	 	 	 
pl5	 	 	 	 	 	 	 2	 3	 3	 2	 	 	 	 	 
pl6	 	 	 	 	 	 	 	 	 	 	 	 6	 8	 	 5
pl7	 	 	 	 	 	 	 	 	 	 	 6	 5	 	 	 
pl8	 	 	 	 	 	 	 	 	 	 	 	 	 6	 	 
pl9	 	 	 	 	 	 	 	 	 	 	 	 6	 	 	 6
pl10	 	 	 	 	 	 	 	 	 	 	 	 9	 8	 6	 ;

table flowupbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 85	 70	 70	 105	 	 	 	 	 	 	 	 	 	 	 
f2	 	 70	 	 	 	 	 	 	 	 	 	 	 	 	 
f3	 	 	 	 	 105	 	 	 	 	 	 	 	 	 	 
f4	 85	 	 70	 	 105	 	 	 	 	 	 	 	 	 	 
f5	 	 	 70	 105	 105	 	 	 	 	 	 	 	 	 	 
f6	 	 70	 	 105	 105	 	 	 	 	 	 	 	 	 	 
f7	 85	 	 70	 105	 105	 	 	 	 	 	 	 	 	 	 
f8	 85	 70	 	 105	 	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 85	 85	 85	 85	 	 	 	 	 
pl2	 	 	 	 	 	 70	 70	 70	 70	 	 	 	 70	 	 
pl3	 	 	 	 	 	 70	 70	 	 	 	 	 	 70	 	 
pl4	 	 	 	 	 	 105	 105	 105	 105	 105	 	 	 	 	 
pl5	 	 	 	 	 	 	 105	 105	 105	 105	 	 	 	 	 
pl6	 	 	 	 	 	 	 	 	 	 	 	 70	 79	 	 64
pl7	 	 	 	 	 	 	 	 	 	 	 90	 70	 	 	 
pl8	 	 	 	 	 	 	 	 	 	 	 	 	 79	 	 
pl9	 	 	 	 	 	 	 	 	 	 	 	 70	 	 	 64
pl10	 	 	 	 	 	 	 	 	 	 	 	 70	 79	 82	   ;

table prodrate(INPUTS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10	 11	 12	 13	 14	 15
f1	 37	 41	 59	 44	 35	 28	 31	 34	 33	 22	 24	 25	 28	 22	 30
f2	 37	 48	 50	 44	 39	 32	 35	 27	 23	 27	 34	 22	 30	 34	 35
f3	 39	 43	 53	 57	 34	 23	 29	 25	 22	 37	 20	 27	 28	 37	 30
f4	 49	 59	 41	 43	 36	 27	 34	 20	 24	 36	 32	 34	 35	 34	 20
f5	 47	 50	 48	 51	 29	 28	 38	 25	 35	 33	 22	 39	 37	 32	 26
f6	 50	 50	 58	 43	 30	 30	 26	 37	 26	 36	 38	 38	 25	 38	 22
f7	 53	 40	 41	 40	 31	 22	 34	 29	 27	 28	 33	 37	 23	 24	 25
f8	 43	 38	 59	 53	 36	 38	 37	 29	 38	 35	 21	 21	 33	 36	 36  ;

table demand(BLENDS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10	 11	 12	 13	 14	 15
B1	 14	 29	 11	 11	 29	 26	 28	 33	 37	 37	 28	 25	 30	 29	 37
B2	 8	 20	 25	 18	 34	 31	 31	 32	 25	 26	 37	 36	 27	 25	 30
B3	 8	 23	 10	 20	 30	 29	 25	 37	 26	 32	 29	 35	 35	 34	 38
B4	 24	 10	 22	 27	 39	 29	 36	 37	 39	 31	 37	 29	 29	 26	 26
B5	 19	 24	 12	 30	 27	 31	 31	 35	 32	 27	 32	 39	 25	 31	 37  ;

table speclevel(INPUTS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
f1		 0.2	 0.71	 0.35	 0.28
f2		 0.38	 0.65	 0.61	 0.56
f3		 0.23	 0.25	 0.45	 0.37
f4		 0.37	 0.71	 0.51	 0.44
f5		 0.4	 0.48	 0.45	 0.22
f6		 0.35	 0.51	 0.74	 0.56
f7		 0.71	 0.3	 0.22	 0.65
f8		 0.6	 0.5	 0.7	 0.66  ;

table minspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.22	 0.34	 0.29	 0.26
B2		 0.23	 0.28	 0.3	 0.26
B3		 0.3	 0.41	 0.29	 0.33
B4		 0.25	 0.3	 0.41	 0.33
B5		 0.25	 0.38	 0.37	 0.31  ;

table maxspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.67	 0.69	 0.73	 0.65
B2		 0.64	 0.7	 0.73	 0.64
B3		 0.55	 0.67	 0.69	 0.6
B4		 0.5	 0.67	 0.64	 0.54
B5		 0.61	 0.69	 0.72	 0.64  ;

$include xmodel.gms