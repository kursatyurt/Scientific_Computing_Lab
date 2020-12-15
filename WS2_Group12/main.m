clc
clear all
close all

 % Define rhs function
global rhs_pdot;
syms p pdot
rhs = (1-p/10)*p;
rhs_pdot=matlabFunction(rhs);

 % Exact Solution
t_end = 5;
dte=linspace(0,t_end,100);
exsol=ExactSol(dte);

Euler = PlotResults("Explicit-Euler",@ExplicitEuler,exsol,dte,t_end)
Heun = PlotResults("Heun",@Heun,exsol,dte,t_end)
RK = PlotResults("Runge-Kutta",@RK_4,exsol,dte,t_end)

%ExplicitEuler(1,1/2,5)
