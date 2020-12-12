% params
global accuracy
accuracy = 1e-4; % newton accuracy
y_0 = 20;
t_end = 5;
dt = 1/64;
t = 0:dt:t_end;

% ODE def
syms rhs(x)
rhs(x) = 7*(1-x/10)*x;
rhs_prime = diff(rhs,x);
rhs = matlabFunction(rhs); % symbolic functions are
% very slow!
rhs_prime = matlabFunction(rhs_prime); 

% solve
sol = Solutions(y_0,t_end,rhs,rhs_prime);
dt_list = [1/2,1/4,1/8,1/16,1/32]';
sz = length(dt_list);
t_list = cell(1,sz);
for i=1:sz
    t_list{i} = 0:dt_list(i):t_end;
end
euler = getDtCell(sol,dt_list,@implicitEuler);
adam = getDtCell(sol,dt_list,@adamsMoulton2);
plotDtSolutions(t_list,dt_list,euler,'Implicit Euler');
plotDtSolutions(t_list,dt_list,adam,'Adams Moulton 2nd order');