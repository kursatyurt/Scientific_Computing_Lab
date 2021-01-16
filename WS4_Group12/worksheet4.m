clear all;
close all;
clc;

% b)
% see getLaplacianMatrix

% c)
% see GS_solver

% d)
rhs_fct = @(x,y) -2*pi^2*sin(pi*x)*sin(pi*y);
%rhs = getFctVector(rhs_fct,nx,ny);

% d.1)
% nx=3;
% ny=nx;
% A = getLaplacianMatrix(nx,ny);
% A
%mat_sol = A\rhs;
%mat_sol = reshape(mat_sol,nx,ny);

% d.2)
%{
A_sparse = sparse(A); % TODO build from scratch?
mat_sol = A_sparse\rhs;
%}

% d.3)
%GS_solver(rhs,nx,ny);

% d)
Nx_list=[3 7 15 31 63,127];
Ny_list=Nx_list;
[sol_gauss, sol_direct, sol_sparse] = compute_AllinOne(Nx_list,Ny_list,rhs_fct); 
% e)
make_plots(Nx_list,Ny_list,sol_gauss);
% f)
createComparisonTable(sol_direct,Nx_list,"Direct");
createComparisonTable(sol_sparse,Nx_list,"Sparse");
createComparisonTable(sol_gauss,Nx_list,"Gauss");
% g)
createGaussErrorTable(sol_gauss, Nx_list(2:length(Nx_list)));

