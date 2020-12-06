clc
clear all
close all

 %Exact Solution
t_end = 5;
dte=linspace(0,t_end,100);
exsol=ExactSol(dte);

Euler = PlotResults("Explicit-Euler",@ExplicitEuler,exsol,dte,t_end)
Heun = PlotResults("Heun",@Heun,exsol,dte,t_end)
RK = PlotResults("Runge-Kutta",@RK_4,exsol,dte,t_end)
