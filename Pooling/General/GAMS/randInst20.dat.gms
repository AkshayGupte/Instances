$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3,pl4,pl5/;
set ARCS(NODES,NODES) / f1.(pl1,pl3,pl5),
		f2.(pl1,pl4,pl5),
		f3.(pl1,pl3,pl4,pl5),
		f4.(pl1,pl2,pl3,pl4,pl5),
		f5.(pl2,pl4,pl5),
		f6.(pl2,pl3,pl4),
		f7.(pl1,pl4),
		f8.(pl3,pl4,pl5),
		pl1.(pl6,pl7,pl8),
		pl2.(pl6,pl7,pl8,pl9),
		pl3.(pl7,pl9,pl10),
		pl4.(pl6,pl7,B2),
		pl5.(pl6,pl7,pl8,pl9,pl10),
		pl6.(B1,B2,B3,B4,B5),
		pl7.(B1,B2,B3,B4,B5),
		pl8.(B1,B2,B3,B4,B5),
		pl9.(B1,B2,B4,B5),
		pl10.(B1,B2,B3,B4,B5) /;

alias(NODES,NODES2);

set FullHorizon /0 * 15/;
set ZeroSolveHorizon(FullHorizon) /0 * 10/;
set SolveHorizon(ZeroSolveHorizon) /1 * 10/;
set SolveTime(ZeroSolveHorizon) /1 * 10/;

scalar Warmup /2/;
table varcost(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 14	 	 14	 	 11	 	 	 	 	 	 	 	 	 	 
f2	 10	 	 	 9	 16	 	 	 	 	 	 	 	 	 	 
f3	 10	 	 12	 14	 17	 	 	 	 	 	 	 	 	 	 
f4	 13	 17	 17	 10	 15	 	 	 	 	 	 	 	 	 	 
f5	 	 13	 	 15	 16	 	 	 	 	 	 	 	 	 	 
f6	 	 9	 9	 10	 	 	 	 	 	 	 	 	 	 	 
f7	 11	 	 	 11	 	 	 	 	 	 	 	 	 	 	 
f8	 	 	 9	 9	 12	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 9	 9	 11	 	 	 	 	 	 	 
pl2	 	 	 	 	 	 5	 10	 11	 6	 	 	 	 	 	 
pl3	 	 	 	 	 	 	 6	 	 6	 10	 	 	 	 	 
pl4	 	 	 	 	 	 5	 11	 	 	 	 	 10	 	 	 
pl5	 	 	 	 	 	 8	 9	 9	 8	 10	 	 	 	 	 
pl6	 	 	 	 	 	 	 	 	 	 	 14	 11	 13	 13	 13
pl7	 	 	 	 	 	 	 	 	 	 	 13	 14	 16	 11	 11
pl8	 	 	 	 	 	 	 	 	 	 	 10	 15	 10	 9	 11
pl9	 	 	 	 	 	 	 	 	 	 	 11	 10	 	 11	 15
pl10	 	 	 	 	 	 	 	 	 	 	 11	 14	 11	 10	 9;

parameter capacity(NODES) / f1 96,f2 147,f3 153,f4 147,f5 234,f6 300,f7 300,f8 168,pl1 70,pl2 105,pl3 105,pl4 105,pl5 85,pl6 212,pl7 137,pl8 150,pl9 182,pl10 182,B1 64,B2 73,B3 64,B4 70,B5 90 /;

parameter duration(CONTRACTPOOLS) / pl1 2,pl2 5,pl3 5,pl4 2,pl5 5 /;

parameter fixcost(POOLS) / pl1 146,pl2 126,pl3 139,pl4 138,pl5 130,pl6 149,pl7 125,pl8 114,pl9 145,pl10 120 /;

parameter revenue(BLENDS) / 
B1 45,B2 49,B3 41,B4 42,B5 41 /;

parameter initialinv(NODES) / B1 44 ,B2 37 ,B3 41 ,B4 38 ,B5 42  /;

table flowlbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 7	 	 9	 	 8	 	 	 	 	 	 	 	 	 	 
f2	 8	 	 	 8	 8	 	 	 	 	 	 	 	 	 	 
f3	 9	 	 9	 6	 9	 	 	 	 	 	 	 	 	 	 
f4	 7	 5	 6	 9	 6	 	 	 	 	 	 	 	 	 	 
f5	 	 8	 	 7	 8	 	 	 	 	 	 	 	 	 	 
f6	 	 6	 8	 5	 	 	 	 	 	 	 	 	 	 	 
f7	 5	 	 	 6	 	 	 	 	 	 	 	 	 	 	 
f8	 	 	 7	 5	 5	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 3	 5	 4	 	 	 	 	 	 	 
pl2	 	 	 	 	 	 4	 3	 3	 2	 	 	 	 	 	 
pl3	 	 	 	 	 	 	 4	 	 4	 5	 	 	 	 	 
pl4	 	 	 	 	 	 5	 4	 	 	 	 	 5	 	 	 
pl5	 	 	 	 	 	 3	 2	 2	 2	 5	 	 	 	 	 
pl6	 	 	 	 	 	 	 	 	 	 	 9	 7	 5	 6	 7
pl7	 	 	 	 	 	 	 	 	 	 	 8	 6	 9	 5	 6
pl8	 	 	 	 	 	 	 	 	 	 	 6	 8	 5	 6	 9
pl9	 	 	 	 	 	 	 	 	 	 	 6	 9	 	 9	 5
pl10	 	 	 	 	 	 	 	 	 	 	 8	 8	 6	 6	 6;

table flowupbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 70	 	 96	 	 85	 	 	 	 	 	 	 	 	 	 
f2	 70	 	 	 105	 85	 	 	 	 	 	 	 	 	 	 
f3	 70	 	 105	 105	 85	 	 	 	 	 	 	 	 	 	 
f4	 70	 105	 105	 105	 85	 	 	 	 	 	 	 	 	 	 
f5	 	 105	 	 105	 85	 	 	 	 	 	 	 	 	 	 
f6	 	 105	 105	 105	 	 	 	 	 	 	 	 	 	 	 
f7	 70	 	 	 105	 	 	 	 	 	 	 	 	 	 	 
f8	 	 	 105	 105	 85	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 70	 70	 70	 	 	 	 	 	 	 
pl2	 	 	 	 	 	 105	 105	 105	 105	 	 	 	 	 	 
pl3	 	 	 	 	 	 	 105	 	 105	 105	 	 	 	 	 
pl4	 	 	 	 	 	 105	 105	 	 	 	 	 73	 	 	 
pl5	 	 	 	 	 	 85	 85	 85	 85	 85	 	 	 	 	 
pl6	 	 	 	 	 	 	 	 	 	 	 64	 73	 64	 70	 90
pl7	 	 	 	 	 	 	 	 	 	 	 64	 73	 64	 70	 90
pl8	 	 	 	 	 	 	 	 	 	 	 64	 73	 64	 70	 90
pl9	 	 	 	 	 	 	 	 	 	 	 64	 73	 	 70	 90
pl10	 	 	 	 	 	 	 	 	 	 	 64	 73	 64	 70	 90  ;

table prodrate(INPUTS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10	 11	 12	 13	 14	 15
f1	 56	 35	 59	 43	 35	 34	 28	 38	 36	 32	 33	 36	 40	 32	 30
f2	 51	 53	 39	 55	 34	 39	 36	 28	 37	 28	 42	 44	 38	 29	 28
f3	 46	 59	 39	 40	 43	 44	 33	 30	 37	 37	 30	 29	 30	 38	 29
f4	 43	 40	 36	 41	 30	 43	 34	 28	 34	 32	 41	 39	 34	 31	 39
f5	 38	 56	 49	 55	 33	 32	 29	 43	 29	 34	 42	 43	 40	 42	 34
f6	 56	 53	 54	 44	 41	 37	 28	 30	 34	 41	 38	 28	 37	 32	 37
f7	 36	 40	 50	 51	 38	 36	 33	 39	 30	 40	 33	 31	 41	 32	 31
f8	 41	 46	 57	 50	 37	 39	 33	 28	 44	 33	 28	 36	 28	 35	 35  ;

table demand(BLENDS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10	 11	 12	 13	 14	 15
B1	 20	 24	 19	 21	 21	 21	 21	 16	 19	 17	 18	 17	 20	 15	 15
B2	 16	 21	 24	 17	 16	 16	 16	 16	 18	 18	 21	 20	 15	 20	 20
B3	 22	 19	 21	 17	 18	 17	 15	 15	 15	 21	 19	 20	 18	 20	 18
B4	 20	 18	 20	 19	 16	 17	 21	 19	 19	 17	 15	 20	 19	 19	 19
B5	 19	 23	 18	 23	 21	 21	 18	 17	 15	 18	 18	 16	 20	 21	 18  ;

table speclevel(INPUTS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
f1		 0.4	 0.47	 0.44	 0.71
f2		 0.22	 0.65	 0.63	 0.72
f3		 0.66	 0.34	 0.2	 0.61
f4		 0.52	 0.6	 0.23	 0.28
f5		 0.37	 0.62	 0.27	 0.3
f6		 0.47	 0.23	 0.66	 0.41
f7		 0.46	 0.69	 0.65	 0.48
f8		 0.32	 0.68	 0.73	 0.29  ;

table minspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.26	 0.29	 0.27	 0.31
B2		 0.25	 0.36	 0.25	 0.31
B3		 0.32	 0.37	 0.35	 0.43
B4		 0.32	 0.35	 0.29	 0.36
B5		 0.33	 0.33	 0.28	 0.4  ;

table maxspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.63	 0.65	 0.72	 0.72
B2		 0.6	 0.69	 0.7	 0.69
B3		 0.48	 0.61	 0.59	 0.71
B4		 0.61	 0.58	 0.57	 0.71
B5		 0.6	 0.61	 0.6	 0.6  ;

$include xmodel.gms