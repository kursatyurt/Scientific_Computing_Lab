function y_new = newtonRoot(y_guess,accuracy,rhs,rhs_prime)
    error = realmax;
    y_new = y_guess;
    n = 0;
    max_n = 200;
    while(abs(error)>accuracy)
        y_new = y_new - rhs(y_new)/rhs_prime(y_new);
        n = n + 1;
        error = rhs(y_new);
%         disp(n);
%         disp(abs(error));
        if(n>max_n)
            error('Exceeded number of max iterations %i \n',max_n);
        end
    end