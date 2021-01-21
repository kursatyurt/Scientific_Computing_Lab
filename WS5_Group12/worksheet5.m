clc;
clear;
close all;


Nx_list=[3 7 15 31];
Ny_list=Nx_list;
dt_list=[1/64 1/128 1/256 1/512 1/1024 1/2048 1/4096];

[sol_explicit,sol_gauss]=compute_AllinOne(Nx_list,Ny_list,dt_list)
make_plots(Nx_list,Ny_list,dt_list,sol_explicit,"explicit_euler")
make_plots(Nx_list,Ny_list,dt_list,sol_gauss,"gauss_seidel")

