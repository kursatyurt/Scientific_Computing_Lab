clc
clear all
close all

% params
global accuracy
accuracy = 1e-4; % newton accuracy
y_0 = 20;
t_end = 5;
dt = 1/64;
dt_list = [1/2,1/4,1/8,1/16,1/32]';

% ODE def
%global rhs rhs_prime
syms rhs(x)
rhs(x) = 7*(1-x/10)*x;
rhs_prime = diff(rhs,x);
rhs = matlabFunction(rhs); % symbolic functions are VERY slow!
rhs_prime = matlabFunction(rhs_prime); 

% task a)
t_ana = linspace(0,t_end);
p_ana = 200./(20-10.*exp(-7.*t_ana));
fig = plot(t_ana,p_ana,'LineWidth',2);xlabel('Time (t)');ylabel('Function Value');title('Analytical Solution');ylim([0 20]);xlim([0 5]);grid on;

% task b)
sol = Solutions(y_0,t_end,rhs,rhs_prime);
sz = length(dt_list);
t_list = cell(1,sz);
for i=1:sz
    t_list{i} = 0:dt_list(i):t_end;
end
explicit_euler = getDtCell(sol,dt_list,@explicitEuler);
heun = getDtCell(sol,dt_list,@Heun);
plotDtSolutions(t_list,dt_list,explicit_euler,'Explicit Euler Method',t_ana,p_ana);
plotDtSolutions(t_list,dt_list,heun,'Heun Method',t_ana,p_ana);

% task c) and d)
euler = getDtCell(sol,dt_list,@implicitEuler);
adam = getDtCell(sol,dt_list,@adamsMoulton2);

% task e) and f)
adam_lin1 = getDtCell(sol,dt_list,@adamsMoulton_lin1);
adam_lin2 = getDtCell(sol,dt_list,@adamsMoulton_lin2);
plotDtSolutions(t_list,dt_list,euler,'Implicit Euler Method',t_ana,p_ana);
plotDtSolutions(t_list,dt_list,adam,'Adams Moulton 2nd order',t_ana,p_ana);
plotDtSolutions(t_list,dt_list,adam_lin1,'Adams Moulton Method Linearisation 1',t_ana,p_ana);
plotDtSolutions(t_list,dt_list,adam_lin2,'Adams Moulton MEthod Linearisation 2',t_ana,p_ana);

% task g) h)
createTable(euler,"IMPLICIT EULER METHOD",dt_list);
createTable(adam,"ADAMS MOULTON METHOD",dt_list);
createTable(adam_lin1,"ADAMS MOULTON METHOD 1st Linearization",dt_list);
createTable(adam_lin2,"ADAMS MOULTON METHOD 2nd Linearization",dt_list);
createTable(explicit_euler,"Explicit Euler METHOD",dt_list);
createTable(heun,"Heuns METHOD",dt_list);
