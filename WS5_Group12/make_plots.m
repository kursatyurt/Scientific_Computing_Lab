function make_plots(Nx_list,Ny_list,dt_list,Data,methodname)
for k=1:4 % Loop for time stations (1:4)/8 
figure('WindowState','maximized');
time = ["1/8" "2/8" "3/8" "4/8"];
sgtitle(sprintf("t = %s",time(k)));
dt_str=["1/64" "1/128" "1/256" "1/512" "1/1024" "1/2048" "1/4096"];
l=1;
for i=1:length(Nx_list)

%Get Mesh Size
nx = Nx_list(i);
ny = Ny_list(i);

%Calcualte x,y values of mesh points for plotting
[dimx,dimy] = meshgrid(linspace(0,1,ny+2),linspace(0,1,nx+2));

    for j=1:length(dt_list)

    subplot(length(Nx_list),length(dt_list),l);
    surf(dimx,dimy,Data{i}{j}{k} , 'FaceAlpha',0.95); colorbar; hcb=colorbar; hcb.Title.String = "Temperature";axis square;
    l=l+1;
    title(sprintf("Nx = %i, dt = %s",Nx_list(i),dt_str(j)))
end
end
exportgraphics(gcf,methodname+num2str(k)+".pdf");
close;
end
%close all;
end
