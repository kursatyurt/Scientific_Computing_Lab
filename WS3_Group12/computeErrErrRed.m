%Analytical Solution Function Handler
analytical_sol = @(x) 200./(20-10.*exp(-7*x));

% Calculate the error based on formula 
%
% E = SQRT( dt/t_end sum((numerical-exact)^2) )


for i=1:length(dt_list)
    adam_errors(i)      = sqrt(dt_list(i)/5 * sum ((adam{1,i}-analytical_sol(0:dt_list(i):5).').^2));
    adam_lin1_errors(i) = sqrt(dt_list(i)/5 * sum ((adam_lin1{1,i}-analytical_sol(0:dt_list(i):5).').^2));
    adam_lin2_errors(i) = sqrt(dt_list(i)/5 * sum ((adam_lin2{1,i}-analytical_sol(0:dt_list(i):5).').^2));
    imp_euler_errors(i) = sqrt(dt_list(i)/5 * sum ((euler{1,i}-analytical_sol(0:dt_list(i):5).').^2));
    exp_euler_errors(i) = sqrt(dt_list(i)/5 * sum ((explicit_euler{1,i}-analytical_sol(0:dt_list(i):5)).^2));
    heun_errors(i) = sqrt(dt_list(i)/5 * sum ((heun{1,i}-analytical_sol(0:dt_list(i):5)).^2));
end 

for i=2:length(dt_list)
   err_red_adam(i)      = adam_errors(i-1)     / adam_errors(i);
   err_red_adam_lin1(i) = adam_lin1_errors(i-1) / adam_lin1_errors(i);
   err_red_adam_lin2(i) = adam_lin2_errors(i-1) / adam_lin2_errors(i);
   err_red_imp_euler(i) = imp_euler_errors(i-1) / imp_euler_errors(i);
   err_red_exp_euler(i) = exp_euler_errors(i-1) / exp_euler_errors(i);
   err_red_heun(i)      = heun_errors(i-1)      / heun_errors(i);
end
