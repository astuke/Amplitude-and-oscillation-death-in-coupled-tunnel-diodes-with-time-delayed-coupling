tspan=[0, 12] %start and end point for integrator
IC=[-0.1068    0.7678    0.1461   -0.1068    0.7678    0.1461] %initial conditions
Z=[12 12] % delay times

sol=dde23('paralleldelay',Z, IC,tspan); %solves the system of delayed dynamical equations in paralleldelay.m

figure(1);
plot(sol.x,sol.y(1,:),sol.x,sol.y(2,:),sol.x,sol.y(3,:), 'LineWidth', 2);
legend('x_1(t)','y_1(t)','z_1(t)')
h=xlabel('t'); g=ylabel('x_1, y_1, z_1');
set(gca, 'FontSize', 20);
set(legend, 'FontSize', 20);
set(h, 'Fontsize', 20);
set(g, 'Fontsize', 20);

figure(2);
plot(sol.x,sol.y(3,:), sol.x, sol.y(6,:), 'LineWidth', 2);
legend('z_1(t)','z_2(t)');
h=xlabel('Time'); g=ylabel('z_1, z_2');
set(gca, 'FontSize', 20);
set(legend, 'FontSize', 20);
set(h, 'Fontsize', 20);
set(g, 'Fontsize', 20);
