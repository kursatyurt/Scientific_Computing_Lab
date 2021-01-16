function createGaussErrorTable(sol_gauss,Nx_list)
      
    %Extract error from input data
    errors = []; row_name={};
    for i=1:length(Nx_list)
        errors(i) = sol_gauss{i}{4};
        
        %create RowNames used for table later
        row_name{i} = num2str(Nx_list(i));
    end
        
    % First error reduction will be always not available
    err_red{1}= '-';
    
    %Calculate Error Reductions 
    for i=2:length(Nx_list)
       err_red{i} = errors(i-1) / errors(i);
    end
    
    %Convert Arrays to Cells
    errors = num2cell(errors);
    %err_red = num2cell(err_red);
    
    %Display the name of method and create table and show
    disp("Error of GS");
    table_created = table(errors.',err_red.','VariableNames',{'Error','Error Red.'},'RowNames',row_name)
end

