function T = GS_solver(rhs,nx,ny)

T=zeros(nx,ny);
dx=1/(nx+1);
dy=1/(ny+1);
beta2=(dx/dy)^2;
norm=inf;

for k=1:1000
add=0;
for j=1:ny
    for i=1:nx
        [left,right,up,down] = stencilcheck(i,j,nx,ny,T);
        T(i,j)=  right + left +beta2*(up+down)-dx^2*rhs(i+add);
        T(i,j)= T(i,j)/(2*(1+beta2));
    end
    add = add + nx;
end
norm = calculate_norm(T,nx,ny,rhs)

end
end

function [left,right,up,down] = stencilcheck(i,j,nx,ny,T)

    if i>1 
        left = T(i-1,j);
    else 
        left = 0;
    end
    
    if i<nx
        right = T(i+1,j);
    else
        right = 0;
    end
        
    if j>1
        up = T(i,j-1);
    else
        up = 0;
    end
    
    if j<ny
        down = T(i,j+1);
    else
        down = 0;
    end
    
end


function norm = calculate_norm(T,nx,ny,rhs)
dx=1/(nx+1);
dy=1/(ny+1);
%Reshape Matrix to vector
x=reshape(T.',1,nx*ny);
%Initialize norm and sums 
norm=0;sum1=0;sum2=0;

%Start Calculation
for m=1:nx*ny
    for n=1:nx*ny
        a = 0;
        %Get the the a(i,j) value
        if m == n 
            a = -2/dx^2 -2/dy^2;
        elseif m-1 == n || m+1 == n
            a = 1/dy^2;
        elseif m-nx == n || m+nx == n
            a = 1/dy^2;
        end
        %Inner Sum
        sum1 = sum1 + a*x(n);
    end
    %Outer Sum
    sum2 = sum2 + (rhs(m) - sum1)^2;
end
%Calculate Norm
norm = sqrt(1/(nx*ny)*sum2);
end


