function [sol_gauss, sol_direct, sol_spare]=compute_AllinOne(Nx_list,rhs_fct)


sol_direct = cell(length(Nx_list),1);
sol_gauss = cell(length(Nx_list),1);
%sol_gauss = cell(length(Nx_list),1);
sol_spare = 0;
for i=1:length(Nx_list)
   nx = Nx_list(i);
   ny = nx;
   rhs = getFctVector(rhs_fct,nx,ny);
   
   %%%%%%%%%%%%%%%%%%%%%%%
   % direct solver
   t2 = clock;
   A = getLaplacianMatrix(nx,ny);
   mat_sol = A\rhs;
   sol_direct{i}{1} = reshape(mat_sol,nx,ny);
   sol_direct{i}{2} = etime(clock,t2);
   % Measure storage
   %sol_direct{i}{3} = ; 
   
   % no error cal require
    
   %%%%%%%%%%%%%%%%%%%%%%%
   % GS Solver
   t1 = clock;
   sol_gauss{i}{1}= GS_solver(rhs,nx,ny);
   sol_gauss{i}{2} = etime(clock,t1);
   % Measure storage
   %sol_gauss{i}{3} = ;  
   % Need to confirm error cal, compare to which sol?.
   sol_gauss{i}{4} = sqrt(1/(nx*ny)*sum(sum(sol_gauss{i}{1}-getAnalyticalSolution(nx,ny)).^2));



    %%%%%%%%%%%%%%%%%%%%%%
    %Adding for sparse matrix
    %no error cal require
end
end
