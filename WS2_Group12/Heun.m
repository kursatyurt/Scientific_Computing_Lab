function [x,y] = Heun(y0,x0,dt,finaltime)
%Create Empty Vectors
x=[];
y=[];
%Initialize the vectors
x(1)= x0;
y(1)= y0;
%Initialize Counter
time=x0;
cnt=1;
%Start Solution Loop
	while time<finaltime
	  %Increment Counter
      cnt = cnt + 1;
	  %Calculate next value of function
      pdot_current = pdot(y(cnt-1));
      pdot_next = pdot(y(cnt-1)+dt*pdot_current);
	  y(cnt) = y(cnt-1) + dt/2*(pdot_current + pdot_next);
	  %Increment time
	  time = time + dt;
	  x(cnt) = time;
    end
end