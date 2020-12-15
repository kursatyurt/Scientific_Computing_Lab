function plotDtSolutions(t_cell,dt_list,sol_cell,name)
    figure;
    for i=1:length(dt_list)
        title(name)
        plot(t_cell{i},sol_cell{i},'DisplayName',string(dt_list(i)),'LineWidth',2);

        hold on;
        
    end
    legend;
    ylim([0 20])
    xlim([0 5])
    set(gca,'FontSize',15)
    grid on
    ylabel('Function Value','FontSize',15);
    xlabel('Time (t)','FontSize',15);
