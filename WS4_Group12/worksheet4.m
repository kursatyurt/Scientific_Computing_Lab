clear all;
clc;
nx = 4;
ny = 3;
A = getLaplacianMatrix(nx,ny);
rhs_fct = @(x,y) -2*pi^2*sin(pi*x).*sin(pi*y);
rhs = getFctVector(rhs_fct,nx,ny);
num = A\rhs
ana_fct = @(x,y) sin(pi*x).*sin(pi*y);
ana = getFctVector(ana_fct,nx,ny)