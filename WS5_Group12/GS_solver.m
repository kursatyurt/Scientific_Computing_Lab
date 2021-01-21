%% Gauss Siedel Iterative Solver Module
function Tnp1 = GS_solver(Tn,nx,ny,dt)

%Calculate lambdax, lambday and beta values (i.e coefficients)_
lambdax = dt*(nx+1)^2;
lambday = dt*(ny+1)^2;
beta = 1/(2*lambdax+2*lambday+1);

%Start with an infinity norm
norm=inf;
Tnp1=Tn;
% Required accuracy 1e-6 take square of it 
accuracy2 = 1e-12;

while(norm>accuracy2)
%Apply Gauss-Seidel Formulation 
 for j=2:ny+1
     for i=2:nx+1
         Tnp1(i,j)= (Tn(i,j)+lambdax*(Tnp1(i-1,j)+Tn(i+1,j))+lambday*(Tnp1(i,j-1)+Tn(i,j+1)))*beta;
     end
 end

%Calculate norm for current solution 
norm = calculate_norm(Tnp1,nx,ny,lambdax,lambday,beta,Tn);
end

end


%% Function to calculate residual norm
function norm = calculate_norm(Tnp1,nx,ny,lambdax,lambday,beta,Tn)
norm_m=zeros(nx*ny);

 for j=2:ny+1
     for i=2:nx+1
         norm_m(i,j)= beta*Tn(i,j)-lambdax*(Tnp1(i-1,j)+Tnp1(i+1,j))-lambday*(Tnp1(i,j-1)+Tnp1(i,j+1))-Tn(i,j);
     end
 end 
norm=sum(norm_m(2:nx+1,2:ny+1),'all')
end





