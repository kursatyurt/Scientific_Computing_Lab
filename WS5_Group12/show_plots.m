function show_plots(Nx_list,Ny_list,dt_list,Data,methodname)
time = ["1/8" "2/8" "3/8" "4/8"];
dt_str=["64" "128" "256" "512" "1024" "2048" "4096"];

for k=1:4 % Loop for time stations (1:4)/8 
figure('WindowState','maximized');
if methodname == "Explicit" ; 
xd = tiledlayout(length(Nx_list),length(dt_list));
else
xd = tiledlayout(2,2);
end
title(xd ,methodname+" Solutions at time = "+time(k))
for i=1:length(Nx_list)
    for j=1:length(dt_list)
    nexttile()
    filename = "./figures/"+methodname+"_time_"+num2str(k)+"_8"+"_nx_"+num2str(Nx_list(i))+"_dt_1_"+dt_str(j)+".png";
    image( imread(filename) );
    set(gca,'Visible','off')
    end
end
end
end


