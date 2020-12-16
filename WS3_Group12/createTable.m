function createTable(method_cell,method_name,dt_list)
    %Analytical Solution Function Handler
    analytical_sol = @(x) 200./(20-10.*exp(-7*x));

    % Calculate the error based on formula 
    % E = SQRT( dt/t_end sum((numerical-exact)^2) )
    err = @(method_cell,i) sqrt(dt_list(i)/5 * sum ((method_cell{1,i}-analytical_sol(0:dt_list(i):5).').^2));
    for i=1:length(dt_list)
        errors(i) = err(method_cell,i);
    end
    for i=2:length(dt_list)
       err_red(i)      = errors(i-1)     / errors(i);
    end
    disp(method_name)
    table(dt_list,errors.',err_red.','VariableNames',{'dt','Error','Error Red.'},'RowNames',{'1/2','1/4','1/8','1/16','1/32'})
end

