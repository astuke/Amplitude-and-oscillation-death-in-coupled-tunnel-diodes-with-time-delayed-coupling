d=0.7;

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





%x1=Y(1);
%y1=Y(2);
%z1=Y(3);
%x2=Y(4);
%y2=Y(5);
%z2=Y(6);


%figure(1);
%hold on
%for A1=[-4:0.1:4]
 %   A2=A1;
 %   options=optimset(@fsolve);
 %   options=optimset(options, 'Display', 'final');
 %   [y, fval, exitflag]=fsolve(@(Y) [1/eps*(Y(1)-Y(1)^3/3-Y(2)), Y(1)+Y(3)-dL*Y(2)-aL, 1/gamma*(-B1*Y(3)+B*Y(6)-Y(2)*d+A1), 1/eps*(Y(4)-Y(4)^3/3-Y(5)), Y(4)+Y(6)-dL*Y(5)-aL, -B2*Y(6)+B*Y(3)-Y(5)*d+A2],[0 0 1 1 0 0], options)
 %   plot(A1,y(1))
    %legend('x1')
  %  h=xlabel('A1'); g=ylabel('x1');
  %  set(gca, 'FontSize', 20);
  %  set(legend, 'FontSize', 20);
%set(h, 'Fontsize', 20);
%set(g, 'Fontsize', 20);
 %   box on;
%end
%hold on
%refline(0,0)

%figure(2);
%hold on
%for A1=[-4:0.1:4]
 %   A2=A1;
 %   y=fsolve(@(Y) [1/eps*(Y(1)-Y(1)^3/3-Y(2)), Y(1)+Y(3)-dL*Y(2)-aL, 1/gamma*(-B1*Y(3)+B*Y(6)-Y(2)*d+A1), 1/eps*(Y(4)-Y(4)^3/3-Y(5)), Y(4)+Y(6)-dL*Y(5)-aL, -B2*Y(6)+B*Y(3)-Y(5)*d+A2],[0 0 1 1 0 0])
 %   plot(A1,y(2))
    %legend('y1')
  %  h=xlabel('A1'); g=ylabel('y1');
  %  set(gca, 'FontSize', 20);
  %  set(legend, 'FontSize', 20);
%set(h, 'Fontsize', 20);
%set(g, 'Fontsize', 20);
 %   box on;
%end
%hold on
%refline(0,0)


figure(4); clf;
hold on
for A1=[-0.5:0.001:0.5]
    A2=A1;
    options=optimset(@fsolve);
    options=optimset(options, 'Display', 'final');
    [y, fval, exitflag]=fsolve(@(Y) [1/eps*(Y(1)-Y(1)^3/3-Y(2)), Y(1)+Y(3)-dL*Y(2)-aL, 1/gamma*(-B1*Y(3)+B*Y(6)-Y(2)*d+A1), 1/eps*(Y(4)-Y(4)^3/3-Y(5)), Y(4)+Y(6)-dL*Y(5)-aL, -B2*Y(6)+B*Y(3)-Y(5)*d+A2],[0 0 1 1 0 0], options)
     plot(A1,y(3),'.','Markersize', 5, 'LineWidth',3)
    %legend('z1')
    h=xlabel('A'); g=ylabel('z_1, z_2');
    set(gca, 'FontSize', 30, 'linewidth', 3, 'XLim', [-0.5, 0.5], 'XTick', -0.5:0.1:0.5, 'YLim', [-2, 2]);
    set(legend, 'FontSize', 30);
set(h, 'Fontsize', 40);
set(g, 'Fontsize', 40);
    box on;
end
hold on


