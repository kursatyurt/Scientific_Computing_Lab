function A = getLaplacianMatrix(nx,ny)
% assuming Dirichlet BC
hx2 = (1/(nx+1))^2;
hy2 = (1/(ny+1))^2;
n = nx*ny;
Txx =  diag(-2/hx2*ones(n,1)) + diag(ones(n-1,1)/hx2,-1) + diag(ones(n-1,1)/hx2,1);
Tyy =  diag(-2/hy2*ones(n,1)) + diag(ones(n-nx,1)/hy2,-nx) + diag(ones(n-nx,1)/hy2,nx);
A = Txx + Tyy;
% Adjust for Dirichlet BC
for i=nx+1:nx:nx*ny
    A(i,i-1) = 0;
end
for i=nx:nx:nx*ny-1
    A(i,i+1) = 0;
end

