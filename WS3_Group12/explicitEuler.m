function y = explicitEuler(rhs, rhs_prime , y_0, dt, t_end)
    nbr_steps = ceil(t_end/dt)+1;
    y = zeros(nbr_steps,1);
    y(1) = y_0;
    cnt = 1;         
    for time = dt:dt:t_end
        cnt = cnt + 1;
	    %Calculate next value of function
	    y(cnt) = y(cnt-1) + dt*rhs(y(cnt-1));
    end
end
