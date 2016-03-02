
sol=dde23('paralleldelay', [12 12], [-0.1068    0.7678    0.1461   -0.1068    0.7678    0.1461
], [0, 12]);

%plot(sol.x,sol.y);

figure(44);
plot(sol.x,sol.y(1,:),sol.x,sol.y(2,:),sol.x,sol.y(3,:), 'LineWidth', 2);
legend('x_1(t)','y_1(t)','z_1(t)')
h=xlabel('t'); g=ylabel('x_1, y_1, z_1');
set(gca, 'FontSize', 20);
set(legend, 'FontSize', 20);
set(h, 'Fontsize', 20);
set(g, 'Fontsize', 20);

%figure(45);
%plot(sol.x,sol.y(4,:),sol.x,sol.y(5,:),sol.x,sol.y(6,:));
%legend('x_2(t)','y_2(t)','z_2(t)');
%xlabel('Time)'); ylabel('x_2, y_2, z_2');


%figure(23);
%hold on;
%plot(sol.y(1,:),sol.y(2,:));
%xlabel('x_1'); ylabel('y_1');

%figure(24);
%hold on;
%plot(sol.y(4,:),sol.y(5,:));
%xlabel('x_2'); ylabel('y_2');


%figure(46);
%plot(sol.x,sol.y(3,:), sol.x, sol.y(6,:), 'LineWidth', 2);
%legend('z_1(t)','z_2(t)');
%h=xlabel('Time'); g=ylabel('z_1, z_2');
%set(gca, 'FontSize', 20);
%set(legend, 'FontSize', 20);
%set(h, 'Fontsize', 20);
%set(g, 'Fontsize', 20);