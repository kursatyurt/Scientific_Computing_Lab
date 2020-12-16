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
dt_list = [1/2,1/4,1/8,1/16,1/32]';
sz = length(dt_list);
t_list = cell(1,sz);
for i=1:sz
    t_list{i} = 0:dt_list(i):t_end;
end
explicit_euler = getDtCell(sol,dt_list,@explicitEuler);
heun = getDtCell(sol,dt_list,@Heun);
plotDtSols_vs_ExactSol(t_list,dt_list,explicit_euler,'Explicit Euler vs Exact solution',t_ana,p_ana);
plotDtSols_vs_ExactSol(t_list,dt_list,heun,'Heun vs Exact solution',t_ana,p_ana);


% task c) and d)
euler = getDtCell(sol,dt_list,@implicitEuler);
adam = getDtCell(sol,dt_list,@adamsMoulton2);
plotDtSolutions(t_list,dt_list,euler,'Implicit Euler',t_ana,p_ana);
plotDtSolutions(t_list,dt_list,adam,'Adams Moulton 2nd order',t_ana,p_ana);

% task e) and f)
adam_lin1 = getDtCell(sol,dt_list,@adamsMoulton_lin1);
adam_lin2 = getDtCell(sol,dt_list,@adamsMoulton_lin2);
plotDtSolutions(t_list,dt_list,euler,'Implicit Euler',t_ana,p_ana);
plotDtSolutions(t_list,dt_list,adam,'Adams Moulton 2nd order',t_ana,p_ana);
plotDtSolutions(t_list,dt_list,adam_lin1,'Adams Moulton Linearisation 1',t_ana,p_ana);
plotDtSolutions(t_list,dt_list,adam_lin2,'Adams Moulton Linearisation 2',t_ana,p_ana);

% task g) h)

computeErrErrRed
createTable
