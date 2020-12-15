function y = Heun(y0,dt,finaltime, rhs)

%Create Empty Vectors
y=[];
%Initialize the vectors
y(1)= y0;
%Initialize Counter
cnt=1;
%Start Solution Loop
for time=dt:dt:finaltime
	  %Increment Counter
      cnt = cnt + 1;
	  %Calculate next value of function
      pdot_current = rhs(y(cnt-1));
      pdot_next = rhs(y(cnt-1)+dt*pdot_current);
	  y(cnt) = y(cnt-1) + dt/2*(pdot_current + pdot_next);
    end
end
