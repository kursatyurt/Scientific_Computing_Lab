function y = adamsMoulton_lin1(rhs,rhs_prime,y_0,dt,t_end)
    global accuracy;
    nbr_steps = ceil(t_end/dt)+1;
    y = zeros(nbr_steps,1);
    y(1) = y_0;
    for i=2:nbr_steps
          prev_y = y(i-1);
          r_root = @(x) prev_y -x + dt/2 * (rhs(prev_y) + 7 * (1 - x/10) * prev_y );
          r_root_prime = @(x) -1+ dt/2 * (-7/10 * prev_y );
                    try
            y(i) = newtonRoot(y(i-1),accuracy,r_root,r_root_prime);
          catch e
             error("AdamsMoulton2 Lin1 with dt=%f does not converge\n",dt);
          end
    end
end
