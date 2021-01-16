function [sol_gauss, sol_direct, sol_sparse]=compute_AllinOne(Nx_list,Ny_list,rhs_fct)
% Create Cells for each solution type.
sol_direct = cell(length(Nx_list),1);
sol_gauss = cell(length(Nx_list),1);
sol_sparse = cell(length(Nx_list),1);

%Iterate over each value in Nx List and Corresponding Ny values
for i=1:length(Nx_list)
   % Get Nx and Ny values
   nx = Nx_list(i);
   ny = Ny_list(i);
   %Calculate RHS vector
   rhs = getFctVector(rhs_fct,nx,ny);
   
   %%
  
   %% Solution using direct solver.

   tic % Start Time Measurement
   A = getLaplacianMatrix(nx,ny);
   mat_sol = linsolve(A,rhs);
   sol_direct{i}{2} = toc; %End Time Measurement for Calculation and Store it
   %Reshape Solution vector as matrix
   sol_direct{i}{1} = reshape(mat_sol,nx,ny); 
   % Measure storage
   sol_direct{i}{3} = size(A,1)*size(A,2) + size(mat_sol,1); 

   %% Solution using Sparse matrix
   
   tic % Start Time Measurement
   Asp = sparse(getLaplacianMatrix(nx,ny)); %Get the sparse matrix
   spar_sol = Asp\rhs;
   sol_sparse{i}{2} = toc; %End Time Measurement for Calculation and Store it
   %Reshape Solution vector as matrix
   sol_sparse{i}{1} = reshape(spar_sol,nx,ny);
   % Measure storage
   sol_sparse{i}{3} = nnz(Asp) + size(spar_sol,1); 
   
   %% Solution using Gauss Seidel Solver
   
   tic  % Start Time Measurement
   sol_gauss{i}{1}= GS_solver(rhs,nx,ny);
   sol_gauss{i}{2} = toc; %End Time Measurement for Calculation and Store it
   % Measure storage
   sol_gauss{i}{3} = size(sol_gauss{i}{1},1);  
   % Calculate the error with comparing analytical solution and store it
   sol_gauss{i}{4} = sqrt(1/(nx*ny)*sum(sum(sol_gauss{i}{1}-getAnalyticalSolution(nx,ny)).^2));

end

end
