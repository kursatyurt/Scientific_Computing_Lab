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
%A = getLaplacianMatrix(nx,ny);
%mat_sol = A\rhs;
%mat_sol = reshape(mat_sol,nx,ny);

% d.2)
%{
A_sparse = sparse(A); % TODO build from scratch?
mat_sol = A_sparse\rhs;
%}

% d.3)
%GS_solver(rhs,nx,ny);

% e)
Nx_list=[7 15 31 63];
Ny_list=2*Nx_list;
[sol_gauss, sol_direct, sol_sparse] = compute_AllinOne(Nx_list,Ny_list,rhs_fct); 
createComparisonTable(sol_direct,Nx_list,"Direct");
createComparisonTable(sol_sparse,Nx_list,"Sparse");
createComparisonTable(sol_gauss,Nx_list,"Gauss");
make_plots(Nx_list,Ny_list,sol_gauss);
% f)
% Need to fulfill storage cal in compute_AllinOne 

% g)
createGaussErrorTable(sol_gauss, Nx_list(2:length(Nx_list)));

