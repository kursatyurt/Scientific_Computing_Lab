function make_plots(Nx_list,Ny_list,dt_list,Data,methodname)
time = ["1/8" "2/8" "3/8" "4/8"];
dt_str=["64" "128" "256" "512" "1024" "2048" "4096"];

for k=1:4 % Loop for time stations (1:4)/8 
figure('WindowState','maximized');
xd = tiledlayout(4,7);
title(xd ,methodname+" Solutions at time = "+time(k))
for i=1:length(Nx_list)
%Get Mesh Size
nx = Nx_list(i);
ny = Ny_list(i);
%Calcualte x,y values of mesh points for plotting
[dimx,dimy] = meshgrid(linspace(0,1,ny+2),linspace(0,1,nx+2));
    for j=1:length(dt_list)
    nexttile()
    surf(dimx,dimy,Data{i}{j}{k},'FaceColor','interp');colormap('jet');
    caxis manual
    caxis([0 0.15]);
    zlim([0 .15]);
    c=colorbar; c.Label.String = 'Temperature'; c.Limits=[0 .15];
    title(sprintf("Nx = %i, dt = 1/%s",Nx_list(i),dt_str(j)));
    end
end
end

end