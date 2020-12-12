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
input = {rhs,rhs_prime,y_0,dt,t_end};
y = implicitEuler(input{:});
y_a = adamsMoulton2(input{:});
plot(t,y);
% y_ana = 200./(20-10*exp(-7*t));
% hold on, plot(t,y_ana,"r-");