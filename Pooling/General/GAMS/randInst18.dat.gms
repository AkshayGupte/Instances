$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3,pl4,pl5,pl6/;
set ARCS(NODES,NODES) / f1.(pl1,pl2,pl3,pl6),
		f2.(pl1,pl2,pl3,pl4,pl6),
		f3.(pl2,pl3,pl5,pl6),
		f4.(pl3,pl4,pl6),
		f5.(pl1,pl3,pl5),
		f6.(pl2,pl3,pl4,pl5),
		f7.(pl3,pl4,pl6),
		f8.(pl1,pl5,pl6),
		pl1.(pl8,pl9),
		pl2.(pl7,pl8,pl10,B3),
		pl3.(pl9,pl10,B4),
		pl4.(pl9,B5),
		pl5.(pl8,pl9,pl10,B2),
		pl6.(pl7,pl8,B5),
		pl7.(B3,B5),
		pl8.(B2,B3,B5),
		pl9.(B2,B5),
		pl10.(B1,B2) /;

alias(NODES,NODES2);

set FullHorizon /0 * 10/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;
table varcost(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 9	 10	 17	 	 	 13	 	 	 	 	 	 	 	 	 
f2	 13	 17	 14	 15	 	 11	 	 	 	 	 	 	 	 	 
f3	 	 16	 9	 	 13	 9	 	 	 	 	 	 	 	 	 
f4	 	 	 13	 16	 	 12	 	 	 	 	 	 	 	 	 
f5	 12	 	 11	 	 13	 	 	 	 	 	 	 	 	 	 
f6	 	 11	 16	 13	 16	 	 	 	 	 	 	 	 	 	 
f7	 	 	 9	 13	 	 11	 	 	 	 	 	 	 	 	 
f8	 10	 	 	 	 10	 16	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 	 11	 5	 	 	 	 	 	 
pl2	 	 	 	 	 	 	 5	 10	 	 9	 	 	 14	 	 
pl3	 	 	 	 	 	 	 	 	 9	 9	 	 	 	 15	 
pl4	 	 	 	 	 	 	 	 	 6	 	 	 	 	 	 10
pl5	 	 	 	 	 	 	 	 9	 5	 6	 	 10	 	 	 
pl6	 	 	 	 	 	 	 5	 6	 	 	 	 	 	 	 13
pl7	 	 	 	 	 	 	 	 	 	 	 	 	 10	 	 13
pl8	 	 	 	 	 	 	 	 	 	 	 	 16	 9	 	 10
pl9	 	 	 	 	 	 	 	 	 	 	 	 14	 	 	 13
pl10	 	 	 	 	 	 	 	 	 	 	 10	 10	 	 	 ;

parameter capacity(NODES) / f1 234,f2 96,f3 300,f4 120,f5 300,f6 201,f7 201,f8 201,pl1 51,pl2 63,pl3 42,pl4 63,pl5 51,pl6 42,pl7 109,pl8 75,pl9 112,pl10 127,B1 95,B2 95,B3 79,B4 90,B5 90 /;

parameter duration(CONTRACTPOOLS) / pl1 8,pl2 8,pl3 5,pl4 2,pl5 8,pl6 2 /;

parameter fixcost(POOLS) / pl1 149,pl2 149,pl3 118,pl4 117,pl5 137,pl6 115,pl7 148,pl8 131,pl9 128,pl10 118 /;

parameter revenue(BLENDS) / 
B1 36,B2 46,B3 36,B4 45,B5 37 /;

parameter initialinv(NODES) / B1 39 ,B2 29 ,B3 36 ,B4 29 ,B5 26  /;

table flowlbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 8	 6	 5	 	 	 7	 	 	 	 	 	 	 	 	 
f2	 9	 9	 8	 5	 	 9	 	 	 	 	 	 	 	 	 
f3	 	 9	 8	 	 9	 7	 	 	 	 	 	 	 	 	 
f4	 	 	 9	 6	 	 8	 	 	 	 	 	 	 	 	 
f5	 5	 	 7	 	 8	 	 	 	 	 	 	 	 	 	 
f6	 	 6	 9	 8	 9	 	 	 	 	 	 	 	 	 	 
f7	 	 	 7	 9	 	 9	 	 	 	 	 	 	 	 	 
f8	 9	 	 	 	 6	 5	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 	 2	 2	 	 	 	 	 	 
pl2	 	 	 	 	 	 	 4	 3	 	 3	 	 	 5	 	 
pl3	 	 	 	 	 	 	 	 	 2	 4	 	 	 	 9	 
pl4	 	 	 	 	 	 	 	 	 3	 	 	 	 	 	 5
pl5	 	 	 	 	 	 	 	 3	 3	 3	 	 9	 	 	 
pl6	 	 	 	 	 	 	 4	 5	 	 	 	 	 	 	 8
pl7	 	 	 	 	 	 	 	 	 	 	 	 	 9	 	 8
pl8	 	 	 	 	 	 	 	 	 	 	 	 6	 7	 	 7
pl9	 	 	 	 	 	 	 	 	 	 	 	 7	 	 	 8
pl10	 	 	 	 	 	 	 	 	 	 	 6	 9	 	 	 ;

table flowupbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 51	 63	 42	 	 	 42	 	 	 	 	 	 	 	 	 
f2	 51	 63	 42	 63	 	 42	 	 	 	 	 	 	 	 	 
f3	 	 63	 42	 	 51	 42	 	 	 	 	 	 	 	 	 
f4	 	 	 42	 63	 	 42	 	 	 	 	 	 	 	 	 
f5	 51	 	 42	 	 51	 	 	 	 	 	 	 	 	 	 
f6	 	 63	 42	 63	 51	 	 	 	 	 	 	 	 	 	 
f7	 	 	 42	 63	 	 42	 	 	 	 	 	 	 	 	 
f8	 51	 	 	 	 51	 42	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 	 51	 51	 	 	 	 	 	 
pl2	 	 	 	 	 	 	 63	 63	 	 63	 	 	 63	 	 
pl3	 	 	 	 	 	 	 	 	 42	 42	 	 	 	 42	 
pl4	 	 	 	 	 	 	 	 	 63	 	 	 	 	 	 63
pl5	 	 	 	 	 	 	 	 51	 51	 51	 	 51	 	 	 
pl6	 	 	 	 	 	 	 42	 42	 	 	 	 	 	 	 42
pl7	 	 	 	 	 	 	 	 	 	 	 	 	 79	 	 90
pl8	 	 	 	 	 	 	 	 	 	 	 	 75	 75	 	 75
pl9	 	 	 	 	 	 	 	 	 	 	 	 95	 	 	 90
pl10	 	 	 	 	 	 	 	 	 	 	 95	 95	 	 	   ;

table prodrate(INPUTS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10
f1	 25	 48	 24	 28	 18	 28	 23	 20	 22	 29
f2	 41	 36	 12	 29	 16	 13	 19	 16	 23	 22
f3	 34	 37	 19	 14	 10	 25	 27	 19	 16	 13
f4	 36	 31	 25	 12	 28	 16	 22	 28	 24	 16
f5	 44	 32	 24	 21	 26	 14	 29	 25	 23	 17
f6	 41	 46	 22	 28	 28	 26	 14	 26	 11	 22
f7	 41	 35	 10	 25	 29	 17	 14	 29	 16	 15
f8	 42	 27	 14	 23	 16	 25	 14	 14	 24	 23  ;

table demand(BLENDS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10
B1	 19	 20	 27	 28	 18	 26	 21	 26	 26	 22
B2	 17	 12	 29	 27	 25	 26	 29	 27	 19	 25
B3	 18	 18	 19	 24	 27	 24	 26	 23	 23	 22
B4	 16	 13	 23	 22	 27	 21	 22	 27	 26	 21
B5	 15	 11	 23	 21	 24	 26	 27	 20	 18	 20  ;

table speclevel(INPUTS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
f1		 0.67	 0.49	 0.33	 0.56
f2		 0.7	 0.7	 0.27	 0.53
f3		 0.35	 0.6	 0.22	 0.5
f4		 0.31	 0.33	 0.38	 0.58
f5		 0.24	 0.61	 0.36	 0.43
f6		 0.23	 0.63	 0.57	 0.7
f7		 0.5	 0.28	 0.53	 0.22
f8		 0.47	 0.41	 0.71	 0.31  ;

table minspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.28	 0.34	 0.25	 0.29
B2		 0.29	 0.32	 0.33	 0.24
B3		 0.35	 0.4	 0.25	 0.43
B4		 0.3	 0.28	 0.22	 0.22
B5		 0.28	 0.41	 0.25	 0.4  ;

table maxspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.7	 0.65	 0.69	 0.69
B2		 0.64	 0.67	 0.71	 0.62
B3		 0.68	 0.69	 0.55	 0.66
B4		 0.58	 0.63	 0.54	 0.57
B5		 0.52	 0.61	 0.56	 0.66  ;

$include xmodel.gms