function plot_b(y0,dt_list,t_end,func,name, t_ana, p_ana, rhs)
    figure;
    plot(t_ana, p_ana,'DisplayName', 'analytical');
    hold on;
    for i=1:length(dt_list)
        title(name);
        dt = dt_list(i);
        p = func(y0,dt,t_end, rhs);
        plot(0.:dt:t_end, p,'DisplayName', string(dt_list(i)));
        hold on;
    end
    legend;
