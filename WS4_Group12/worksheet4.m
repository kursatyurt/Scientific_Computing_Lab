clear all;
clc;
% resolution
global nx ny;
nx = 5;
ny = nx;
global hx2 hy2;
hx2 = 1/(nx+1)^2;
hy2 = 1/(ny+1)^2;
%%%%

A = getLaplacianMatrix(nx,ny);
rhs_fct = @(x,y) -2*pi^2*sin(pi*x)*sin(pi*y);
rhs = getFctVector(rhs_fct,nx,ny);
num = linsolve(A,rhs);
num = reshape(num,nx,ny)
gauss = GS_solver(rhs,nx,ny)
ana_fct = @(x,y) sin(pi*x)*sin(pi*y);
ana = getFctVector(ana_fct,nx,ny);
ana = reshape(ana,nx,ny)



