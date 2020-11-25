function [x,y] = ExplicitEuler(y0,x0,dt,finaltime)
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
	  y(cnt) = y(cnt-1) + dt*pdot(y(cnt-1));
	  %Increment time
	  time = time + dt;
	  x(cnt) = time;
    end
end