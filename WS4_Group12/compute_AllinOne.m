function [sol_gauss, sol_direct, sol_sparse]=compute_AllinOne(Nx_list,Ny_list,rhs_fct)


sol_direct = cell(length(Nx_list),1);
sol_gauss = cell(length(Nx_list),1);
sol_sparse = cell(length(Nx_list),1);
for i=1:length(Nx_list)
   nx = Nx_list(i);
   ny = Ny_list(i);
   rhs = getFctVector(rhs_fct,nx,ny);
   
   %%%%%%%%%%%%%%%%%%%%%%%
   % direct solver
   %t2 = clock;
   tic
   A = getLaplacianMatrix(nx,ny);
   mat_sol = A\rhs;
   sol_direct{i}{2} = toc;%etime(clock,t2);
   sol_direct{i}{1} = reshape(mat_sol,nx,ny);
   % Measure storage
   sol_direct{i}{3} = size(A,1)*size(A,2) + size(mat_sol,1); 
   
   % no error cal require
   
   % sparse solver
   tic
   Asp = sparse(getLaplacianMatrix(nx,ny));
   spar_sol = Asp\rhs;
   sol_sparse{i}{2} = toc;%etime(clock,t2);
   sol_sparse{i}{1} = reshape(spar_sol,nx,ny);
   % Measure storage
   sol_sparse{i}{3} = nnz(Asp) + size(spar_sol,1); 
   %%%%%%%%%%%%%%%%%%%%%%%
   % GS Solver
%    t1 = clock;
   tic
   sol_gauss{i}{1}= GS_solver(rhs,nx,ny);
   sol_gauss{i}{2} = toc;%etime(clock,t1);
   % Measure storage
   sol_gauss{i}{3} = size(sol_gauss{i}{1},1);  
   % Need to confirm error cal, compare to which sol?.
   sol_gauss{i}{4} = sqrt(1/(nx*ny)*sum(sum(sol_gauss{i}{1}-getAnalyticalSolution(nx,ny)).^2));



    %%%%%%%%%%%%%%%%%%%%%%
    %Adding for sparse matrix
    %no error cal require
end
end
