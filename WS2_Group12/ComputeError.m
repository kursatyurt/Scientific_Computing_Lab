function E = ComputeError(p_approx,p_exact,dt,t_end)
    E = sqrt(dt/t_end*sum( (p_approx-p_exact).^2) );
    disp("dt: "+ dt);
    disp("E: "+ E);
    disp("-----");
end