
d=0.06;

% physical params
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

% nondimensional params
dL=RL/rho;
eps=(rho*rho*Cd1)/Ld;
gamma=R*C*rho/Ld;

figure(21); clf;
hold on
for a=[-3:0.01:3]
    y=fsolve(@(Y) [1/eps*(Y(1)-Y(1)^3/3-Y(2)), Y(1)+Y(3)-dL*Y(2)-aL, 1/gamma*(a-Y(3)-Y(6)-d*Y(2)), 1/eps*(Y(4)-Y(4)^3/3-Y(5)), Y(4)+Y(6)-dL*Y(5)-aL, 1/gamma*(a-Y(6)-Y(3)-d*Y(5))],[1 0 0 1 0 0])
    A=[1/eps*(1-y(1)^2) -1/eps 0 0 0 0; 1 -dL 1 0 0 0; 0 -d/gamma -1/gamma 0 0 -1/gamma; 0 0 0 1/eps*(1-y(4)^2) -1/eps 0; 0 0 0 1 -dL 1; 0 0 -1/gamma 0 -d/gamma -1/gamma];
    lambda=eig(A)
    plot(a,lambda,'.','Markersize', 5);
    xlabel('a2'); ylabel('Re(lambda)')
    set(gca,'XLim', [-3, 3], 'YLim',[-0.1, 0.05],'FontSize', 30);
    box on;
end
hold on
refline(0,0)
