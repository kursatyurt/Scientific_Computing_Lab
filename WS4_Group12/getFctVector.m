function rhs = getFctVector(fct,nx,ny)
% return row-wise (x) field vector computed through a given fct(x,y)
n = nx*ny;
x = (1:nx)/(nx+1);
y = (1:ny)/(ny+1);
rhs = zeros(n,1);
[X,Y] = meshgrid(x,y);
X = X';
Y = Y';
add = 0;
for j=1:ny
    for i=1:nx
        rhs(i+add) = fct(X(i,j),Y(i,j));
    end
    add = add + nx;
end
end

