eps=19.23;
gamma=30;
rho=86;
RL=1;
d=0.65;
dL=RL/rho; 
I0=0.00122;
K=0.1306;
aL=RL*I0/K;

figure(14);
hold on
for a=[-2:0.01:2]
    y=fsolve(@(Y) [1/eps*(Y(1)-Y(1)^3/3-Y(2)), Y(1)+Y(3)-dL*Y(2)-aL, 1/gamma*(a-Y(3)-d*Y(2))],[1 0 0])
    A=[1/eps*(1-y(1)^2) -1/eps 0; 1 -dL 1; 0 -d/gamma -1/gamma];
    lambda=eig(A)
    plot(a,lambda,'.','Markersize', 15);
    xlabel('a1'); ylabel('Re(lambda)')
    set(gca,'FontSize', 30);
    box on;
end
hold on;
refline(0,0);
