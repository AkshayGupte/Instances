$eolcom #

set NODES /f1*f8, pl1*pl10, B1*B5/;
set SPECS /sp1*sp4/;
set INPUTS(NODES) /f1*f8/;
set BLENDS(NODES) /B1*B5/;
set POOLS(NODES) /pl1*pl10/;
set CONTRACTPOOLS(POOLS) /pl1,pl2,pl3,pl4,pl5,pl6/;
set ARCS(NODES,NODES) / f1.(pl1,pl2,pl3,pl4,pl5),
		f2.(pl5),
		f3.(pl2,pl3,pl6),
		f4.(pl1,pl2,pl3,pl4,pl5,pl6),
		f5.(pl1,pl2,pl3,pl4,pl6),
		f6.(pl2,pl3,pl6),
		f7.(pl1,pl2,pl3,pl4,pl6),
		f8.(pl1,pl2,pl4),
		pl1.(pl7,pl10,B5),
		pl2.(pl7,pl8,pl10,B1),
		pl3.(pl7,pl8,pl9),
		pl4.(pl7,pl8,pl9,pl10,B2),
		pl5.(pl10),
		pl6.(pl7,pl8,pl9,pl10),
		pl7.(B4,B5),
		pl8.(B1,B3,B4),
		pl9.(B1,B5),
		pl10.(B1) /;

alias(NODES,NODES2);

set FullHorizon /0 * 10/;
set ZeroSolveHorizon(FullHorizon) /0 * 6/;
set SolveHorizon(ZeroSolveHorizon) /1 * 6/;
set SolveTime(ZeroSolveHorizon) /1 * 6/;

scalar Warmup /2/;
table varcost(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 9	 13	 14	 11	 10	 	 	 	 	 	 	 	 	 	 
f2	 	 	 	 	 17	 	 	 	 	 	 	 	 	 	 
f3	 	 11	 15	 	 	 10	 	 	 	 	 	 	 	 	 
f4	 10	 14	 12	 16	 9	 15	 	 	 	 	 	 	 	 	 
f5	 10	 14	 13	 15	 	 12	 	 	 	 	 	 	 	 	 
f6	 	 14	 16	 	 	 10	 	 	 	 	 	 	 	 	 
f7	 11	 15	 11	 13	 	 14	 	 	 	 	 	 	 	 	 
f8	 17	 12	 	 10	 	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 8	 	 	 9	 	 	 	 	 14
pl2	 	 	 	 	 	 	 8	 9	 	 5	 9	 	 	 	 
pl3	 	 	 	 	 	 	 8	 5	 7	 	 	 	 	 	 
pl4	 	 	 	 	 	 	 8	 11	 8	 8	 	 14	 	 	 
pl5	 	 	 	 	 	 	 	 	 	 10	 	 	 	 	 
pl6	 	 	 	 	 	 	 11	 11	 6	 5	 	 	 	 	 
pl7	 	 	 	 	 	 	 	 	 	 	 	 	 	 10	 15
pl8	 	 	 	 	 	 	 	 	 	 	 13	 	 12	 15	 
pl9	 	 	 	 	 	 	 	 	 	 	 10	 	 	 	 10
pl10	 	 	 	 	 	 	 	 	 	 	 9	 	 	 	 ;

parameter capacity(NODES) / f1 168,f2 201,f3 147,f4 96,f5 201,f6 168,f7 153,f8 153,pl1 63,pl2 55,pl3 51,pl4 55,pl5 42,pl6 51,pl7 120,pl8 127,pl9 90,pl10 82,B1 90,B2 79,B3 73,B4 82,B5 79 /;

parameter duration(CONTRACTPOOLS) / pl1 2,pl2 5,pl3 2,pl4 5,pl5 5,pl6 8 /;

parameter fixcost(POOLS) / pl1 112,pl2 127,pl3 146,pl4 122,pl5 128,pl6 149,pl7 149,pl8 136,pl9 149,pl10 139 /;

parameter revenue(BLENDS) / 
B1 41,B2 39,B3 46,B4 47,B5 45 /;

parameter initialinv(NODES) / B1 30 ,B2 31 ,B3 30 ,B4 30 ,B5 23  /;

table flowlbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 5	 7	 8	 5	 9	 	 	 	 	 	 	 	 	 	 
f2	 	 	 	 	 6	 	 	 	 	 	 	 	 	 	 
f3	 	 5	 5	 	 	 5	 	 	 	 	 	 	 	 	 
f4	 7	 7	 9	 6	 8	 6	 	 	 	 	 	 	 	 	 
f5	 9	 6	 8	 9	 	 5	 	 	 	 	 	 	 	 	 
f6	 	 8	 5	 	 	 7	 	 	 	 	 	 	 	 	 
f7	 7	 8	 5	 7	 	 6	 	 	 	 	 	 	 	 	 
f8	 5	 7	 	 6	 	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 3	 	 	 4	 	 	 	 	 7
pl2	 	 	 	 	 	 	 2	 5	 	 3	 7	 	 	 	 
pl3	 	 	 	 	 	 	 2	 4	 3	 	 	 	 	 	 
pl4	 	 	 	 	 	 	 2	 2	 4	 5	 	 6	 	 	 
pl5	 	 	 	 	 	 	 	 	 	 5	 	 	 	 	 
pl6	 	 	 	 	 	 	 4	 4	 4	 5	 	 	 	 	 
pl7	 	 	 	 	 	 	 	 	 	 	 	 	 	 7	 7
pl8	 	 	 	 	 	 	 	 	 	 	 7	 	 6	 8	 
pl9	 	 	 	 	 	 	 	 	 	 	 6	 	 	 	 8
pl10	 	 	 	 	 	 	 	 	 	 	 9	 	 	 	 ;

table flowupbd(NODES,NODES2) 
	 pl1	 pl2	 pl3	 pl4	 pl5	 pl6	 pl7	 pl8	 pl9	 pl10	 B1	 B2	 B3	 B4	 B5
f1	 63	 55	 51	 55	 42	 	 	 	 	 	 	 	 	 	 
f2	 	 	 	 	 42	 	 	 	 	 	 	 	 	 	 
f3	 	 55	 51	 	 	 51	 	 	 	 	 	 	 	 	 
f4	 63	 55	 51	 55	 42	 51	 	 	 	 	 	 	 	 	 
f5	 63	 55	 51	 55	 	 51	 	 	 	 	 	 	 	 	 
f6	 	 55	 51	 	 	 51	 	 	 	 	 	 	 	 	 
f7	 63	 55	 51	 55	 	 51	 	 	 	 	 	 	 	 	 
f8	 63	 55	 	 55	 	 	 	 	 	 	 	 	 	 	 
pl1	 	 	 	 	 	 	 63	 	 	 63	 	 	 	 	 63
pl2	 	 	 	 	 	 	 55	 55	 	 55	 55	 	 	 	 
pl3	 	 	 	 	 	 	 51	 51	 51	 	 	 	 	 	 
pl4	 	 	 	 	 	 	 55	 55	 55	 55	 	 55	 	 	 
pl5	 	 	 	 	 	 	 	 	 	 42	 	 	 	 	 
pl6	 	 	 	 	 	 	 51	 51	 51	 51	 	 	 	 	 
pl7	 	 	 	 	 	 	 	 	 	 	 	 	 	 82	 79
pl8	 	 	 	 	 	 	 	 	 	 	 90	 	 73	 82	 
pl9	 	 	 	 	 	 	 	 	 	 	 90	 	 	 	 79
pl10	 	 	 	 	 	 	 	 	 	 	 82	 	 	 	   ;

table prodrate(INPUTS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10
f1	 32	 49	 18	 11	 10	 12	 14	 15	 25	 24
f2	 42	 48	 20	 16	 29	 12	 19	 26	 12	 29
f3	 28	 25	 15	 20	 20	 24	 24	 14	 11	 25
f4	 26	 47	 11	 13	 18	 11	 21	 21	 23	 17
f5	 48	 28	 18	 22	 18	 29	 26	 11	 26	 18
f6	 25	 31	 24	 22	 21	 21	 16	 15	 19	 16
f7	 39	 33	 19	 28	 28	 18	 28	 14	 11	 13
f8	 29	 49	 26	 21	 23	 26	 22	 10	 15	 22  ;

table demand(BLENDS,FullHorizon) 
	 1	 2	 3	 4	 5	 6	 7	 8	 9	 10
B1	 13	 17	 23	 23	 22	 21	 24	 18	 28	 26
B2	 18	 13	 29	 26	 28	 22	 29	 23	 18	 22
B3	 15	 15	 27	 24	 21	 24	 21	 28	 21	 22
B4	 9	 21	 26	 20	 28	 28	 19	 29	 19	 23
B5	 14	 9	 22	 24	 25	 29	 25	 20	 18	 21  ;

table speclevel(INPUTS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
f1		 0.62	 0.74	 0.56	 0.36
f2		 0.27	 0.6	 0.65	 0.67
f3		 0.45	 0.24	 0.44	 0.59
f4		 0.68	 0.67	 0.2	 0.24
f5		 0.57	 0.42	 0.69	 0.53
f6		 0.27	 0.46	 0.22	 0.45
f7		 0.58	 0.48	 0.2	 0.7
f8		 0.66	 0.62	 0.47	 0.47  ;

table minspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.32	 0.26	 0.27	 0.31
B2		 0.59	 0.49	 0.28	 0.27
B3		 0.4	 0.37	 0.2	 0.43
B4		 0.41	 0.38	 0.24	 0.4
B5		 0.27	 0.36	 0.21	 0.3  ;

table maxspec(BLENDS,SPECS) 
		 sp1	 sp2	 sp3	 sp4
B1		 0.66	 0.65	 0.67	 0.69
B2		 0.67	 0.73	 0.66	 0.65
B3		 0.55	 0.56	 0.41	 0.65
B4		 0.59	 0.6	 0.43	 0.59
B5		 0.64	 0.74	 0.61	 0.54  ;

$include xmodel.gms