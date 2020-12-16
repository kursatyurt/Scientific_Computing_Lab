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

