$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3,pl4,pl5,pl6/;
set ARCS(NODES,NODES) / f1.(pl2,pl6),
		f2.(pl2,pl5),
		f3.(pl1,pl2,pl4,pl5,pl6),
		f4.(pl2,pl5,pl6),
		f5.(pl1,pl2,pl3,pl4,pl5),
		f6.(pl2,pl3,pl5,pl6),
		f7.(pl5,pl6),
		f8.(pl2,pl3,pl6),
		pl1.(pl7,pl8,pl10),
		pl2.(pl8,pl10,B3),
		pl3.(pl7,pl8,pl10),
		pl4.(pl7,pl8),
		pl5.(pl7,pl9,pl10,B3,B5),
		pl6.(pl7,pl10,B4),
		pl7.(B1,B2,B3,B4,B5),
		pl8.(B2,B4),
		pl9.(B2,B3,B4,B5),
		pl10.(B1,B5) /;

alias(NODES,NODES2);

set FullHorizon /0 * 10/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;
table varcost(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 	 14	 	 	 	 13	 	 	 	 	 	 	 	 	 
f2	 	 11	 	 	 9	 	 	 	 	 	 	 	 	 	 
f3	 16	 13	 	 16	 10	 15	 	 	 	 	 	 	 	 	 
f4	 	 17	 	 	 14	 17	 	 	 	 	 	 	 	 	 
f5	 10	 17	 17	 12	 12	 	 	 	 	 	 	 	 	 	 
f6	 	 17	 10	 	 14	 9	 	 	 	 	 	 	 	 	 
f7	 	 	 	 	 11	 16	 	 	 	 	 	 	 	 	 
f8	 	 13	 11	 	 	 17	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 11	 6	 	 7	 	 	 	 	 
pl2	 	 	 	 	 	 	 	 10	 	 9	 	 	 9	 	 
pl3	 	 	 	 	 	 	 10	 9	 	 5	 	 	 	 	 
pl4	 	 	 	 	 	 	 5	 9	 	 	 	 	 	 	 
pl5	 	 	 	 	 	 	 11	 	 9	 7	 	 	 16	 	 14
pl6	 	 	 	 	 	 	 8	 	 	 10	 	 	 	 9	 
pl7	 	 	 	 	 	 	 	 	 	 	 10	 9	 12	 11	 9
pl8	 	 	 	 	 	 	 	 	 	 	 	 17	 	 13	 
pl9	 	 	 	 	 	 	 	 	 	 	 	 15	 16	 16	 14
pl10	 	 	 	 	 	 	 	 	 	 	 16	 	 	 	 11;

parameter capacity(NODES) / f1 234,f2 120,f3 168,f4 120,f5 147,f6 168,f7 234,f8 300,pl1 42,pl2 63,pl3 42,pl4 51,pl5 55,pl6 42,pl7 120,pl8 120,pl9 109,pl10 96,B1 64,B2 70,B3 64,B4 70,B5 70 /;

parameter duration(CONTRACTPOOLS) / pl1 2,pl2 5,pl3 5,pl4 2,pl5 5,pl6 5 /;

parameter fixcost(POOLS) / pl1 146,pl2 141,pl3 131,pl4 129,pl5 122,pl6 127,pl7 121,pl8 122,pl9 110,pl10 141 /;

parameter revenue(BLENDS) / 
B1 47,B2 43,B3 48,B4 39,B5 47 /;

parameter initialinv(NODES) / B1 27 ,B2 29 ,B3 28 ,B4 32 ,B5 32  /;

table flowlbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 	 6	 	 	 	 8	 	 	 	 	 	 	 	 	 
f2	 	 5	 	 	 7	 	 	 	 	 	 	 	 	 	 
f3	 8	 8	 	 8	 5	 7	 	 	 	 	 	 	 	 	 
f4	 	 7	 	 	 7	 7	 	 	 	 	 	 	 	 	 
f5	 8	 8	 7	 8	 8	 	 	 	 	 	 	 	 	 	 
f6	 	 6	 5	 	 5	 9	 	 	 	 	 	 	 	 	 
f7	 	 	 	 	 9	 9	 	 	 	 	 	 	 	 	 
f8	 	 9	 5	 	 	 5	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 3	 5	 	 2	 	 	 	 	 
pl2	 	 	 	 	 	 	 	 2	 	 2	 	 	 8	 	 
pl3	 	 	 	 	 	 	 5	 5	 	 5	 	 	 	 	 
pl4	 	 	 	 	 	 	 2	 3	 	 	 	 	 	 	 
pl5	 	 	 	 	 	 	 5	 	 5	 4	 	 	 9	 	 5
pl6	 	 	 	 	 	 	 2	 	 	 2	 	 	 	 8	 
pl7	 	 	 	 	 	 	 	 	 	 	 7	 6	 7	 5	 5
pl8	 	 	 	 	 	 	 	 	 	 	 	 6	 	 9	 
pl9	 	 	 	 	 	 	 	 	 	 	 	 5	 6	 9	 5
pl10	 	 	 	 	 	 	 	 	 	 	 5	 	 	 	 9;

table flowupbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 	 63	 	 	 	 42	 	 	 	 	 	 	 	 	 
f2	 	 63	 	 	 55	 	 	 	 	 	 	 	 	 	 
f3	 42	 63	 	 51	 55	 42	 	 	 	 	 	 	 	 	 
f4	 	 63	 	 	 55	 42	 	 	 	 	 	 	 	 	 
f5	 42	 63	 42	 51	 55	 	 	 	 	 	 	 	 	 	 
f6	 	 63	 42	 	 55	 42	 	 	 	 	 	 	 	 	 
f7	 	 	 	 	 55	 42	 	 	 	 	 	 	 	 	 
f8	 	 63	 42	 	 	 42	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 42	 42	 	 42	 	 	 	 	 
pl2	 	 	 	 	 	 	 	 63	 	 63	 	 	 63	 	 
pl3	 	 	 	 	 	 	 42	 42	 	 42	 	 	 	 	 
pl4	 	 	 	 	 	 	 51	 51	 	 	 	 	 	 	 
pl5	 	 	 	 	 	 	 55	 	 55	 55	 	 	 55	 	 55
pl6	 	 	 	 	 	 	 42	 	 	 42	 	 	 	 42	 
pl7	 	 	 	 	 	 	 	 	 	 	 64	 70	 64	 70	 70
pl8	 	 	 	 	 	 	 	 	 	 	 	 70	 	 70	 
pl9	 	 	 	 	 	 	 	 	 	 	 	 70	 64	 70	 70
pl10	 	 	 	 	 	 	 	 	 	 	 64	 	 	 	 70  ;

table prodrate(INPUTS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10
f1	 45	 39	 21	 20	 11	 10	 28	 24	 10	 18
f2	 31	 38	 15	 23	 22	 25	 17	 27	 14	 21
f3	 42	 26	 16	 23	 18	 19	 12	 10	 13	 20
f4	 37	 45	 23	 10	 21	 25	 23	 15	 23	 19
f5	 36	 48	 19	 16	 26	 20	 29	 28	 14	 26
f6	 34	 45	 14	 10	 17	 18	 28	 27	 28	 15
f7	 48	 41	 17	 10	 25	 14	 12	 10	 28	 16
f8	 29	 44	 18	 16	 12	 23	 13	 25	 12	 22  ;

table demand(BLENDS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10
B1	 15	 12	 26	 25	 21	 28	 20	 28	 28	 24
B2	 19	 10	 24	 20	 23	 23	 22	 20	 24	 28
B3	 8	 20	 22	 19	 25	 26	 21	 26	 20	 25
B4	 20	 12	 21	 19	 28	 28	 28	 19	 26	 26
B5	 15	 17	 21	 18	 26	 24	 24	 23	 21	 20  ;

table speclevel(INPUTS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
f1		 0.57	 0.51	 0.62	 0.74
f2		 0.72	 0.37	 0.54	 0.69
f3		 0.21	 0.4	 0.57	 0.73
f4		 0.69	 0.55	 0.6	 0.5
f5		 0.46	 0.33	 0.62	 0.54
f6		 0.59	 0.43	 0.68	 0.66
f7		 0.39	 0.32	 0.61	 0.41
f8		 0.68	 0.72	 0.25	 0.65  ;

table minspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.26	 0.36	 0.3	 0.45
B2		 0.28	 0.36	 0.33	 0.44
B3		 0.51	 0.35	 0.43	 0.54
B4		 0.44	 0.39	 0.51	 0.55
B5		 0.36	 0.37	 0.38	 0.55  ;

table maxspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.71	 0.69	 0.67	 0.73
B2		 0.67	 0.69	 0.66	 0.72
B3		 0.72	 0.54	 0.61	 0.71
B4		 0.65	 0.55	 0.68	 0.69
B5		 0.67	 0.59	 0.6	 0.7  ;

$include xmodel.gms