clc
clear all
close all

% params
global accuracy
accuracy = 1e-4; % newton accuracy
y_0 = 20;
t_end = 5;
dt = 1/64;
t = 0:dt:t_end;

% task a)
t_ana = linspace(0,t_end);
p_ana = 200./(20-10.*exp(-7.*t));
%plot(t,p);

% task b)
syms p pdot(p)
eqn = pdot(p) == (1-p/10)*p;
global rhs_pdot;
rhs_pdot=matlabFunction(rhs(eqn));

dt_list = [1/2,1/4,1/8,1/16,1/32]';
plot_b(y_0, dt_list, t_end, @explicitEuler,'Explicit Euler');
plot_b(y_0, dt_list, t_end, @Heun,'Heun');

% ODE def
syms rhs(x)
rhs(x) = 7*(1-x/10)*x;
rhs_prime = diff(rhs,x);
rhs = matlabFunction(rhs); % symbolic functions are
% very slow!
rhs_prime = matlabFunction(rhs_prime); 


%{
% solve
sol = Solutions(y_0,t_end,rhs,rhs_prime);
dt_list = [1/2,1/4,1/8,1/16,1/32]';
sz = length(dt_list);
t_list = cell(1,sz);
for i=1:sz
    t_list{i} = 0:dt_list(i):t_end;
end
euler = getdtcell(sol,dt_list,@impliciteuler);
adam = getdtcell(sol,dt_list,@adamsmoulton2);
plotdtsolutions(t_list,dt_list,euler,'implicit euler');
plotdtsolutions(t_list,dt_list,adam,'adams moulton 2nd order');
%}
