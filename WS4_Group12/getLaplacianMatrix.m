function A = getLaplacianMatrix(nx,ny)
% assuming Dirichlet BC
hx2 = 1/(nx+1)^2;
hy2 = 1/(ny+1)^2;
n = nx*ny;
vec = @(n) ones(n,1);
Txx =  diag(-2/hx2*vec(n)) + diag(vec(n-1)/hx2,-1) + diag(vec(n-1)/hx2,1);
Tyy =  diag(-2/hy2*vec(n)) + diag(vec(n-nx)/hy2,-nx) + diag(vec(n-nx)/hy2,nx);
A = Txx + Tyy;

