function Tnp1 = Explicit_solver(Tn,nx,ny,dt)

%Calculate lambdax, lambday and lambdax+lambday+1 values (i.e coefficients)_

lambdax = dt*(nx+1)^2;
lambday = dt*(ny+1)^2;
lxly1  = -2*lambdax-2*lambday+1;


%Include Boundaries 
Tn = blkdiag(0,Tn,0);
%Take old solution as new one 
Tnp1=Tn;

%Solve the system
 for j=2:ny+1
     for i=2:nx+1
         %Apply Explicit Formulation
         Tnp1(i,j)= lambdax*(Tn(i-1,j)+Tn(i+1,j))+lambday*(Tn(i,j-1)+Tn(i,j+1))+lxly1*Tn(i,j);
     end
 end

%Exclude Bondaries
Tnp1 = Tnp1(2:nx+1,2:ny+1);


