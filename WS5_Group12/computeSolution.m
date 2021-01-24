function sol=computeSolution(Nx_list,Ny_list,dt_list,output_times,method)
% Create Cells for each solution type.
sol = cell(length(Nx_list),1,1);

%Iterate over each value in Nx List and Corresponding Ny values and write
%at output times to solution cell
for i=1:length(Nx_list)
   for j=1:length(dt_list)
   % Get Nx and Ny and dt values
   nx = Nx_list(i);
   ny = Ny_list(i);
   dt = dt_list(j);
   %% store solutions at output times
   % Initialize Solution
   Tn = blkdiag(0,ones(nx,ny),0);
   
   for k=2:length(output_times)
       otp_interval = diff(output_times(k-1:k));
       nbr_steps = int64(otp_interval/dt);
       for s=1:nbr_steps
           Tn = method(Tn,nx,ny,dt);
       end
       sol{i}{j}{k-1}= Tn;
   end
   end

end
end
