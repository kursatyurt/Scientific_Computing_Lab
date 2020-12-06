function [x,y] = RK_4(y0,x0,dt,finaltime)
%Create Empty Vectors
x=[];
y=[];
%Initialize the vectors
x(1)= x0;
y(1)= y0;
%Initialize Counter
cnt=1;
time=x0;
%Start Solution Loop
	while time<finaltime
	%Calculate Coefficents
      k1 = pdot(y(cnt));
	  k2 = pdot(y(cnt)+dt/2.*k1);
	  k3 = pdot(y(cnt)+dt/2.*k2);
	  k4 = pdot(y(cnt)+dt*k3);
	  
	  %Increment Counter
          cnt = cnt + 1;
	  %Calculate next value of function
	  y(cnt) = y(cnt-1) + dt*(k1/6. +k2/3.+k3/3.+k4/6.);
	  %Increment time
	  time = time + dt;
	  x(cnt) = time;
    end
end
