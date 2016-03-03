% physical parameters
d=0.01;
rho=86;
RL=1; 
R=d*rho;
I0=0.00122;
K=0.1306;
Vd0=0.27;
aL=RL*I0/K;
Ld=10^(-8);
C=56*10^(-12);
Cd1=26*10^(-12);
Cd2=1.1*Cd1;

% nondimensional parameters
dL=RL/rho;
eps=(rho*rho*Cd1)/Ld;
gamma=R*C*rho/Ld;


figure(2); clf;
for a=[-3:0.01:3] % "a" is the nondimensional input voltage --> find fixed points as a function of input voltage
    options=optimset(@fsolve);
    options=optimset(options, 'Display', 'final');
    %solves system of equations of the form A(x)=0 which corresponds to finding the fixed points of the system
    [y, fval, exitflag]=fsolve(@(Y) [1/eps*(Y(1)-Y(1)^3/3-Y(2)), Y(1)+Y(3)-dL*Y(2)-aL, 1/gamma*(a-Y(3)-Y(6)-d*Y(2)), 1/eps*(Y(4)-Y(4)^3/3-Y(5)), Y(4)+Y(6)-dL*Y(5)-aL, 1/gamma*(a-Y(6)-Y(3)-d*Y(5))],[1 0 0 -1 0 1], options)
    plot(a,y(3),'.','Markersize', 5);
    set(gca, 'XLim',[-2.5, 2.5], 'YLim', [-2.5, 2.5], 'FontSize', 30);
    %set(legend, 'FontSize', 20);
    %set(h, 'Fontsize', 40);
    %set(g, 'Fontsize', 40);
    hold on
    plot(a,y(6),'.','Markersize', 5);
    j=xlabel('a2'); k=ylabel('z_1, z_2');
    set(gca, 'XLim',[-2.5, 2.5], 'YLim', [-2.5, 2.5], 'FontSize', 30);
    set(legend, 'FontSize', 20);
    set(j, 'Fontsize', 40);
    set(k, 'Fontsize', 40);
    box on;
end

