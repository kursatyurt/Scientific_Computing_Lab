function createComparisonTable(sol_array,Nx_list,method_name)

    sz = length(Nx_list);
    %Initialize runtime and storage matrices
    runtime = []; storage = [];
    for i=1:sz
    %Get Stored Runtime and Storage Information
    runtime(i) = sol_array{i}{2};
    storage(i) = sol_array{i}{3};
    end
   
    %Store the values in cells
    runtime = num2cell(runtime);    
    storage = num2cell(storage);
    
    
    %Display the name of method and create table and show
    disp(method_name)
    rownames=cellstr(string(Nx_list));
    disp(table(runtime.',storage.','VariableNames',{'Runtime','Storage'},'RowNames',rownames))
end

