clear all;
clc;
% resolution
global nx ny;
nx = 4;
ny = 3;


global hx2 hy2;
hx2 = 1/(nx+1)^2;
hy2 = 1/(ny+1)^2;
% b)
A = getLaplacianMatrix(nx,ny);
% d.1)
rhs_fct = @(x,y) -2*pi^2*sin(pi*x).*sin(pi*y);
rhs = getFctVector(rhs_fct,nx,ny);
num = A\rhs

% check analytical solution
ana_fct = @(x,y) sin(pi*x).*sin(pi*y);
ana = getFctVector(ana_fct,nx,ny)

% Gauss Seidel
x0 = getFieldValue(x,i,j);
discreteLaplaceFct(x,x0,i,j);