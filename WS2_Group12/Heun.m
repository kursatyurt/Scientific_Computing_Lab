function y = Heun(y0,dt,finaltime)
global rhs_pdot
%Create Empty Vectors
y=[];
%Initialize the vectors
y(1)= y0;
%Initialize Counter
cnt=1;
%Start Solution Loop
for time=0:dt:(finaltime-dt)
	  %Increment Counter
      cnt = cnt + 1;
	  %Calculate next value of function
      pdot_current = rhs_pdot(y(cnt-1));
      pdot_next = rhs_pdot(y(cnt-1)+dt*pdot_current);
	  y(cnt) = y(cnt-1) + dt/2*(pdot_current + pdot_next);
    end
end
