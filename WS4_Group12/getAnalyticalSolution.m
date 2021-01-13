function AnalyticalSolution = getAnalyticalSolution(nx,ny)

[x,y] = meshgrid(linspace(1/(nx+1),1-1/(nx+1),nx),linspace(1/(ny+1),1-1/(ny+1),ny));
AnalyticalSolution= sin(pi.*x).*sin(pi.*y);

end

