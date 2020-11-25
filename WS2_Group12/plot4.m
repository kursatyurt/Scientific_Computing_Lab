function plot4(x1,y1,x2,y2,x3,y3,x4,y4,xlabel,ylabel,ex1,ey1)

figure('units','normalized','outerposition',[0 0 0.5 0.8])
ti = tiledlayout(2,2);

nexttile;
plot(x1,y1,'LineWidth',2);
hold on
plot(ex1,ey1,'LineWidth',2);
hold off
set(gca,'FontSize',15)
grid on

nexttile;
plot(x2,y2,'LineWidth',2);
hold on
plot(ex1,ey1,'LineWidth',2);
hold off
set(gca,'FontSize',15)
grid on


nexttile;
plot(x3,y3,'LineWidth',2);
hold on
plot(ex1,ey1,'LineWidth',2);
hold off
set(gca,'FontSize',15)
grid on

nexttile;
plot(x4,y4,'LineWidth',2);
hold on
plot(ex1,ey1,'LineWidth',2);
hold off
set(gca,'FontSize',15)
grid on

saveas(gcf,'complongtl.png') 