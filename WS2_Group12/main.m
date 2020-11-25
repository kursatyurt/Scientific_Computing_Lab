clc
clear all
close all

PlotResults("Runge-Kutta",@RK_4)
PlotResults("Explicit-Euler",@ExplicitEuler)
PlotResults("Heun",@Heun)