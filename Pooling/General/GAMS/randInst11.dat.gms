$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3,pl4,pl5/;
set ARCS(NODES,NODES) / f1.(pl1,pl2,pl5),
		f2.(pl1,pl2,pl3),
		f3.(pl1,pl2,pl4),
		f4.(pl1,pl2,pl3,pl4,pl5),
		f5.(pl1,pl2,pl5),
		f6.(pl1,pl5),
		f7.(pl1,pl5),
		f8.(pl2,pl4,pl5),
		pl1.(pl7,pl8,pl9,pl10),
		pl2.(pl6,pl7,pl10),
		pl3.(pl7,pl10,B4),
		pl4.(pl6,pl8,pl9,pl10),
		pl5.(pl7,pl8,pl10),
		pl6.(B4),
		pl7.(B2,B3,B5),
		pl8.(B1,B2,B3,B5),
		pl9.(B4,B5),
		pl10.(B1,B3,B5) /;

alias(NODES,NODES2);

set FullHorizon /0 * 15/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;
table varcost(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 15	 14	 	 	 9	 	 	 	 	 	 	 	 	 	 
f2	 10	 9	 16	 	 	 	 	 	 	 	 	 	 	 	 
f3	 16	 13	 	 16	 	 	 	 	 	 	 	 	 	 	 
f4	 10	 13	 13	 13	 12	 	 	 	 	 	 	 	 	 	 
f5	 10	 9	 	 	 13	 	 	 	 	 	 	 	 	 	 
f6	 11	 	 	 	 12	 	 	 	 	 	 	 	 	 	 
f7	 13	 	 	 	 16	 	 	 	 	 	 	 	 	 	 
f8	 	 9	 	 10	 13	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 9	 7	 11	 6	 	 	 	 	 
pl2	 	 	 	 	 	 11	 9	 	 	 5	 	 	 	 	 
pl3	 	 	 	 	 	 	 8	 	 	 11	 	 	 	 14	 
pl4	 	 	 	 	 	 7	 	 7	 10	 11	 	 	 	 	 
pl5	 	 	 	 	 	 	 11	 8	 	 8	 	 	 	 	 
pl6	 	 	 	 	 	 	 	 	 	 	 	 	 	 12	 
pl7	 	 	 	 	 	 	 	 	 	 	 	 12	 13	 	 11
pl8	 	 	 	 	 	 	 	 	 	 	 13	 17	 14	 	 15
pl9	 	 	 	 	 	 	 	 	 	 	 	 	 	 16	 14
pl10	 	 	 	 	 	 	 	 	 	 	 9	 	 12	 	 11;

parameter capacity(NODES) / f1 234,f2 196,f3 171,f4 273,f5 273,f6 178,f7 350,f8 140,pl1 85,pl2 92,pl3 70,pl4 85,pl5 92,pl6 137,pl7 150,pl8 125,pl9 200,pl10 150,B1 70,B2 82,B3 73,B4 64,B5 70 /;

parameter duration(CONTRACTPOOLS) / pl1 2,pl2 5,pl3 2,pl4 5,pl5 8 /;

parameter fixcost(POOLS) / pl1 137,pl2 115,pl3 145,pl4 140,pl5 126,pl6 128,pl7 129,pl8 124,pl9 121,pl10 122 /;

parameter revenue(BLENDS) / 
B1 41,B2 42,B3 48,B4 49,B5 40 /;

parameter initialinv(NODES) / B1 36 ,B2 33 ,B3 21 ,B4 17 ,B5 21  /;

table flowlbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 7	 8	 	 	 6	 	 	 	 	 	 	 	 	 	 
f2	 9	 5	 6	 	 	 	 	 	 	 	 	 	 	 	 
f3	 9	 7	 	 8	 	 	 	 	 	 	 	 	 	 	 
f4	 8	 8	 5	 8	 9	 	 	 	 	 	 	 	 	 	 
f5	 6	 7	 	 	 7	 	 	 	 	 	 	 	 	 	 
f6	 7	 	 	 	 7	 	 	 	 	 	 	 	 	 	 
f7	 9	 	 	 	 8	 	 	 	 	 	 	 	 	 	 
f8	 	 9	 	 5	 5	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 4	 3	 3	 2	 	 	 	 	 
pl2	 	 	 	 	 	 4	 3	 	 	 5	 	 	 	 	 
pl3	 	 	 	 	 	 	 4	 	 	 5	 	 	 	 8	 
pl4	 	 	 	 	 	 5	 	 2	 3	 5	 	 	 	 	 
pl5	 	 	 	 	 	 	 4	 2	 	 2	 	 	 	 	 
pl6	 	 	 	 	 	 	 	 	 	 	 	 	 	 7	 
pl7	 	 	 	 	 	 	 	 	 	 	 	 5	 7	 	 8
pl8	 	 	 	 	 	 	 	 	 	 	 6	 9	 9	 	 8
pl9	 	 	 	 	 	 	 	 	 	 	 	 	 	 6	 7
pl10	 	 	 	 	 	 	 	 	 	 	 7	 	 8	 	 9;

table flowupbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 85	 92	 	 	 92	 	 	 	 	 	 	 	 	 	 
f2	 85	 92	 70	 	 	 	 	 	 	 	 	 	 	 	 
f3	 85	 92	 	 85	 	 	 	 	 	 	 	 	 	 	 
f4	 85	 92	 70	 85	 92	 	 	 	 	 	 	 	 	 	 
f5	 85	 92	 	 	 92	 	 	 	 	 	 	 	 	 	 
f6	 85	 	 	 	 92	 	 	 	 	 	 	 	 	 	 
f7	 85	 	 	 	 92	 	 	 	 	 	 	 	 	 	 
f8	 	 92	 	 85	 92	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 85	 85	 85	 85	 	 	 	 	 
pl2	 	 	 	 	 	 92	 92	 	 	 92	 	 	 	 	 
pl3	 	 	 	 	 	 	 70	 	 	 70	 	 	 	 64	 
pl4	 	 	 	 	 	 85	 	 85	 85	 85	 	 	 	 	 
pl5	 	 	 	 	 	 	 92	 92	 	 92	 	 	 	 	 
pl6	 	 	 	 	 	 	 	 	 	 	 	 	 	 64	 
pl7	 	 	 	 	 	 	 	 	 	 	 	 82	 73	 	 70
pl8	 	 	 	 	 	 	 	 	 	 	 70	 82	 73	 	 70
pl9	 	 	 	 	 	 	 	 	 	 	 	 	 	 64	 70
pl10	 	 	 	 	 	 	 	 	 	 	 70	 	 73	 	 70  ;

table prodrate(INPUTS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10	 11	 12	 13	 14	 15
f1	 46	 48	 40	 49	 45	 36	 22	 21	 29	 27	 15	 22	 27	 20	 29
f2	 34	 42	 33	 42	 49	 42	 24	 26	 18	 28	 28	 28	 27	 27	 20
f3	 45	 49	 37	 41	 37	 45	 23	 14	 14	 10	 21	 20	 15	 15	 27
f4	 32	 42	 34	 43	 39	 43	 26	 18	 22	 28	 24	 26	 22	 26	 26
f5	 40	 41	 38	 35	 33	 44	 12	 27	 29	 11	 23	 25	 12	 29	 21
f6	 27	 44	 47	 46	 37	 35	 14	 18	 12	 20	 24	 28	 22	 25	 17
f7	 39	 26	 48	 25	 33	 36	 11	 11	 16	 16	 11	 20	 21	 14	 17
f8	 49	 32	 33	 46	 37	 34	 29	 15	 10	 19	 29	 21	 29	 25	 14  ;

table demand(BLENDS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10	 11	 12	 13	 14	 15
B1	 19	 17	 20	 21	 12	 12	 26	 21	 29	 20	 29	 22	 18	 29	 26
B2	 12	 21	 12	 14	 13	 17	 19	 26	 26	 26	 21	 23	 21	 20	 28
B3	 10	 11	 14	 9	 10	 16	 21	 27	 18	 20	 27	 29	 29	 29	 27
B4	 8	 9	 20	 14	 17	 18	 20	 25	 29	 23	 18	 23	 22	 18	 28
B5	 9	 12	 15	 19	 10	 19	 23	 23	 22	 25	 23	 21	 22	 28	 24  ;

table speclevel(INPUTS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
f1		 0.29	 0.21	 0.49	 0.62
f2		 0.64	 0.36	 0.62	 0.62
f3		 0.6	 0.27	 0.43	 0.61
f4		 0.27	 0.33	 0.28	 0.38
f5		 0.62	 0.31	 0.51	 0.65
f6		 0.53	 0.47	 0.28	 0.63
f7		 0.36	 0.33	 0.35	 0.71
f8		 0.43	 0.3	 0.6	 0.72  ;

table minspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.32	 0.23	 0.35	 0.45
B2		 0.33	 0.24	 0.32	 0.43
B3		 0.41	 0.25	 0.42	 0.57
B4		 0.38	 0.29	 0.38	 0.45
B5		 0.42	 0.25	 0.41	 0.54  ;

table maxspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.62	 0.43	 0.61	 0.72
B2		 0.61	 0.46	 0.6	 0.71
B3		 0.55	 0.35	 0.55	 0.68
B4		 0.53	 0.39	 0.49	 0.66
B5		 0.55	 0.35	 0.55	 0.69  ;

$include xmodel.gms
