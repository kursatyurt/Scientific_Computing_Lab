function isStable(method_cell,method_name,dt_list)
    %Analytical Solution Function Handler
    analytical_sol = @(x) 200./(20-10.*exp(-7*x));

    %Calculate the local error based on the formula
    % |(Analytical-Numerical)/Analytical|*100 
    % and take the maximum
    m_err = @(method_cell,i) max(abs((-method_cell{1,i}+analytical_sol(0:dt_list(i):5).')./analytical_sol(0:dt_list(i):5).'))*100;
    
    for i=1:length(dt_list)
        max_err(i) = m_err(method_cell,i);
    end
    

    %Conver Arrays to Cells to use Strings
    max_err = num2cell(max_err);
    % If the error > %10 mark as unstable    
    for i=1:length(dt_list)
         if (max_err{1,i} > 10.0 )
             max_err{1,i} = 'Unstable';
	 else 
             max_err{1,i} = 'Stable';
         end
    end
    
        
        
    %Display the name of method and create table and show
    disp(method_name)
    table_created = table(max_err.','VariableNames',{'Is Stable'},'RowNames',{'1/2','1/4','1/8','1/16','1/32'})
end

