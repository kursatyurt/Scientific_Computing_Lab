
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
end 
