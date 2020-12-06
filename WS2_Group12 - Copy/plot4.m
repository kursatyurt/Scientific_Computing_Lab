function plot4(x1,y1,x2,y2,x3,y3,x4,y4,ex1,ey1,xlab,ylab,tit,l1,l2,l3,l4,savefile)

figure('units','normalized','outerposition',[0 0 0.5 0.8])
ti = tiledlayout(2,2);
title(ti,tit,'Interpreter','latex','FontSize',25,'FontWeight','Bold') 

nexttile;
plot(x1,y1,'-*','LineWidth',2);
hold on
plot(ex1,ey1,'LineWidth',2);
hold off
ylabel(ylab,'FontSize',8);
xlabel(xlab,'FontSize',8);
legend(l1,'Exact Solution','Location','northwest');
set(gca,'FontSize',15)
grid on

nexttile;
plot(x2,y2,'-*','LineWidth',2);
hold on
plot(ex1,ey1,'LineWidth',2);
hold off
ylabel(ylab,'FontSize',8);
xlabel(xlab,'FontSize',8);
legend(l2,'Exact Solution','Location','northwest');
set(gca,'FontSize',15)
grid on


nexttile;
plot(x3,y3,'-*','LineWidth',2);
hold on
plot(ex1,ey1,'LineWidth',2);
hold off
ylabel(ylab,'FontSize',8);
xlabel(xlab,'FontSize',8);
legend(l3,'Exact Solution','Location','northwest');
set(gca,'FontSize',15)
grid on

nexttile;
plot(x4,y4,'-*','LineWidth',2);
hold on
plot(ex1,ey1,'LineWidth',2);
hold off
ylabel(ylab,'FontSize',8);
xlabel(xlab,'FontSize',8);
legend(l4,'Exact Solution','Location','northwest');
set(gca,'FontSize',15)
grid on

saveas(gcf,savefile) 