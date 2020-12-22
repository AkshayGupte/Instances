$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3/;
set ARCS(NODES,NODES) / f1.(pl2,pl3),
		f2.(pl1,pl2,pl3),
		f3.(pl1,pl2,pl3),
		f4.(pl1,pl2,pl3),
		f5.(pl1,pl2),
		f6.(pl2,pl3),
		f7.(pl1,pl2),
		f8.(pl1,pl3),
		pl1.(pl4,pl5,pl6,pl7,pl9,pl10),
		pl2.(pl7),
		pl3.(pl4,pl5,pl6,pl8,pl9,pl10),
		pl4.(B1,B4),
		pl5.(B2,B3,B4),
		pl6.(B2,B3,B4,B5),
		pl7.(B1,B3,B5),
		pl8.(B2,B5),
		pl9.(B1,B3,B5),
		pl10.(B2) /;

alias(NODES,NODES2);

set FullHorizon /0 * 15/;
set ZeroSolveHorizon(FullHorizon) /0 * 10/;
set SolveHorizon(ZeroSolveHorizon) /1 * 10/;
set SolveTime(ZeroSolveHorizon) /1 * 10/;

scalar Warmup /2/;
table varcost(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 	 13	 11	 	 	 	 	 	 	 	 	 	 	 	 
f2	 9	 15	 17	 	 	 	 	 	 	 	 	 	 	 	 
f3	 13	 9	 9	 	 	 	 	 	 	 	 	 	 	 	 
f4	 14	 12	 17	 	 	 	 	 	 	 	 	 	 	 	 
f5	 13	 17	 	 	 	 	 	 	 	 	 	 	 	 	 
f6	 	 13	 17	 	 	 	 	 	 	 	 	 	 	 	 
f7	 13	 12	 	 	 	 	 	 	 	 	 	 	 	 	 
f8	 9	 	 13	 	 	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 5	 5	 9	 5	 	 11	 11	 	 	 	 	 
pl2	 	 	 	 	 	 	 10	 	 	 	 	 	 	 	 
pl3	 	 	 	 5	 9	 8	 	 7	 9	 7	 	 	 	 	 
pl4	 	 	 	 	 	 	 	 	 	 	 13	 	 	 17	 
pl5	 	 	 	 	 	 	 	 	 	 	 	 15	 15	 10	 
pl6	 	 	 	 	 	 	 	 	 	 	 	 9	 15	 17	 12
pl7	 	 	 	 	 	 	 	 	 	 	 9	 	 11	 	 17
pl8	 	 	 	 	 	 	 	 	 	 	 	 13	 	 	 11
pl9	 	 	 	 	 	 	 	 	 	 	 14	 	 9	 	 9
pl10	 	 	 	 	 	 	 	 	 	 	 	 10	 	 	 ;

parameter capacity(NODES) / f1 153,f2 234,f3 300,f4 96,f5 120,f6 120,f7 147,f8 147,pl1 92,pl2 92,pl3 85,pl4 200,pl5 182,pl6 160,pl7 187,pl8 125,pl9 182,pl10 170,B1 95,B2 64,B3 64,B4 95,B5 64 /;

parameter duration(CONTRACTPOOLS) / pl1 2,pl2 2,pl3 2 /;

parameter fixcost(POOLS) / pl1 139,pl2 137,pl3 137,pl4 113,pl5 119,pl6 113,pl7 120,pl8 115,pl9 133,pl10 115 /;

parameter revenue(BLENDS) / 
B1 41,B2 46,B3 49,B4 40,B5 41 /;

parameter initialinv(NODES) / B1 28 ,B2 24 ,B3 30 ,B4 21 ,B5 36  /;

table flowlbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 	 7	 7	 	 	 	 	 	 	 	 	 	 	 	 
f2	 5	 9	 9	 	 	 	 	 	 	 	 	 	 	 	 
f3	 9	 5	 7	 	 	 	 	 	 	 	 	 	 	 	 
f4	 6	 6	 9	 	 	 	 	 	 	 	 	 	 	 	 
f5	 9	 6	 	 	 	 	 	 	 	 	 	 	 	 	 
f6	 	 9	 7	 	 	 	 	 	 	 	 	 	 	 	 
f7	 8	 9	 	 	 	 	 	 	 	 	 	 	 	 	 
f8	 8	 	 8	 	 	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 3	 2	 3	 5	 	 5	 2	 	 	 	 	 
pl2	 	 	 	 	 	 	 4	 	 	 	 	 	 	 	 
pl3	 	 	 	 3	 4	 5	 	 5	 4	 5	 	 	 	 	 
pl4	 	 	 	 	 	 	 	 	 	 	 3	 	 	 6	 
pl5	 	 	 	 	 	 	 	 	 	 	 	 7	 5	 8	 
pl6	 	 	 	 	 	 	 	 	 	 	 	 8	 8	 9	 7
pl7	 	 	 	 	 	 	 	 	 	 	 6	 	 7	 	 8
pl8	 	 	 	 	 	 	 	 	 	 	 	 5	 	 	 5
pl9	 	 	 	 	 	 	 	 	 	 	 7	 	 9	 	 9
pl10	 	 	 	 	 	 	 	 	 	 	 	 7	 	 	 ;

table flowupbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 	 92	 85	 	 	 	 	 	 	 	 	 	 	 	 
f2	 92	 92	 85	 	 	 	 	 	 	 	 	 	 	 	 
f3	 92	 92	 85	 	 	 	 	 	 	 	 	 	 	 	 
f4	 92	 92	 85	 	 	 	 	 	 	 	 	 	 	 	 
f5	 92	 92	 	 	 	 	 	 	 	 	 	 	 	 	 
f6	 	 92	 85	 	 	 	 	 	 	 	 	 	 	 	 
f7	 92	 92	 	 	 	 	 	 	 	 	 	 	 	 	 
f8	 92	 	 85	 	 	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 92	 92	 92	 92	 	 92	 92	 	 	 	 	 
pl2	 	 	 	 	 	 	 92	 	 	 	 	 	 	 	 
pl3	 	 	 	 85	 85	 85	 	 85	 85	 85	 	 	 	 	 
pl4	 	 	 	 	 	 	 	 	 	 	 95	 	 	 95	 
pl5	 	 	 	 	 	 	 	 	 	 	 	 64	 64	 95	 
pl6	 	 	 	 	 	 	 	 	 	 	 	 64	 64	 95	 64
pl7	 	 	 	 	 	 	 	 	 	 	 95	 	 64	 	 64
pl8	 	 	 	 	 	 	 	 	 	 	 	 64	 	 	 64
pl9	 	 	 	 	 	 	 	 	 	 	 95	 	 64	 	 64
pl10	 	 	 	 	 	 	 	 	 	 	 	 64	 	 	   ;

table prodrate(INPUTS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10	 11	 12	 13	 14	 15
f1	 36	 33	 39	 39	 17	 24	 11	 29	 25	 24	 23	 11	 18	 26	 14
f2	 32	 29	 32	 44	 11	 27	 11	 17	 29	 26	 10	 22	 28	 20	 25
f3	 34	 42	 46	 47	 10	 27	 13	 29	 10	 27	 10	 21	 21	 25	 17
f4	 32	 41	 47	 33	 17	 28	 14	 13	 16	 13	 18	 10	 16	 20	 26
f5	 37	 46	 49	 44	 15	 23	 14	 12	 22	 16	 16	 17	 11	 11	 22
f6	 45	 33	 27	 39	 21	 10	 12	 17	 18	 20	 26	 12	 13	 14	 22
f7	 46	 45	 46	 45	 19	 28	 23	 23	 25	 23	 11	 23	 20	 29	 18
f8	 29	 28	 47	 37	 27	 27	 25	 24	 11	 14	 19	 24	 29	 12	 13  ;

table demand(BLENDS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10	 11	 12	 13	 14	 15
B1	 19	 9	 13	 13	 25	 23	 21	 20	 26	 25	 26	 26	 25	 22	 26
B2	 11	 13	 13	 21	 25	 21	 27	 18	 22	 21	 25	 21	 26	 20	 18
B3	 21	 9	 18	 15	 29	 18	 18	 23	 25	 25	 25	 19	 23	 27	 28
B4	 9	 12	 20	 13	 20	 25	 24	 19	 28	 27	 19	 19	 18	 24	 24
B5	 18	 18	 9	 9	 18	 20	 23	 25	 29	 28	 21	 27	 29	 28	 25  ;

table speclevel(INPUTS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
f1		 0.36	 0.58	 0.7	 0.58
f2		 0.68	 0.29	 0.64	 0.24
f3		 0.72	 0.39	 0.43	 0.7
f4		 0.49	 0.69	 0.53	 0.63
f5		 0.7	 0.44	 0.66	 0.26
f6		 0.43	 0.24	 0.35	 0.31
f7		 0.73	 0.4	 0.27	 0.45
f8		 0.25	 0.46	 0.37	 0.5  ;

table minspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.32	 0.3	 0.3	 0.29
B2		 0.28	 0.24	 0.28	 0.25
B3		 0.43	 0.36	 0.33	 0.38
B4		 0.38	 0.34	 0.29	 0.3
B5		 0.33	 0.24	 0.32	 0.28  ;

table maxspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.71	 0.65	 0.69	 0.69
B2		 0.69	 0.68	 0.7	 0.67
B3		 0.64	 0.58	 0.6	 0.55
B4		 0.63	 0.56	 0.6	 0.59
B5		 0.64	 0.57	 0.66	 0.59  ;

$include xmodel.gms
