clear all;
clc;
% resolution
nx = 5;
ny = nx;
%%%%

% b)
% see getLaplacianMatrix

% c)
% see GS_solver

% d)
rhs_fct = @(x,y) -2*pi^2*sin(pi*x)*sin(pi*y);
rhs = getFctVector(rhs_fct,nx,ny);

% d.1)
A = getLaplacianMatrix(nx,ny);
mat_sol = A\rhs;
mat_sol = reshape(mat_sol,nx,ny)

% d.2)
A_sparse = sparse(A); % TODO build from scratch?
mat_sol = A_sparse\rhs;

% d.3)
gauss = GS_solver(rhs,nx,ny)





ana_fct = @(x,y) sin(pi*x)*sin(pi*y);
ana = getFctVector(ana_fct,nx,ny);
ana = reshape(ana,nx,ny)



