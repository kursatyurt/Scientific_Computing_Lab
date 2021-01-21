function [sol_explicit,sol_gauss]=compute_AllinOne(Nx_list,Ny_list,dt_list)
% Create Cells for each solution type.
sol_explicit = cell(length(Nx_list),1);
sol_gauss = cell(length(Nx_list),1);


%Iterate over each value in Nx List and Corresponding Ny values
for i=1:length(Nx_list)
   for j=1:length(dt_list)
   % Get Nx and Ny and dt values
   nx = Nx_list(i);
   ny = Ny_list(i);
   dt = dt_list(j);
   % Initialize Solution
   Tn = blkdiag(0,ones(nx,ny),0);
   %%
   k=1;
   for time=0:dt:0.5
   Tn = Explicit_solver(Tn,nx,ny,dt);
   if (mod(time,0.125) == 0 & time ~= 0)
   sol_explicit{i}{j}{k}= Tn;
   k = k + 1;
   end
   end
   % Initialize Solution
   Tn = blkdiag(0,ones(nx,ny),0);
   %%
   k=1;
   for time=0:dt:0.5
   Tn = GS_solver(Tn,nx,ny,dt);
   if (mod(time,0.125) == 0 & time ~= 0)
   sol_gauss{i}{j}{k}= Tn;
   k = k + 1;
   end
   end

end
end
