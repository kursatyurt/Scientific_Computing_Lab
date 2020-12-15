
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
   err_red_adam(i)      = adam_errors(i-1)     - adam_errors(i);
   err_red_adam_lin1(i) = adam_lin1_errors(i-1) - adam_lin1_errors(i);
   err_red_adam_lin2(i) = adam_lin2_errors(i-1) - adam_lin2_errors(i);
   err_red_imp_euler(i) = imp_euler_errors(i-1) - imp_euler_errors(i);
   err_red_exp_euler(i) = exp_euler_errors(i-1) - exp_euler_errors(i);
   err_red_heun(i)      = heun_errors(i-1)      - heun_errors(i);
end




disp('IMPLICIT EULER METHOD')
T_imp_euler = table(dt_list,imp_euler_errors.',err_red_imp_euler.','VariableNames',{'dt','Error','Error Red.'},'RowNames',{'1/2','1/4','1/8','1/16','1/32'})

disp('ADAMS MOULTON METHOD')
T_adam = table(dt_list,adam_errors.',err_red_adam.','VariableNames',{'dt','Error','Error Red.'},'RowNames',{'1/2','1/4','1/8','1/16','1/32'})

disp('ADAMS MOULTON METHOD 1st Linearization')
T_adam_lin1 = table(dt_list,adam_lin1_errors.',err_red_adam_lin1.','VariableNames',{'dt','Error','Error Red.'},'RowNames',{'1/2','1/4','1/8','1/16','1/32'})

disp('ADAMS MOULTON METHOD 2nd Linearization')
T_adam_lin2 = table(dt_list,adam_lin2_errors.',err_red_adam_lin2.','VariableNames',{'dt','Error','Error Red.'},'RowNames',{'1/2','1/4','1/8','1/16','1/32'})

disp('Explicit Euler METHOD')
T_exp_euler = table(dt_list,exp_euler_errors.',err_red_exp_euler.','VariableNames',{'dt','Error','Error Red.'},'RowNames',{'1/2','1/4','1/8','1/16','1/32'})

disp('Heuns METHOD')
T_heun = table(dt_list,heun_errors.',err_red_heun.','VariableNames',{'dt','Error','Error Red.'},'RowNames',{'1/2','1/4','1/8','1/16','1/32'})

