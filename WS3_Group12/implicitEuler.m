function y = implicitEuler(rhs,rhs_prime,y_0,dt,t_end)
    global accuracy;
    nbr_steps = ceil(t_end/dt)+1;
    y = zeros(nbr_steps,1);
    y(1) = y_0;
    for i=2:nbr_steps
          r_root = @(x) y(i-1) - x + dt*rhs(x);
          r_root_prime = @(x) -1 + dt*rhs_prime(x);
          try
          y(i) = newtonRoot(y(i-1),accuracy,r_root,r_root_prime);
          catch
             y(i) = 0;
             error("Implicit Euler with dt=%f does not converge\n",dt);
          end
    end
end