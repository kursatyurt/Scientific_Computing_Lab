clear all;
close all;
clc;

%% Notes about solver
%{ 
   b) 
   One use the function 
   getLaplacianMatrix(nx,ny)
   which returns a full matrix for given nx and ny values. 
%}
%{ 
   c) 
   One can use the function 
   GS_solver(rhs,nx,ny)
   where rhs is rhs vector size of nx*ny
   nx and ny are node numbers in x and y directions respectively.
   
   Function returns a matrix nx by ny which contains Temperature values at 
   grid points (i*hx,j*hy)
%}
%% SETUP THE PROBLEM 

%Define the RHS function which is given in WorkSheet
rhs_fct = @(x,y) -2*pi^2*sin(pi*x)*sin(pi*y);

%Define list of Nx values 
Nx_list=[3 7 15 31 63 127];
%{
Define list of Ny value which have to be same length with Nx list
For our case Nx=Ny
%}
Ny_list=Nx_list;

%% d) SOLVE PROBLEM 
%{
 Get solution with Gauss Seidel / Full Matrix / Sparse Matrix Solutions
 for given Nx and Ny lists and RHS function
%}

[sol_gauss, sol_direct, sol_sparse] = compute_AllinOne(Nx_list,Ny_list,rhs_fct); 
%% e) Visualize SOLUTIONS 
make_plots(Nx_list,Ny_list,sol_direct,"Full Matrix");
make_plots(Nx_list,Ny_list,sol_gauss,"Gauss Seidel");
make_plots(Nx_list,Ny_list,sol_sparse,"Sparse Matrix");

%% f) Compare Store Reqirements and Runtime
createComparisonTable(sol_direct,Nx_list,"Direct");
createComparisonTable(sol_sparse,Nx_list,"Sparse");
createComparisonTable(sol_gauss,Nx_list,"Gauss");


%% g) Tabulate Gauss-Seidel Solution Errors and Error Reduction
createGaussErrorTable(sol_gauss, Nx_list(2:length(Nx_list)));

