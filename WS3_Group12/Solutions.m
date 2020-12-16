classdef Solutions
    properties
        y_0
        t_end
        rhs
        rhs_prime
    end
    methods
        function obj = Solutions(y_0,t_end,rhs,rhs_prime)
            obj.y_0 = y_0;
            obj.t_end = t_end;
            obj.rhs = rhs;
            obj.rhs_prime = rhs_prime;
        end
        function sol_list = getDtCell(obj,dt_list,method)
            sz = length(dt_list);
            sol_list = cell(1,sz);
            for i=1:sz
                try
                    sol_list{i} = method(obj.rhs,obj.rhs_prime,obj.y_0,dt_list(i),obj.t_end);
                catch e
                    fprintf(2,e.message);
                    nbr_steps = ceil(obj.t_end/dt_list(i))+1;
                    sol_list{i} = zeros(nbr_steps,1);
                    continue;
                end
            end
        end
    end
end
