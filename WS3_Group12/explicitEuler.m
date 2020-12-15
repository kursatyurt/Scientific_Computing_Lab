function y = explicitEuler(rhs, rhs_prime , y_0, dt, t_end)
    
    y = [];
    y(1) = y_0;
    cnt = 1;         
    for time = dt:dt:t_end
        cnt = cnt + 1;
	    %Calculate next value of function
	    y(cnt) = y(cnt-1) + dt*rhs(y(cnt-1));
    end
end
