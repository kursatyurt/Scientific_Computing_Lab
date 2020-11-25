function PlotResults(name,func)
 %Exact Solution
dte=linspace(0,5,100);
exsol=ExactSol(dte);


[dt1,rks1] = func(1.,0.,1.,5.);
%dt=1/2
[dt2,rks2] = func(1.,0.,1./2,5.);
%dt=1/4
[dt4,rks4] = func(1.,0.,1./4,5.);
%dt=1/8
[dt8,rks8] = func(1.,0.,1./8,5.);

plot4(dt1,rks1,dt2,rks2,dt4,rks4,dt8,rks8,dte,exsol,'Time','Function Value',name+' Solutions','\delta t=1','\delta t=1/2','\delta t=1/4','\delta t=1/8',name+'.png')
end