function dY=paralleldelay(t,Y,Z)
zlag1=Z(:,1);
zlag2=Z(:,2);
dY=zeros(6,1);

A=-0.098;
d=0.12;
%V0=0.16;

% physical params
R1=8;
R2=8;
RL=1;
RB=2000;
rho=86;
%R=kappa*RB;
R=d*rho;
I0=0.00122;
K=0.1306;
Vd0=0.27;
aL=RL*I0/K;
Ld=10^(-8);
C=56*10^(-12);
Cd1=26*10^(-12);
Cd2=1.2*Cd1;

% non dimensional params
d1=R1/rho;
d2=R2/rho;
dL=RL/rho;
dB=RB/rho;
%d=kappa*dB;
kappa=d/dB;
eps=(rho*rho*Cd1)/Ld;
gamma =R*C*rho/Ld;
D=d1*d2+d*d1+d*d2;
B=d^2/D;
B1=(d*(d+d2))/D;
B2=(d*(d+d1))/D;
%A=(d*d2*(V0-Vd0))/(K*D)-I0*R/K
%V0=((K*D)/(d*d2))*((A+(I0*d*rho))/K)+Vd0
%V0=(K*D*A)/(d*d2)+(D*I0*rho)/d2+Vd0
V0=(A+(I0*R)/(K))/(d*d2)*K*D+Vd0



x1=Y(1);
y1=Y(2);
z1=Y(3);
x2=Y(4);
y2=Y(5);
z2=Y(6);

[eps    dL   aL   gamma   B1   B   d   A kappa]

[x1 y1 z1 x2 y2 z2];

dY(1)=1/eps*(x1-x1^3/3-y1);
dY(2)=x1+z1-dL*y1-aL;
dY(3)=1/gamma*(-B1*z1+B*z2-y1*d+A+kappa*(zlag2(6)-z1));
dY(4)=1/eps*(x2-x2^3/3-y2);
dY(5)=x2+z2-dL*y2-aL;
dY(6)=1/gamma*(-B2*z2+B*z1-y2*d+A+kappa*(zlag1(3)-z2));
