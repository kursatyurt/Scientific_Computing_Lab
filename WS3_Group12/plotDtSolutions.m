function plotDtSolutions(t_cell,dt_list,sol_cell,name,t_ana,p_ana)
    figure;
    hold on;
    plot(t_ana,p_ana,'Color','k','LineStyle','-.','LineWidth',2,'DisplayName','Analytical Solution');

    
    for i=1:length(dt_list)
        title(name)
        if not(isequal(sol_cell{i},zeros(size(sol_cell{i}))))
            plot(t_cell{i},sol_cell{i},'DisplayName',string(dt_list(i)),'LineWidth',2);
        end
    end
    
    legend;
    ylim([0 20])
    xlim([0 5])
    set(gca,'FontSize',15)
    grid on
    ylabel('Function Value','FontSize',15);
    xlabel('Time (t)','FontSize',15);
