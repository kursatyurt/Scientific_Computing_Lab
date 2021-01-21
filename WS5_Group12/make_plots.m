function make_plots(Nx_list,Ny_list,dt_list,Data,methodname)
for k=1:4 % Loop for time stations (1:4)/8 
figure;
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
end
end
end
exportgraphics(gcf,"solution"+methodname+num2str(k)+".pdf");
close all;
end
