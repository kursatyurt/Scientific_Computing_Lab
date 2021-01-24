clc;
clear;
close all;


Nx_list=[3 7 15 31];
Ny_list=Nx_list;
dt_list=[1/64 1/128 1/256 1/512 1/1024 1/2048 1/4096];
output_times = (0:4)/8;

sol_explicit=computeSolution(Nx_list,Ny_list,dt_list,output_times,@Explicit_solver);
sol_gauss=computeSolution(Nx_list,Ny_list,dt_list,output_times,@GS_solver);
save_plots(Nx_list,Ny_list,dt_list,sol_explicit,"Explicit Euler")
save_plots(Nx_list,Ny_list,dt_list,sol_gauss,"Implicit Euler") 
make_plots(Nx_list,Ny_list,dt_list,sol_explicit,"Explicit Euler")
make_plots(Nx_list,Ny_list,dt_list,sol_gauss,"Gauss Seidel (Implicit Euler)")

