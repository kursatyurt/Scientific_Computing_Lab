function A = get_A_sparse(nx,ny)
% assuming Dirichlet BC
hx2 = (1/(nx+1))^2;
hy2 = (1/(ny+1))^2;
n = nx*ny;

%Txx =  diag(-2/hx2*ones(n,1)) + diag(ones(n-1,1)/hx2,-1) + diag(ones(n-1,1)/hx2,1);
Txx = sparse(1:n,1:n,-2/hx2*ones(1,n),n,n) + sparse(2:n,1:n-1,1/hx2*ones(1,n-1),n,n)+ sparse(1:n-1,2:n,1/hx2*ones(1,n-1),n,n);

%Tyy =  diag(-2/hy2*ones(n,1)) + diag(ones(n-nx,1)/hy2,-nx) + diag(ones(n-nx,1)/hy2,nx);
Tyy = sparse(1:n,1:n,-2/hy2*ones(1,n),n,n) + sparse(1+nx:n,1:n-nx,1/hy2*ones(1,n-nx),n,n) + sparse(1:n-nx, 1+nx:n, 1/hy2*ones(1,n-nx),n,n);

A = Txx + Tyy;

% Adjust for Dirichlet BC
A(nx+1:nx:n,nx:nx:n-1)=0;
A(nx:nx:n-1,nx+1:nx:n)=0;

