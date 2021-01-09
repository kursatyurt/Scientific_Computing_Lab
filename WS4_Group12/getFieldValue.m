function y = getFieldValue(x,i,j)
%GETFIELDVALUE get the value at i,j from the field vector
% incorporate given Dirichlet BC
global nx ny
% BC handling
if(i<1 || i>nx)
    y = 0;
    return
elseif(j<1 || j>ny)
    y = 0;
    return
end

y = x(i+(j-1)*nx);
end

