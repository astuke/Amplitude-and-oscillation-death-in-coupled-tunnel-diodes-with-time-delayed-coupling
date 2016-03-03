sol=dde23('seriesdelay',[12 12], [-1.4387   -0.1935    1.7328   -1.2947    0.7604   -0.3867], [0, 40]);
%solves the system of delayed dynamical equations in seriesdelay.m

y1=sol.y(1,:);
y2=sol.y(2,:);
y3=sol.y(3,:);
y4=sol.y(4,:);
y5=sol.y(5,:);
y6=sol.y(6,:);

figure(1); clf;
plot(sol.x,sol.y(1,:),sol.x,sol.y(2,:),sol.x,sol.y(3,:), 'LineWidth', 3);
h=xlabel('t'); g=ylabel('x_1, y_1, z_1');
set(gca, 'FontSize', 30);
set(h, 'Fontsize', 30);
set(g, 'Fontsize', 30);

figure(2); clf;
plot(sol.x,y3,'Color',[1 0 0],'LineWidth', 3);
hold on;
plot(sol.x,y6,'Color', [1 0.1 1],'LineWidth', 3);
h=xlabel('t'); g=ylabel('z_1, z_2');
set(gca, 'YLim', [-2.5, 2.5], 'FontSize', 40,'linewidth',4);
set(h, 'Fontsize', 40);
set(g, 'Fontsize', 40);
legend('z_1', 'z_2');
set(legend, 'FontSize', 30);

figure(3); clf;
hold on;
plot(y2,y5, 'Color', [1 0 0], 'LineWidth', 2);
h=xlabel('x'); g=ylabel('y');
set(gca, 'FontSize', 15, 'XTick',[-10:5:10], 'YTick',[-10:5:10] ,'linewidth',3, 'FontSize', 20);
set(h, 'Fontsize', 10);
set(g, 'Fontsize', 10);
box on;
grid on;
