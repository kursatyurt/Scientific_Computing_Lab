function make_plots(Nx_list,Ny_list, Data)
% require list of Nx, and data computed from GS_solver

for i=1:length(Nx_list)
    nx = Nx_list(i);
    ny = Ny_list(i);
    sol=Data{i}{1};
    sol_w_bounds = blkdiag(0,sol,0);
    [dimx,dimy] = meshgrid(linspace(0,1,ny+2),linspace(0,1,nx+2));
    
    figure;
    subplot(1,2,1);
    surf(dimx,dimy, sol_w_bounds, 'FaceAlpha',0.95); colorbar; axis square;
    title('Surface'); zlabel('Changes in temp');
    
    subplot(1,2,2);
    contour(dimx,dimy,sol_w_bounds,20,'--'); colorbar;axis square;
    title('Contour');

end

end