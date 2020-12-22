$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3,pl4/;
set ARCS(NODES,NODES) / f1.(pl2,pl4),
		f2.(pl1,pl2,pl3),
		f3.(pl1,pl2,pl4),
		f4.(pl2),
		f5.(pl1,pl2,pl4),
		f6.(pl1,pl3),
		f7.(pl2,pl3,pl4),
		f8.(pl4),
		pl1.(pl5,pl6,pl7,pl9,pl10,B2),
		pl2.(pl5,pl7,pl8,pl9,B1,B5),
		pl3.(pl5,pl7,pl8,pl10),
		pl4.(pl5,pl6,pl9,B2,B4),
		pl5.(B2),
		pl6.(B1,B3,B4),
		pl7.(B3,B4),
		pl8.(B1,B4),
		pl9.(B2,B3,B4,B5),
		pl10.(B1,B2,B3,B4) /;

alias(NODES,NODES2);

set FullHorizon /0 * 15/;
set ZeroSolveHorizon(FullHorizon) /0 * 10/;
set SolveHorizon(ZeroSolveHorizon) /1 * 10/;
set SolveTime(ZeroSolveHorizon) /1 * 10/;

scalar Warmup /2/;
table varcost(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 	 12	 	 12	 	 	 	 	 	 	 	 	 	 	 
f2	 10	 12	 13	 	 	 	 	 	 	 	 	 	 	 	 
f3	 11	 13	 	 16	 	 	 	 	 	 	 	 	 	 	 
f4	 	 15	 	 	 	 	 	 	 	 	 	 	 	 	 
f5	 10	 10	 	 16	 	 	 	 	 	 	 	 	 	 	 
f6	 13	 	 9	 	 	 	 	 	 	 	 	 	 	 	 
f7	 	 16	 13	 10	 	 	 	 	 	 	 	 	 	 	 
f8	 	 	 	 16	 	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 8	 8	 8	 	 10	 9	 	 17	 	 	 
pl2	 	 	 	 	 5	 	 11	 6	 7	 	 13	 	 	 	 9
pl3	 	 	 	 	 7	 	 10	 9	 	 11	 	 	 	 	 
pl4	 	 	 	 	 9	 9	 	 	 11	 	 	 15	 	 16	 
pl5	 	 	 	 	 	 	 	 	 	 	 	 13	 	 	 
pl6	 	 	 	 	 	 	 	 	 	 	 14	 	 15	 14	 
pl7	 	 	 	 	 	 	 	 	 	 	 	 	 13	 10	 
pl8	 	 	 	 	 	 	 	 	 	 	 17	 	 	 13	 
pl9	 	 	 	 	 	 	 	 	 	 	 	 10	 16	 9	 15
pl10	 	 	 	 	 	 	 	 	 	 	 16	 12	 16	 15	 ;

parameter capacity(NODES) / f1 234,f2 300,f3 153,f4 147,f5 201,f6 201,f7 234,f8 120,pl1 70,pl2 92,pl3 105,pl4 85,pl5 182,pl6 137,pl7 187,pl8 150,pl9 187,pl10 137,B1 90,B2 82,B3 70,B4 95,B5 82 /;

parameter duration(CONTRACTPOOLS) / pl1 8,pl2 2,pl3 8,pl4 5 /;

parameter fixcost(POOLS) / pl1 146,pl2 111,pl3 134,pl4 133,pl5 114,pl6 117,pl7 133,pl8 122,pl9 118,pl10 146 /;

parameter revenue(BLENDS) / 
B1 37,B2 43,B3 38,B4 39,B5 39 /;

parameter initialinv(NODES) / B1 30 ,B2 35 ,B3 34 ,B4 33 ,B5 36  /;

table flowlbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 	 6	 	 8	 	 	 	 	 	 	 	 	 	 	 
f2	 9	 6	 8	 	 	 	 	 	 	 	 	 	 	 	 
f3	 8	 6	 	 6	 	 	 	 	 	 	 	 	 	 	 
f4	 	 9	 	 	 	 	 	 	 	 	 	 	 	 	 
f5	 9	 5	 	 5	 	 	 	 	 	 	 	 	 	 	 
f6	 7	 	 6	 	 	 	 	 	 	 	 	 	 	 	 
f7	 	 8	 6	 6	 	 	 	 	 	 	 	 	 	 	 
f8	 	 	 	 9	 	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 2	 5	 4	 	 2	 2	 	 7	 	 	 
pl2	 	 	 	 	 4	 	 2	 5	 4	 	 8	 	 	 	 7
pl3	 	 	 	 	 5	 	 4	 4	 	 3	 	 	 	 	 
pl4	 	 	 	 	 4	 3	 	 	 3	 	 	 5	 	 5	 
pl5	 	 	 	 	 	 	 	 	 	 	 	 5	 	 	 
pl6	 	 	 	 	 	 	 	 	 	 	 5	 	 6	 9	 
pl7	 	 	 	 	 	 	 	 	 	 	 	 	 6	 7	 
pl8	 	 	 	 	 	 	 	 	 	 	 5	 	 	 5	 
pl9	 	 	 	 	 	 	 	 	 	 	 	 8	 6	 7	 5
pl10	 	 	 	 	 	 	 	 	 	 	 7	 6	 5	 8	 ;

table flowupbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 	 92	 	 85	 	 	 	 	 	 	 	 	 	 	 
f2	 70	 92	 105	 	 	 	 	 	 	 	 	 	 	 	 
f3	 70	 92	 	 85	 	 	 	 	 	 	 	 	 	 	 
f4	 	 92	 	 	 	 	 	 	 	 	 	 	 	 	 
f5	 70	 92	 	 85	 	 	 	 	 	 	 	 	 	 	 
f6	 70	 	 105	 	 	 	 	 	 	 	 	 	 	 	 
f7	 	 92	 105	 85	 	 	 	 	 	 	 	 	 	 	 
f8	 	 	 	 85	 	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 70	 70	 70	 	 70	 70	 	 70	 	 	 
pl2	 	 	 	 	 92	 	 92	 92	 92	 	 90	 	 	 	 82
pl3	 	 	 	 	 105	 	 105	 105	 	 105	 	 	 	 	 
pl4	 	 	 	 	 85	 85	 	 	 85	 	 	 82	 	 85	 
pl5	 	 	 	 	 	 	 	 	 	 	 	 82	 	 	 
pl6	 	 	 	 	 	 	 	 	 	 	 90	 	 70	 95	 
pl7	 	 	 	 	 	 	 	 	 	 	 	 	 70	 95	 
pl8	 	 	 	 	 	 	 	 	 	 	 90	 	 	 95	 
pl9	 	 	 	 	 	 	 	 	 	 	 	 82	 70	 95	 82
pl10	 	 	 	 	 	 	 	 	 	 	 90	 82	 70	 95	   ;

table prodrate(INPUTS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10	 11	 12	 13	 14	 15
f1	 37	 33	 38	 32	 26	 22	 22	 20	 31	 26	 31	 24	 24	 25	 23
f2	 36	 37	 34	 35	 25	 26	 24	 24	 23	 29	 21	 34	 30	 34	 31
f3	 36	 30	 36	 27	 31	 34	 28	 30	 32	 31	 21	 30	 22	 25	 27
f4	 35	 36	 31	 30	 23	 31	 34	 32	 22	 28	 22	 28	 24	 22	 28
f5	 27	 29	 36	 29	 23	 23	 32	 34	 20	 23	 20	 22	 26	 24	 27
f6	 26	 30	 29	 35	 20	 25	 23	 25	 20	 21	 26	 27	 29	 32	 31
f7	 29	 38	 27	 39	 25	 27	 28	 30	 27	 20	 29	 21	 32	 33	 20
f8	 39	 26	 26	 38	 30	 32	 23	 21	 23	 25	 24	 20	 32	 34	 28  ;

table demand(BLENDS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10	 11	 12	 13	 14	 15
B1	 18	 12	 18	 15	 17	 17	 20	 16	 22	 20	 21	 18	 22	 22	 17
B2	 21	 14	 19	 14	 21	 23	 29	 26	 26	 19	 15	 18	 22	 26	 15
B3	 18	 16	 13	 16	 16	 28	 28	 28	 18	 21	 16	 24	 20	 15	 26
B4	 13	 20	 21	 17	 15	 20	 18	 20	 15	 15	 25	 21	 25	 21	 26
B5	 15	 21	 17	 21	 17	 16	 18	 29	 28	 27	 22	 19	 21	 17	 22  ;

table speclevel(INPUTS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
f1		 0.69	 0.43	 0.61	 0.21
f2		 0.27	 0.6	 0.57	 0.55
f3		 0.32	 0.7	 0.41	 0.71
f4		 0.55	 0.27	 0.71	 0.28
f5		 0.43	 0.66	 0.34	 0.67
f6		 0.41	 0.3	 0.59	 0.51
f7		 0.66	 0.4	 0.74	 0.64
f8		 0.62	 0.43	 0.65	 0.39  ;

table minspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.31	 0.27	 0.35	 0.23
B2		 0.29	 0.32	 0.36	 0.22
B3		 0.29	 0.42	 0.4	 0.5
B4		 0.48	 0.36	 0.53	 0.25
B5		 0.38	 0.27	 0.37	 0.25  ;

table maxspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.67	 0.68	 0.74	 0.7
B2		 0.68	 0.7	 0.73	 0.71
B3		 0.46	 0.69	 0.58	 0.69
B4		 0.67	 0.51	 0.71	 0.6
B5		 0.62	 0.64	 0.72	 0.66  ;

$include xmodel.gms