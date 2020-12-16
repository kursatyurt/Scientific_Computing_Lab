function plotDtSols_vs_ExactSol(t_cell,dt_list,sol_cell,name, t_ana, p_ana)
    figure;
    hold on;
           
    plot(t_ana,p_ana,'LineWidth',2,'DisplayName','Analytical Solution');
    
    for i=1:length(dt_list)
        title(name)
        plot(t_cell{i},sol_cell{i},'DisplayName',string(dt_list(i)),'LineWidth',2);    
    end
    legend;
    ylim([0 20])
    xlim([0 5])
    set(gca,'FontSize',15)
    grid on
    ylabel('Function Value','FontSize',15);
    xlabel('Time (t)','FontSize',15);
