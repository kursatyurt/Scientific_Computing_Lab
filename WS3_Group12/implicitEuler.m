function y = implicitEuler(rhs,rhs_prime,y_0,dt,t_end)
    accuracy = 1e-4;
    nbr_steps = ceil(t_end/dt)+1;
    y = zeros(nbr_steps,1);
    y(1) = y_0;
    for i=2:nbr_steps
        syms r_root(x)
        r_root(x) = y(i-1) - x + dt*rhs;
        r_root_prime = diff(r_root,x);
        y(i) = newtonRoot(y(i-1),accuracy,r_root,r_root_prime);
    end
end