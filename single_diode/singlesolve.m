[t,Y]=ode45('singlediode',[0, 8000],[1 0 -1]); %solves the system of dynamical equations in single.m

y1=Y(:,1);
y2=Y(:,2);
y3=Y(:,3);

hold on;
figure(4);
plot(t,y2,'Color', [0 0 1], 'LineWidth', 3);
hold on;
plot(t,y1,'Color', [0 0.6 1], 'LineWidth', 3);
hold on;
plot(t,y3,'Color', [0 0.9 1], 'LineWidth', 3);
h=xlabel('t'); g=ylabel('x, y, z');
set(gca, 'FontSize', 40, 'linewidth',3);
set(legend, 'FontSize', 20);
set(h, 'Fontsize', 40);
set(g, 'Fontsize', 40);
set(legend, 'FontSize', 30);

hold on;
figure(19);
plot3(y1,y2,y3, 'Color', [0 0 1], 'LineWidth', 2);
h=xlabel('x'); g=ylabel('y'); j=zlabel('z');
set(gca, 'FontSize', 15, 'linewidth',3, 'FontSize', 30);
set(h, 'Fontsize', 30);
set(g, 'Fontsize', 30);
set(j, 'Fontsize', 30);
box on;
grid on;
rotate3d on;


