
clc;
clear;
close all;

nx=15;
ny=15;
dt=1/8;
Tn = blkdiag(0,ones(nx,ny),0);
[dimx,dimy] = meshgrid(linspace(0,1,ny+2),linspace(0,1,nx+2));

for time=0:dt:4/8
    Tn = GS_solver(Tn,nx,ny,dt);
end

surf(dimx,dimy, Tn, 'FaceAlpha',0.95); colorbar; hcb=colorbar; hcb.Title.String = "Temperature";axis square;