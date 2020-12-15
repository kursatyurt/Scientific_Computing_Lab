clc
clear all
close all

 % Define rhs function
syms p pdot(y)
eqn = pdot(p) == (1-y/10)*y;
global rhs_pdot;
rhs_pdot=matlabFunction(rhs(eqn));

 % Exact Solution
t_end = 5;
dte=linspace(0,t_end,100);
exsol=ExactSol(dte);

Euler = PlotResults("Explicit-Euler",@ExplicitEuler,exsol,dte,t_end)
Heun = PlotResults("Heun",@Heun,exsol,dte,t_end)
RK = PlotResults("Runge-Kutta",@RK_4,exsol,dte,t_end)

%ExplicitEuler(1,1/2,5)
