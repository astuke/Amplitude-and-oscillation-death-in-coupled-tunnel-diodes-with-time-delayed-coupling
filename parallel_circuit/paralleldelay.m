function dY=paralleldelay(t,Y,Z)

%create array with delayed time Z --> specified in seriesdelaysolve.m
zlag1=Z(:,1);
zlag2=Z(:,2);
dY=zeros(6,1);

A=-0.098;
d=0.12;

% physical parameters
R1=8;
R2=8;
RL=1;
RB=2000;
rho=86;
R=d*rho;
I0=0.00122;
K=0.1306;
Vd0=0.27;
aL=RL*I0/K;
Ld=10^(-8);
C=56*10^(-12);
Cd1=26*10^(-12);
Cd2=1.2*Cd1;

% non dimensional parameters
d1=R1/rho;
d2=R2/rho;
dL=RL/rho;
dB=RB/rho;
kappa=d/dB;
eps=(rho*rho*Cd1)/Ld;
gamma =R*C*rho/Ld;
D=d1*d2+d*d1+d*d2;
B=d^2/D;
B1=(d*(d+d2))/D;
B2=(d*(d+d1))/D;
V0=(A+(I0*R)/(K))/(d*d2)*K*D+Vd0

% 6 variables:
x1=Y(1); %voltage across internal capacitor of first TD
y1=Y(2); %current through first TD 
z1=Y(3); %voltage across external capacitor of first TD
x2=Y(4); %voltage across internal capacitor of second TD
y2=Y(5); %current through second TD 
z2=Y(6); %voltage across external capacitor of second TD

%dynamical system of two delayed coupled tunnel diodes in series   
dY(1)=1/eps*(x1-x1^3/3-y1); 
dY(2)=x1+z1-dL*y1-aL; 
dY(3)=1/gamma*(-B1*z1+B*z2-y1*d+A+kappa*(zlag2(6)-z1));  % time-delayed coupling between z variables of the two TDs
dY(4)=1/eps*(x2-x2^3/3-y2);
dY(5)=x2+z2-dL*y2-aL;
dY(6)=1/gamma*(-B2*z2+B*z1-y2*d+A+kappa*(zlag1(3)-z2)); % time-delayed coupling between z variables of the two TDs
