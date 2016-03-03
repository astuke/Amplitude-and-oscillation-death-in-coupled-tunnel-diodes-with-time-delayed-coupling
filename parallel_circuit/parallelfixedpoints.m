% physical parameters
d=0.7;
R1=8;
R2=8;
RL=1;
RB=2000;
rho=86;
I0=0.00122;
K=0.1306;
Vd0=0.27;
Ld=10^(-8);
C=56*10^(-12);
Cd1=26*10^(-12);
Cd2=1.1*Cd1;
R=d*rho

% nondimensional parameters
d1=R1/rho;
d2=R2/rho;
dL=RL/rho;
aL=RL*I0/K;
eps1=(rho*rho*Cd1)/Ld;
eps2=(rho*rho*Cd1)/Ld;
gamma=R*C*rho/Ld;
D=d1*d2+d*d1+d*d2;
B=d^2/D;
B1=(d*(d+d2))/D;
B2=(d*(d+d1))/D;


figure(4); clf;
hold on
for A1=[-0.5:0.001:0.5] %"A1" is the nondimensional input voltage --> find fixed points as a function of input voltage
    A2=A1;
    options=optimset(@fsolve);
    options=optimset(options, 'Display', 'final');
    %solves system of equations of the form f(x)=0 which corresponds to finding the fixed points of the system
    [y, fval, exitflag]=fsolve(@(Y) [1/eps*(Y(1)-Y(1)^3/3-Y(2)), Y(1)+Y(3)-dL*Y(2)-aL, 1/gamma*(-B1*Y(3)+B*Y(6)-Y(2)*d+A1), 1/eps*(Y(4)-Y(4)^3/3-Y(5)), Y(4)+Y(6)-dL*Y(5)-aL, -B2*Y(6)+B*Y(3)-Y(5)*d+A2],[0 0 1 1 0 0], options)
     plot(A1,y(3),'.','Markersize', 5, 'LineWidth',3)
    legend('z1')
    h=xlabel('A'); g=ylabel('z_1, z_2');
    set(gca, 'FontSize', 30, 'linewidth', 3, 'XLim', [-0.5, 0.5], 'XTick', -0.5:0.1:0.5, 'YLim', [-2, 2]);
    set(legend, 'FontSize', 30);
set(h, 'Fontsize', 40);
set(g, 'Fontsize', 40);
    box on;
end
hold on

