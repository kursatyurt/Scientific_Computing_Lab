function [rks1,rks2,rks4,rks8,dt1,dt2,dt4,dt8] = PlotResults(name,func,exact_sol,dt_exact,t_end)


[dt1,rks1] = func(1.,0.,1.,5.);
%dt=1/2
[dt2,rks2] = func(1.,0.,1./2,5.);
%dt=1/4
[dt4,rks4] = func(1.,0.,1./4,5.);
%dt=1/8
[dt8,rks8] = func(1.,0.,1./8,5.);

plot4(dt1,rks1,dt2,rks2,dt4,rks4,dt8,rks8,dt_exact,exact_sol,'Time','Function Value',name+' Solutions','\delta t=1','\delta t=1/2','\delta t=1/4','\delta t=1/8',name+'.png')
disp("------------");
disp("Approximation errors of "+name);
E1 = ComputeError(rks1,ExactSol(dt1),1,t_end);
E2 = ComputeError(rks2,ExactSol(dt2),1./2,t_end);
disp("Error reduced by: "+  (E2/E1));
E3 = ComputeError(rks4,ExactSol(dt4),1./4,t_end);
disp("Error reduced by: "+  (E3/E2));
E4 = ComputeError(rks8,ExactSol(dt8),1./8,t_end);
disp("Error reduced by: "+  (E4/E3));

disp("Numerical approximation error:");
disp("E1");
ComputeError(rks1,rks8(1:8:end),1,t_end); % need to adjust access for precise solution: access only every 4th index etc...
disp("E2");
num1 = ComputeError(rks2,rks8(1:4:end),1/2.,t_end);
disp("E4");
num1 = ComputeError(rks4,rks8(1:2:end),1/4.,t_end);
disp("E8");
num1 = ComputeError(rks8,rks8,1/8,t_end);

end