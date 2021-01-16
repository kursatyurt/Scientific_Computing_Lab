function T = GS_solver(rhs,nx,ny)
%Start with zero initial values 
T=zeros(nx,ny);
%Calculate dx,dy and beta values 
dx=1/(nx+1);
dy=1/(ny+1);
beta2=(dx/dy)^2;
%Start with an infinity norm
norm=inf;

accuracy = 1e-4;
while(norm>accuracy)
%Start solution Loop
add=0;
j=1;
i=1;
T(i,j)=  (T(i+1,j) +beta2*(T(i,j+1))-dx^2*rhs(i+add))/(2*(1+beta2));
for i=2:nx-1
    T(i,j)=  (T(i+1,j) + T(i-1,j) +beta2*(T(i,j+1))-dx^2*rhs(i+add))/(2*(1+beta2));
end
i=nx;
T(i,j)=  (T(i-1,j) +beta2*(T(i,j+1))-dx^2*rhs(i+add))/(2*(1+beta2));
add = add + nx;

for j=2:ny-1
     i=1;
    T(i,j)=  (T(i+1,j)+beta2*(T(i,j-1)+T(i,j+1))-dx^2*rhs(i+add))/(2*(1+beta2));
    for i=2:nx-1
        T(i,j)=  (T(i+1,j) + T(i-1,j) +beta2*(T(i,j-1)+T(i,j+1))-dx^2*rhs(i+add))/(2*(1+beta2));
    end
    i=nx;
    T(i,j)=  (T(i-1,j) +beta2*(T(i,j-1)+T(i,j+1))-dx^2*rhs(i+add))/(2*(1+beta2));
    add = add + nx;
end


j=ny;
i=1;
T(i,j)=  (T(i+1,j)+beta2*(T(i,j-1))-dx^2*rhs(i+add))/(2*(1+beta2));
for i=2:nx-1
    T(i,j)=  (T(i+1,j) + T(i-1,j) +beta2*(T(i,j-1))-dx^2*rhs(i+add))/(2*(1+beta2));
end
i=nx;
T(i,j)=  (T(i-1,j) +beta2*(T(i,j-1))-dx^2*rhs(i+add))/(2*(1+beta2));


% for j=1:ny
%     for i=1:nx
%         %Check for the boundaries 
%         [left,right,up,down] = stencilcheck(i,j,nx,ny,T);
%         %Apply Gauss-Seidel Formulation 
%         T(i,j)=  (right + left +beta2*(up+down)-dx^2*rhs(i+add))/(2*(1+beta2));
%     end
%     add = add + nx;
% end
%Calculate norm for current solution 
norm = calculate_norm(T,nx,ny,rhs);

end
end

function [left,right,up,down] = stencilcheck(i,j,nx,ny,T)
    %Check if on the left boundary.
    if i>1 
        left = T(i-1,j);
    else 
        left = 0;
    end
    %Check if on the right boundary 
    if i<nx 
        right = T(i+1,j);
    else
        right = 0;
    end
    %Check if on the up boundary    
    if j>1
        up = T(i,j-1);
    else
        up = 0;
    end
    %Check if on the down boundary
    if j<ny
        down = T(i,j+1);
    else
        down = 0;
    end
    
end

function norm = calculate_norm(T,nx,ny,rhs)
dx=1/(nx+1);
dy=1/(ny+1);
%Initialize norm and sums 
sum1=0;sum2=0;

%Start Calculation
n = nx*ny;
i = 1;
j = 0;
for m=1:n
    % convert m to i,j
    if(mod(m,nx)==1)
        i = 1;
        j = j + 1;
    end
    [left,right,up,down] = stencilcheck(i,j,nx,ny,T);
    sum1 = (-2/dx^2 -2/dy^2)*T(i,j) + 1/dx^2*(left+right) +1/dy^2*(up + down);
    sum2 = sum2 + (rhs(m) - sum1)^2;
    i = i + 1;
end
%Calculate Norm
norm = sqrt(1/(nx*ny)*sum2);
end





