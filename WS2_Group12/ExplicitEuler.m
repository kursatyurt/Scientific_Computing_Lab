function y = ExplicitEuler(y0,dt,final_time)
global rhs_pdot;
%Create Empty Vectors
y= [];
%Initialize the vectors
y(1) = y0;
%Initialize Counter
cnt = 1;
%Start Solution Loop
for time = 0.:dt:(final_time-dt)
      cnt = cnt + 1;
	  %Calculate next value of function
	  y(cnt) = y(cnt-1) + dt*rhs_pdot(y(cnt-1));
	  %Increment time
    end
end
