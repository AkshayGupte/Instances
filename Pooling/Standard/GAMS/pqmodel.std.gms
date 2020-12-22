$ontext
    File name: pqmodel.gms.
    Author: Akshay Gupte, March, 2011.
    GAMS model for the PQ-formulation.
$offtext

#===============================================================================
# Declare options
#===============================================================================
options optcr=1.e-4, optca=1.e-3, limrow=2, limcol=0, reslim=86400;

#===============================================================================
# Declare sets
#===============================================================================
set l(i);
l(i) = i(i)-s(i)-t(i);

set FEASBLENDS(t);
FEASBLENDS(t) = yes;
set LOOSESPECS(t,k);
LOOSESPECS(t,k) = no;

parameter p(s,i);
p(s,l) = 1$(a(s,l) gt 0);

#===============================================================================
# Declare variables/bounds
#===============================================================================
variable cost;
positive variables y(s,i),  x(s,i,j);
positive variables f(i,j);

y.up(s,i) = a(s,i);
f.up(i,t) = min(bu(i),bu(t))*a(i,t);
x.up(s,i,t) = min(bu(s),bu(i),bu(t))*a(s,i)*a(i,t);

#===============================================================================
# Declare constraints
#===============================================================================
equations obj, sflowcaplb(s), sflowcapub(s), pflowcap(i), tflowcaplb(t),
          tflowcapub(t), quallb(t,k), qualub(t,k), propblnc(i), rlt1(i,t),
          rlt2(s,j), pathdef(s,i,t);

#===============================================================================
# Define constraints
#===============================================================================
#-----------------------------Objective function--------------------------------
obj.. cost =e= sum((s,l,t)$(a(s,l)>0 and a(l,t)>0),(c(s,l) + c(l,t))*x(s,l,t))
                                       + sum((s,t)$(a(s,t)>0), c(s,t)*f(s,t));
#-------------------------Raw material availabilities---------------------------
sflowcaplb(s)$(bl(s) > 0).. sum((l,t)$(a(s,l)>0 and a(l,t)>0), x(s,l,t)) +
                                    sum(t$(a(s,t)>0), f(s,t)) =g= bl(s);
sflowcapub(s)$(bu(s) < +inf).. sum((l,t)$(a(s,l)>0 and a(l,t)>0), x(s,l,t)) +
                                       sum(t$(a(s,t)>0), f(s,t)) =l= bu(s);
#-------------------------------Pool capacities---------------------------------
pflowcap(l)$(bu(l) < +inf).. sum((s,t)$(a(s,l)>0 and a(l,t)>0), x(s,l,t)) =l= bu(l);
#-------------------------Product demand restrictions---------------------------
tflowcaplb(t)$(bl(t) > 0 and FEASBLENDS(t)).. sum((s,l)$(a(s,l)>0 and a(l,t)>0), x(s,l,t)) +
                                    sum(s$(a(s,t)>0), f(s,t)) =g= bl(t);
tflowcapub(t)$(bu(t) < +inf and FEASBLENDs(t)).. sum((s,l)$(a(s,l)>0 and a(l,t)>0), x(s,l,t)) +
                                       sum(s$(a(s,t)>0), f(s,t)) =l= bu(t);
#------------------------Product quality specifications-------------------------
quallb(t,k)$(FEASBLENDS(t) and not LOOSESPECS(t,k)).. sum((l,s)$(a(s,l)>0 and a(l,t)>0), (qu(s,k) -
       ql(t,k))*x(s,l,t)) + sum(s$(a(s,t)>0), (qu(s,k) - ql(t,k))*f(s,t)) =g= 0;
qualub(t,k)$(FEASBLENDS(t) and not LOOSESPECS(t,k)).. sum((l,s)$(a(s,l)>0 and a(l,t)>0), (qu(s,k) -
       qu(t,k))*x(s,l,t)) + sum(s$(a(s,t)>0), (qu(s,k) - qu(t,k))*f(s,t)) =l= 0;
#------------------------------Proportion balances------------------------------
propblnc(l).. sum(s$(a(s,l)>0), y(s,l)) =e= 1;
#--------------------------RLT for proportion balances--------------------------
rlt1(l,t)$(a(l,t)>0).. sum(s$(a(s,l)>0), x(s,l,t)) =e= f(l,t);
#----------------------------RLT for pool capacities----------------------------
rlt2(s,l)$(a(s,l)>0).. sum(t$(a(l,t)>0), x(s,l,t)) =l= bu(l)*y(s,l);
#-----------------------------path flow definition------------------------------
pathdef(s,l,t)$(a(s,l)>0 and a(l,t)>0).. x(s,l,t) =e= y(s,l)*f(l,t);
#-----------------------------bound on input-pool arcs--------------------------
#inflowbd(s,l)$(a(s,l)>0).. sum(t$(a(l,t)>0), x(s,l,t)) =l= min(bu(s),bu(l));
#This is redundant

#===============================================================================
# Solve the model
#===============================================================================
model pqmodel /all/;
pqmodel.optfile = 1;
pqmodel.solprint = 0;
pqmodel.workspace = 3000;

# ==============================================================================