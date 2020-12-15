function y = RK_4(y0,dt,finaltime)
global rhs_pdot
%Create Empty Vectors
y=[];
%Initialize the vectors
y(1)= y0;
%Initialize Counter
cnt=1;
%Start Solution Loop
for time=0:dt:(finaltime-dt)
	%Calculate Coefficents
      k1 = rhs_pdot(y(cnt));
	  k2 = rhs_pdot(y(cnt)+dt/2.*k1);
	  k3 = rhs_pdot(y(cnt)+dt/2.*k2);
	  k4 = rhs_pdot(y(cnt)+dt*k3);
	  
	  %Increment Counter
      cnt = cnt + 1;
	  %Calculate next value of function
	  y(cnt) = y(cnt-1) + dt*(k1/6. +k2/3.+k3/3.+k4/6.);
    end
end
