
d=0.01;

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


figure(2); clf;
for a=[-3:0.01:3]
    options=optimset(@fsolve);
    options=optimset(options, 'Display', 'final');
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

%figure(2);
%for a=[-3:0.1:3]
  %y=fsolve(@(Y) [1/eps*(Y(1)-Y(1)^3/3-Y(2)), Y(1)+Y(3)-dL*Y(2)-aL, 1/gamma*(a-Y(3)-Y(6)-d*Y(2)), 1/eps*(Y(4)-Y(4)^3/3-Y(5)), Y(4)+Y(6)-dL*Y(5)-aL, 1/gamma*(a-Y(6)-Y(3)-d*Y(5))],[0 0 0 0 0 0])
  %A=[1/epsilon*(1-y(1)^2) -1/eps 0; 1 -dL 1; 0 -d/gamma -1/gamma];
  %lambda=eig(A)
 % plot(a,y(1));
%end

%figure(2);
%hold on
%for a=[-3:0.01:3]
%    options=optimset(@fsolve);
 %   options=optimset(options, 'Display', 'final');
  %  [y, fval, exitflag]=fsolve(@(Y) [1/eps*(Y(1)-Y(1)^3/3-Y(2)), Y(1)+Y(3)-dL*Y(2)-aL, 1/gamma*(a-Y(3)-Y(6)-d*Y(2)), 1/eps*(Y(4)-Y(4)^3/3-Y(5)), Y(4)+Y(6)-dL*Y(5)-aL, 1/gamma*(a-Y(6)-Y(3)-d*Y(5))],[10 10 10 -10 -10 -10], options)
    %A=[1/epsilon*(1-y(1)^2) -1/epsilon 0; 1 -dL 1; 0 -d/gamma -1/gamma];
    %lambda=eig(A)
   % plot(a,y(6));
   % xlabel('a2'); ylabel('z2')
%end
