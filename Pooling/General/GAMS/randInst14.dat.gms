$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3,pl4,pl5,pl6,pl7/;
set ARCS(NODES,NODES) / f1.(pl1,pl2,pl4,pl5,pl6),
		f2.(pl1,pl4,pl5,pl6),
		f3.(pl2,pl5,pl6),
		f4.(pl2,pl4,pl6,pl7),
		f5.(pl1,pl2,pl5,pl7),
		f6.(pl3,pl4,pl6,pl7),
		f7.(pl3,pl5,pl6,pl7),
		f8.(pl1,pl3,pl4,pl5,pl6),
		pl1.(pl9),
		pl2.(pl8,pl9,pl10),
		pl3.(pl8,pl9,pl10),
		pl4.(pl8,pl9,B5),
		pl5.(pl8),
		pl6.(pl9,pl10),
		pl7.(pl9,pl10),
		pl8.(B1,B2,B3,B4,B5),
		pl9.(B1,B5),
		pl10.(B1,B2,B4,B5) /;

alias(NODES,NODES2);

set FullHorizon /0 * 10/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;
table varcost(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 12	 11	 	 17	 16	 9	 	 	 	 	 	 	 	 	 
f2	 13	 	 	 9	 13	 9	 	 	 	 	 	 	 	 	 
f3	 	 9	 	 	 12	 13	 	 	 	 	 	 	 	 	 
f4	 	 15	 	 16	 	 13	 15	 	 	 	 	 	 	 	 
f5	 16	 11	 	 	 14	 	 10	 	 	 	 	 	 	 	 
f6	 	 	 15	 17	 	 9	 14	 	 	 	 	 	 	 	 
f7	 	 	 10	 	 17	 12	 13	 	 	 	 	 	 	 	 
f8	 13	 	 11	 10	 11	 10	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 	 	 10	 	 	 	 	 	 
pl2	 	 	 	 	 	 	 	 9	 10	 10	 	 	 	 	 
pl3	 	 	 	 	 	 	 	 6	 5	 6	 	 	 	 	 
pl4	 	 	 	 	 	 	 	 8	 9	 	 	 	 	 	 9
pl5	 	 	 	 	 	 	 	 8	 	 	 	 	 	 	 
pl6	 	 	 	 	 	 	 	 	 11	 7	 	 	 	 	 
pl7	 	 	 	 	 	 	 	 	 8	 6	 	 	 	 	 
pl8	 	 	 	 	 	 	 	 	 	 	 14	 10	 17	 9	 16
pl9	 	 	 	 	 	 	 	 	 	 	 14	 	 	 	 15
pl10	 	 	 	 	 	 	 	 	 	 	 17	 13	 	 10	 11;

parameter capacity(NODES) / f1 120,f2 96,f3 96,f4 96,f5 201,f6 96,f7 153,f8 96,pl1 55,pl2 51,pl3 63,pl4 63,pl5 51,pl6 51,pl7 42,pl8 102,pl9 102,pl10 127,B1 95,B2 90,B3 90,B4 82,B5 79 /;

parameter duration(CONTRACTPOOLS) / pl1 8,pl2 5,pl3 2,pl4 8,pl5 5,pl6 8,pl7 8 /;

parameter fixcost(POOLS) / pl1 133,pl2 114,pl3 128,pl4 130,pl5 120,pl6 138,pl7 112,pl8 115,pl9 138,pl10 145 /;

parameter revenue(BLENDS) / 
B1 47,B2 47,B3 45,B4 48,B5 46 /;

parameter initialinv(NODES) / B1 27 ,B2 27 ,B3 26 ,B4 37 ,B5 27  /;

table flowlbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 7	 6	 	 8	 5	 8	 	 	 	 	 	 	 	 	 
f2	 8	 	 	 6	 5	 5	 	 	 	 	 	 	 	 	 
f3	 	 6	 	 	 7	 8	 	 	 	 	 	 	 	 	 
f4	 	 6	 	 8	 	 6	 9	 	 	 	 	 	 	 	 
f5	 5	 9	 	 	 8	 	 5	 	 	 	 	 	 	 	 
f6	 	 	 8	 5	 	 9	 5	 	 	 	 	 	 	 	 
f7	 	 	 9	 	 7	 7	 6	 	 	 	 	 	 	 	 
f8	 9	 	 5	 6	 5	 5	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 	 	 5	 	 	 	 	 	 
pl2	 	 	 	 	 	 	 	 2	 3	 4	 	 	 	 	 
pl3	 	 	 	 	 	 	 	 2	 4	 3	 	 	 	 	 
pl4	 	 	 	 	 	 	 	 4	 5	 	 	 	 	 	 7
pl5	 	 	 	 	 	 	 	 4	 	 	 	 	 	 	 
pl6	 	 	 	 	 	 	 	 	 5	 4	 	 	 	 	 
pl7	 	 	 	 	 	 	 	 	 5	 2	 	 	 	 	 
pl8	 	 	 	 	 	 	 	 	 	 	 8	 8	 9	 7	 6
pl9	 	 	 	 	 	 	 	 	 	 	 6	 	 	 	 8
pl10	 	 	 	 	 	 	 	 	 	 	 8	 8	 	 7	 9;

table flowupbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 55	 51	 	 63	 51	 51	 	 	 	 	 	 	 	 	 
f2	 55	 	 	 63	 51	 51	 	 	 	 	 	 	 	 	 
f3	 	 51	 	 	 51	 51	 	 	 	 	 	 	 	 	 
f4	 	 51	 	 63	 	 51	 42	 	 	 	 	 	 	 	 
f5	 55	 51	 	 	 51	 	 42	 	 	 	 	 	 	 	 
f6	 	 	 63	 63	 	 51	 42	 	 	 	 	 	 	 	 
f7	 	 	 63	 	 51	 51	 42	 	 	 	 	 	 	 	 
f8	 55	 	 63	 63	 51	 51	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 	 	 55	 	 	 	 	 	 
pl2	 	 	 	 	 	 	 	 51	 51	 51	 	 	 	 	 
pl3	 	 	 	 	 	 	 	 63	 63	 63	 	 	 	 	 
pl4	 	 	 	 	 	 	 	 63	 63	 	 	 	 	 	 63
pl5	 	 	 	 	 	 	 	 51	 	 	 	 	 	 	 
pl6	 	 	 	 	 	 	 	 	 51	 51	 	 	 	 	 
pl7	 	 	 	 	 	 	 	 	 42	 42	 	 	 	 	 
pl8	 	 	 	 	 	 	 	 	 	 	 95	 90	 90	 82	 79
pl9	 	 	 	 	 	 	 	 	 	 	 95	 	 	 	 79
pl10	 	 	 	 	 	 	 	 	 	 	 95	 90	 	 82	 79  ;

table prodrate(INPUTS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10
f1	 28	 49	 19	 23	 10	 20	 17	 26	 13	 23
f2	 25	 40	 13	 11	 22	 23	 11	 25	 17	 27
f3	 33	 29	 24	 23	 25	 21	 12	 29	 12	 13
f4	 26	 38	 25	 26	 10	 13	 12	 23	 24	 20
f5	 46	 38	 22	 21	 19	 10	 11	 27	 28	 26
f6	 36	 39	 23	 14	 13	 15	 18	 13	 27	 25
f7	 32	 30	 24	 15	 28	 29	 20	 19	 29	 11
f8	 45	 39	 24	 15	 28	 20	 11	 11	 26	 17  ;

table demand(BLENDS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10
B1	 8	 19	 22	 23	 21	 29	 24	 21	 23	 21
B2	 13	 14	 26	 27	 21	 26	 23	 21	 26	 19
B3	 12	 14	 25	 18	 28	 19	 22	 24	 24	 24
B4	 19	 18	 25	 24	 23	 25	 29	 22	 27	 29
B5	 13	 14	 20	 28	 24	 22	 25	 27	 19	 22  ;

table speclevel(INPUTS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
f1		 0.47	 0.3	 0.69	 0.43
f2		 0.6	 0.35	 0.69	 0.68
f3		 0.53	 0.39	 0.54	 0.49
f4		 0.61	 0.54	 0.69	 0.56
f5		 0.63	 0.39	 0.7	 0.49
f6		 0.64	 0.54	 0.26	 0.39
f7		 0.3	 0.29	 0.25	 0.21
f8		 0.23	 0.46	 0.43	 0.3  ;

table minspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.28	 0.32	 0.32	 0.26
B2		 0.3	 0.33	 0.31	 0.25
B3		 0.36	 0.35	 0.42	 0.37
B4		 0.36	 0.36	 0.39	 0.33
B5		 0.33	 0.34	 0.43	 0.35  ;

table maxspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.64	 0.52	 0.69	 0.67
B2		 0.63	 0.53	 0.68	 0.63
B3		 0.51	 0.44	 0.59	 0.54
B4		 0.63	 0.5	 0.59	 0.54
B5		 0.58	 0.45	 0.67	 0.63  ;

$include xmodel.gms