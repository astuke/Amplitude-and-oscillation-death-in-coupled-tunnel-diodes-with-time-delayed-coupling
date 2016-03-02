%[t,Y]=ode45('series',[0, 2000],[1.1 6.1 0.4 1.11 6.1 0.4.]);

[t,Y]=ode45('series',[0, 25],[  1.9861   -0.6243   -1.9837   -0.7906   -0.6350    0.7892]);

y1=Y(:,1);
y2=Y(:,2);
y3=Y(:,3);
y4=Y(:,4);
y5=Y(:,5);
y6=Y(:,6);





figure(1);
plot(t,y3,'Color',[0 0 1],'LineWidth', 3);
hold on;
plot(t,y6,'Color',[0 0.6 1],'LineWidth', 3);
h=xlabel('t'); g=ylabel('z_1, z_2');
set(gca, 'YLim', [-2.5, 2.5], 'FontSize', 40,'linewidth',4);
set(h, 'Fontsize', 40);
set(g, 'Fontsize', 40);
legend('z_1','z_2');
set(legend, 'FontSize', 30);

figure(2);
plot(t,y2,'Color',[0 0 1],'LineWidth', 3);
hold on;
plot(t,y5,'Color',[0 0.6 1],'LineWidth', 3);
h=xlabel('t'); g=ylabel('y_1, y_2');
set(gca, 'FontSize', 40,'linewidth',4);
set(h, 'Fontsize', 40);
set(g, 'Fontsize', 40);
legend('y_1','y_2');
set(legend, 'FontSize', 30);

figure(19);
plot3(y1,y2,y3, 'Color', [0 0 1], 'LineWidth', 2);
hold on;
plot3(y4,y5,y6, 'Color', [0 0.6 1], 'LineWidth', 2);
h=xlabel('x'); g=ylabel('y'); j=zlabel('z');
set(gca, 'FontSize', 15, 'linewidth',3, 'FontSize', 30);
set(h, 'Fontsize', 30);
set(g, 'Fontsize', 30);
set(j, 'Fontsize', 30);
box on;
grid on;
rotate3d on;

figure(20);
hold on;
plot3(y1,y2,y3, 'Color', [0 0 1], 'LineWidth', 2);
hold on;
plot(y4,y5, 'Color', [0 0.6 1], 'LineWidth', 2);
h=xlabel('x'); g=ylabel('y');
set(gca, 'FontSize', 15, 'XTick',[-10:5:10], 'YTick',[-10:5:10],'linewidth',3, 'FontSize', 30);
set(h, 'Fontsize', 30);
set(g, 'Fontsize', 30);
box on;
grid on;

figure(21);
plot(y2,y5, 'Color', [0 0 1], 'LineWidth', 2);
h=xlabel('x'); g=ylabel('y');
set(gca, 'FontSize', 15, 'YTick',[-10:5:10], 'XTick',[-10:5:10],'linewidth',3, 'FontSize', 20);
set(h, 'Fontsize', 20);
set(g, 'Fontsize', 20);
box on;
grid on;

