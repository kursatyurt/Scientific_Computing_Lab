function y = discreteLaplaceFct(x,x0,i,j)
global hx2 hy2
Txx = (x(i-1,j)-2*x0 + x(i+1,j))/hx2;
Tyy = (x(i,j-1)-2*x0 + x(i,j+1))/hy2;
y = Txx + Tyy;
end

