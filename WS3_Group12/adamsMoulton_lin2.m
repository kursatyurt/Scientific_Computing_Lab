function y = adamsMoulton_lin2(rhs, rhs_prime , y_0, dt, t_end)
    global accuracy;
    nbr_steps = ceil(t_end/dt)+1;
    y = zeros(nbr_steps,1);
    y(1) = y_0;
    for i=2:nbr_steps
            y(i) = (y(i-1)* (20 - 7 * dt * (y(i-1)-10))) / (7*dt*(y(i-1)-10)+20);
end
