clear all;
clc;
nx = 5;
ny = nx;
A = getLaplacianMatrix(nx,ny);
rhs_fct = @(x,y) -2*pi^2*sin(pi*x)*sin(pi*y);
rhs = getFctVector(rhs_fct,nx,ny);
num = linsolve(A,rhs)
ana_fct = @(x,y) sin(pi*x).*sin(pi*y);
ana = getFctVector(ana_fct,nx,ny)

T = GS_solver(rhs,nx,ny)