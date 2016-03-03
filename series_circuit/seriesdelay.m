function dY=seriesdelay(t,Y,Z)
%create arrays with delayed time Z --> specified in seriesdelaysolve.m
zlag1=Z(:,1); 
zlag2=Z(:,2);
dY=zeros(6,1);

a2=1.35;
kappa=0.08;

% physical parameters
rho=86;
RL=1;
RB=2000;  
R=kappa*RB;
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
dB=RB/rho;
d=kappa*dB;
eps=(rho*rho*Cd1)/Ld;
gamma =R*C*rho/Ld;

% 6 variables:
x1=Y(1); %voltage across internal capacitor of first TD
y1=Y(2); %current through first TD 
z1=Y(3); %voltage across external capacitor of first TD
x2=Y(4); %voltage across internal capacitor of second TD
y2=Y(5); %current through second TD 
z2=Y(6); %voltage across external capacitor of second TD

%dynamical system of two delayed coupled tunnel diodes in parallel
dY(1)=1/eps*(x1-x1^3/3-y1);
dY(2)=x1+z1-dL*y1-aL;
dY(3)=1/gamma*(a2-z1-z2-d*y1-kappa*(z1-zlag2(6))); % time-delayed coupling between z variables of the two TDs
dY(4)=1/eps*(x2-x2^3/3-y2);
dY(5)=x2+z2-dL*y2-aL;
dY(6)=1/gamma*(a2-z2-z1-d*y2-kappa*(z2-zlag1(3))); % time-delayed coupling between z variables of the two TDs
