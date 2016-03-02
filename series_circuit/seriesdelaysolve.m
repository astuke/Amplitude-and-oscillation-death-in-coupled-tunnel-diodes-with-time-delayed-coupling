sol=dde23('seriesdelay',[12 12], [-1.4387   -0.1935    1.7328   -1.2947    0.7604   -0.3867], [0, 40]);

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


%figure(23);
%hold on;
%plot(sol.y(1,:),sol.y(2,:));
%xlabel('x_1'); ylabel('y_1');

%figure(24);
%hold on;
%plot(sol.y(4,:),sol.y(5,:));
%xlabel('x_2'); ylabel('y_2');


figure(38); clf;
plot(sol.x,sol.y(3,:), sol.x, sol.y(6,:), 'LineWidth', 4);
h=xlabel('t'); g=ylabel('z_1, z_2');
set(gca, 'FontSize', 40,'YLim',[-2.5, 2.5],'linewidth',3);
set(h, 'Fontsize', 40);
set(g, 'Fontsize', 40);
%legend('z_1','z_2');
set(legend, 'FontSize', 30);

%hold on;
%plot(sol.y(1,:),sol.y(2,:));
%xlabel('x_1'); ylabel('y_1');

%hold on;
%plot(sol.y(4,:),sol.y(5,:));
%xlabel('x_2'); ylabel('y_2');

figure(3); clf;
plot(sol.x,y3,'Color',[1 0 0],'LineWidth', 3);
hold on;
plot(sol.x,y6,'Color', [1 0.1 1],'LineWidth', 3);
h=xlabel('t'); g=ylabel('z_1, z_2');
set(gca, 'YLim', [-2.5, 2.5], 'FontSize', 40,'linewidth',4);
set(h, 'Fontsize', 40);
set(g, 'Fontsize', 40);
legend('z_1', 'z_2');
set(legend, 'FontSize', 30);

figure(4); clf;
plot(sol.x,y5,'Color',[1 0 0],'LineWidth', 3);
hold on;
plot(sol.x,y2,'Color',[1 0.1 1],'LineWidth', 3);
h=xlabel('t'); g=ylabel('y_2');
set(gca, 'FontSize', 40,'linewidth',4);
set(h, 'Fontsize', 40);
set(g, 'Fontsize', 40);
set(legend, 'FontSize', 30);

figure(5); clf;
plot3(y1,y2,y3, 'Color', [1 0 0], 'LineWidth', 3);
hold on;
plot3(y4,y5,y6, 'Color', [1 0.1 1], 'LineWidth', 3);
hold on;
h=xlabel('x'); g=ylabel('y'); j=zlabel('z');
set(gca, 'FontSize', 15, 'linewidth',3, 'FontSize', 30);
set(h, 'Fontsize', 30);
set(g, 'Fontsize', 30);
set(j, 'Fontsize', 30);
box on;
grid on;
rotate3d on;

figure(20); clf;
%plot3(y1,y2,y3, 'Color', [0 0.7 0], 'LineWidth', 2);
hold on;
plot(y4,y5, 'Color', [1 0 0], 'LineWidth', 2);
h=xlabel('x'); g=ylabel('y');
set(gca, 'FontSize', 15, 'linewidth',3, 'FontSize', 20);
set(h, 'Fontsize', 30);
set(g, 'Fontsize', 30);
box on;
grid on;


figure(21); clf;
%plot3(y1,y2,y3, 'Color', [0 0.7 0], 'LineWidth', 2);
hold on;
plot(y2,y5, 'Color', [1 0 0], 'LineWidth', 2);
h=xlabel('x'); g=ylabel('y');
set(gca, 'FontSize', 15, 'XTick',[-10:5:10], 'YTick',[-10:5:10] ,'linewidth',3, 'FontSize', 20);
set(h, 'Fontsize', 10);
set(g, 'Fontsize', 10);
box on;
grid on;
