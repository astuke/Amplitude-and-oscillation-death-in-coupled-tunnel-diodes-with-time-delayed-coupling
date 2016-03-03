%set parameters
eps=19.23;
gamma=30;
rho=86;
RL=1;
d=0.01;
dL=RL/rho; 
I0=0.00122;
K=0.1306;
Vd0=0.26;
aL=RL*I0/K;

hold on
for a=[-2:0.01:2] % "a" is the nondimensional input voltage --> find fixed points as a function of input voltage
    options=optimset(@fsolve);
    options=optimset(options, 'Display', 'final');
    %solves system of equations of the form f(x)=0 which corresponds to finding the fixed points of the system
    [y, fval, exitflag]=fsolve(@(Y) [1/eps*(Y(1)-Y(1)^3/3-Y(2)), Y(1)+Y(3)-dL*Y(2)-aL, 1/gamma*(a-Y(3)-d*Y(2))],[0 0 0]);
    plot(a,y(3),'.','Markersize', 5, 'Color',[0 0 1]);
    h=xlabel('a1'); g=ylabel('z');
    set(gca, 'XLim',[-2,2], 'FontSize', 30);
    set(legend, 'FontSize', 20);
    set(h, 'Fontsize', 40);
    set(g, 'Fontsize', 40);
    box on;
end
hold on
refline(0,0)

