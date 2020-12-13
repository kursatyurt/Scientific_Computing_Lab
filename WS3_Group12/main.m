clc
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% params
global accuracy
accuracy = 1e-4; % newton accuracy
y_0 = 20;
t_end = 5;
dt = 1/64;
t = 0:dt:t_end;
dt_list = [1/2,1/4,1/8,1/16,1/32]';

% ODE def
%global rhs rhs_prime
syms rhs(x)
rhs(x) = 7*(1-x/10)*x;
rhs_prime = diff(rhs,x);
rhs = matlabFunction(rhs); % symbolic functions are VERY slow!
rhs_prime = matlabFunction(rhs_prime); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% task a)
t_ana = linspace(0,t_end);
p_ana = 200./(20-10.*exp(-7.*t_ana));
fig = plot(t_ana,p_ana);
saveas(fig,'graph_p(t)_analytical.png')

% task b)
plot_b(y_0, dt_list,t_end,@explicitEuler,'Explicit Euler',t_ana,p_ana,rhs);
plot_b(y_0, dt_list,t_end,@Heun,'Heun',t_ana,p_ana,rhs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% task c) and d)
sol = Solutions(y_0,t_end,rhs,rhs_prime);
dt_list = [1/2,1/4,1/8,1/16,1/32]';
sz = length(dt_list);
t_list = cell(1,sz);
for i=1:sz
    t_list{i} = 0:dt_list(i):t_end;
end
euler = getDtCell(sol,dt_list,@impliciteuler);
adam = getDtCell(sol,dt_list,@adamsmoulton2);
plotdtsolutions(t_list,dt_list,euler,'implicit euler');
plotdtsolutions(t_list,dt_list,adam,'adams moulton 2nd order');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% task e) and f)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% task g)
