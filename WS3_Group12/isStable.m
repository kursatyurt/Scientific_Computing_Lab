function isStable(methodlist,method_name,dt_list)
    %Iterate Over All Methods
    
    for j=1:length(methodlist)
        method_cell = methodlist{j};
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

        err_list{j} = max_err;
        clear max_err
    end
     
     %Create Table For Stability Results
    table_created = table(err_list{1}.',err_list{2}.',err_list{3}.',err_list{4}.',err_list{5}.',err_list{6}.','VariableNames',{'Imp Euler','Adam Moul','Adam Lin1','Adam Lin2','Exp Euler','Heun'},'RowNames',{'1/2','1/4','1/8','1/16','1/32'})
end

