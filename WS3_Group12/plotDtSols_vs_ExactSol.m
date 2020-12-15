function plotDtSols_vs_ExactSol(t_cell,dt_list,sol_cell,name, t_ana, p_ana)
    figure;
    plot(t_ana, p_ana,'DisplayName', 'Exact Solution');
    hold on;
             
    for i=1:length(dt_list)
        title(name)
        plot(t_cell{i},sol_cell{i},'DisplayName',string(dt_list(i)));
        hold on;
        
    end
    legend;
