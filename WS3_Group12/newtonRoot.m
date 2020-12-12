function y_new = newtonRoot(y_guess,accuracy,rhs,rhs_prime)
    error = realmax;
    y_new = y_guess;
    while(abs(error)>accuracy)
        y_new = y_new - rhs(y_new)/rhs_prime(y_new);
        error = rhs(y_new);
    end