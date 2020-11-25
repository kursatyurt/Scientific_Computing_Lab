clc
clear all
close all

%Exact Solution
dte=linspace(0,5,100);
exsol=ExactSol(dte);

%Solve for RK4
%dt=1 
[dt1,rks1] = RK_4(1.,0.,1.,5.);
%dt=1/2
[dt2,rks2] = RK_4(1.,0.,1./2,5.);
%dt=1/4
[dt4,rks4] = RK_4(1.,0.,1./4,5.);
%dt=1/8
[dt8,rks8] = RK_4(1.,0.,1./8,5.);

%Plot Results
plot4(dt1,rks1,dt2,rks2,dt4,rks4,dt8,rks8,dte,exsol,'Time','Function Value','Runge-Kutta 4 Solutions','\delta t=1','\delta t=1/2','\delta t=1/4','\delta t=1/8','rk4.png')
