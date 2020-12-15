function plotDtSolutions(t_cell,dt_list,sol_cell,name)
    figure;
    for i=1:length(dt_list)
        title(name)
        plot(t_cell{i},sol_cell{i},'DisplayName',string(dt_list(i)));
        ylim([0 20])
        xlim([0 5])
        hold on;
        
    end
    legend;