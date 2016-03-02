d=0.45;

% physical params
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

% nondimensional params
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
kappa=d/dB;





%x1=Y(1);
%y1=Y(2);
%z1=Y(3);
%x2=Y(4);
%y2=Y(5);
%z2=Y(6);

figure(14); clf;
hold on
for A=[-0.2:0.001:0.2]
    y=fsolve(@(Y) [1/eps1*(Y(1)-Y(1)^3/3-Y(2)), Y(1)+Y(3)-dL*Y(2)-aL, 1/gamma*(-B1*Y(3)+B*Y(6)-Y(2)*d+A), 1/eps2*(Y(4)-Y(4)^3/3-Y(5)), Y(4)+Y(6)-dL*Y(5)-aL, -B2*Y(6)+B*Y(3)-Y(5)*d+A],[0 0 1 1 0 0])
    J=[1/eps*(-y(1)^2+1) -1/eps 0 0 0 0; 1 -dL 1 0 0 0; 0 -d/gamma -B1/gamma 0 0 B/gamma; 0 0 0 1/eps*(-y(4)^2+1) -1/eps 0; 0 0 0 1 -dL 1; 0 0 B/gamma 0 -d/gamma -B2/gamma];
    lambda=eig(J)
    plot(A,lambda,'.','Markersize', 15)
    %legend('lambda1', 'lambda2', 'lambda3', 'lambda4', 'lambda5', 'lambda6')
   h=xlabel('A'); g=ylabel('Re(lambda)');
   set(gca, 'XLim', [-0.2, 0.2], 'XTick', -0.2:0.1:0.2,'FontSize', 30,'linewidth', 3);
    box on;
end
hold on
refline(0,0)
refline(0,0)




