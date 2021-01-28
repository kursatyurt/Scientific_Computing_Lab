%% Gauss Siedel Iterative Solver Module
function Tnp1 = GS_solver(Tn,nx,ny,dt)

%Calculate lambdax, lambday and beta values (i.e coefficients)_
lambdax = dt*(nx+1)^2;
lambday = dt*(ny+1)^2;
beta = 1/(2*lambdax+2*lambday+1);

%Start with an infinity norm
norm=inf;

%Include Boundaries 
Tn = blkdiag(0,Tn,0);
%Copy Old Solution as initial 
Tnp1=Tn; 
% Required accuracy 1e-6 take square of it 
accuracy2 = 1e-12;

while(norm>accuracy2)
%Apply Gauss-Seidel Formulation 
 for j=2:ny+1
     for i=2:nx+1
         Tnp1(i,j)= (Tn(i,j)+lambdax*(Tnp1(i-1,j)+Tnp1(i+1,j))+lambday*(Tnp1(i,j-1)+Tnp1(i,j+1)))*beta;
     end
 end
 
%Calculate norm for current solution 
norm = calculate_norm(Tnp1,nx,ny,lambdax,lambday,beta,Tn);

end
%Exclude Bondaries
Tnp1 = Tnp1(2:nx+1,2:ny+1);


end


%% Function to calculate residual norm
function norm = calculate_norm(Tnp1,nx,ny,lambdax,lambday,beta,Tn)
norm_m=zeros(nx+2,ny+2);

 for j=2:ny+1
     for i=2:nx+1
         norm_m(i,j)= Tn(i,j)+lambdax*(Tnp1(i-1,j)+Tnp1(i+1,j))+lambday*(Tnp1(i,j-1)+Tnp1(i,j+1))-(2*lambdax+2*lambday+1)*Tnp1(i,j);
     end
 end 
norm_m=norm_m(2:nx+1,2:ny+1).^2;
norm=sum(norm_m,'all')/nx/ny;
end





