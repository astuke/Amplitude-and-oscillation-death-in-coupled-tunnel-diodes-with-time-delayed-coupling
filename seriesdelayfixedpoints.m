d=0.01;

% physical params
rho=86;
RL=1; 
R=d*rho;
RB=2000;
I0=0.00122;
K=0.1306;
Vd0=0.27;
aL=RL*I0/K;
Ld=10^(-8);
C=56*10^(-12);
Cd1=26*10^(-12);
Cd2=1.1*Cd1;

% nondimensional params
dL=RL/rho;
dB=RB/rho;
eps=(rho*rho*Cd1)/Ld;
gamma=R*C*rho/Ld;
kappa=d/dB;

figure(3);
for a=[-2:0.01:2]
    options=optimset(@fsolve);
    options=optimset(options, 'Display', 'final');
    [y, fval, exitflag]=fsolve(@(Y) [1/eps*(Y(1)-Y(1)^3/3-Y(2)), Y(1)+Y(3)-dL*Y(2)-aL, 1/gamma*(a-Y(3)-Y(6)-d*Y(2)-kappa*(Y(3)-Y(6))), 1/eps*(Y(4)-Y(4)^3/3-Y(5)), Y(4)+Y(6)-dL*Y(5)-aL, 1/gamma*(a-Y(6)-Y(3)-d*Y(5)-kappa*(Y(6)-Y(3)))],[1 0 0 -1 0 1], options)
    plot(a,y(3),'.','Markersize', 5, 'Color', [0 0.7 0]);
    h=xlabel('a2'); g=ylabel('z_1, z_2');
    set(gca, 'XLim',[-2.5,2.5], 'YLim', [-2.5, 2.5], 'FontSize', 30,'linewidth',3);
    set(legend, 'FontSize', 20);
    set(h, 'Fontsize', 40);
    set(g, 'Fontsize', 40);
    hold on
    plot(a,y(6),'.','Markersize', 5,'Color', [0 0.7 0]);
    j=xlabel('a2'); k=ylabel('z_1, z_2');
    set(gca, 'XLim',[-2.5,2.5], 'YLim', [-2.5, 2.5], 'FontSize', 30, 'linewidth',3);
    set(legend, 'FontSize', 20);
    set(j, 'Fontsize', 40);
    set(k, 'Fontsize', 40);
    box on;
end
