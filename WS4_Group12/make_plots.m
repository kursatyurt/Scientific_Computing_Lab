function make_plots(Nx_list,Ny_list, Data)
% require list of Nx, and data computed from GS_solver

for i=1:length(Nx_list)
    %Get Mesh Size
    nx = Nx_list(i);
    ny = Ny_list(i);
    %Get Solution
    sol=Data{i}{1};
    %Include Boundaries
    sol_w_bounds = blkdiag(0,sol,0);
    %Calcualte x,y values of mesh points for plotting
    [dimx,dimy] = meshgrid(linspace(0,1,ny+2),linspace(0,1,nx+2));
    
    figure;
    subplot(1,2,1);
    surf(dimx,dimy, sol_w_bounds, 'FaceAlpha',0.95); colorbar; hcb=colorbar; hcb.Title.String = "Temperature";axis square;
    title('Surface Plot'); xlabel('X');ylabel('Y');zlabel('Surface Temperature');
    
    subplot(1,2,2);
    contour(dimx,dimy,sol_w_bounds,20,'--'); colorbar; hcb=colorbar; hcb.Title.String = "Temperature";axis square;
    title('Contour Plot'); xlabel('X');ylabel('Y');

end

end
