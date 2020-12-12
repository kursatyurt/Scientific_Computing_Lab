
y_0 = 20;
t_end = 5;
dt = 1/64;
t = 0:dt:t_end;

syms rhs(x)
rhs(x) = 7*(1-x/10)*x;
rhs_prime = diff(rhs,x);
rhs = matlabFunction(rhs); % symbolic functions are
% very slow!
rhs_prime = matlabFunction(rhs_prime); 
y = implicitEuler(rhs,rhs_prime,y_0,dt,t_end);
plot(t,y);
y_ana = 200./(20-10*exp(-7*t));
hold on, plot(t,y_ana,"r-");