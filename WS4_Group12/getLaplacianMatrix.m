function A = getLaplacianMatrix(nx,ny)
% This function create the Laplacian Matrix A 
% assuming Dirichlet BC is applied at boundaries

%Calculate Spatial Spacing Squared Values
hx2 = (1/(nx+1))^2;
hy2 = (1/(ny+1))^2;
%Calculate Matrix Size n by x
n = nx*ny;

%Get Coefficents for cells in x-direction
Txx =  diag(-2/hx2*ones(n,1)) + diag(ones(n-1,1)/hx2,-1) + diag(ones(n-1,1)/hx2,1);
%Get Coefficents for cells in y-direction
Tyy =  diag(-2/hy2*ones(n,1)) + diag(ones(n-nx,1)/hy2,-nx) + diag(ones(n-nx,1)/hy2,nx);
%Assemble the matrix
A = Txx + Tyy;

% Adjust for Dirichlet BC
for i=nx+1:nx:nx*ny
    A(i,i-1) = 0;
end

for i=nx:nx:nx*ny-1
    A(i,i+1) = 0;
end

