function A = getLaplacianMatrix(nx,ny)
% assuming Dirichlet BC
global hx2 hy2
n = nx*ny;
vec = @(n) ones(n,1);
Txx =  diag(-2/hx2*vec(n)) + diag(vec(n-1)/hx2,-1) + diag(vec(n-1)/hx2,1);
Tyy =  diag(-2/hy2*vec(n)) + diag(vec(n-nx)/hy2,-nx) + diag(vec(n-nx)/hy2,nx);
A = Txx + Tyy;

