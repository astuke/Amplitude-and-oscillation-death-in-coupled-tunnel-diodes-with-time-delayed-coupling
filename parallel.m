function dY=parallel(t,Y)
dY=zeros(6,1);

A1=0;
A2=A1;


% physical parameters
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
Cd2=1.03*Cd1
R=d*rho;

% nondimensional params
d=0.12;
d1=R1/rho;
d2=R2/rho;
dL=RL/rho;
aL=RL*I0/K;
eps1=(rho*rho*Cd1)/Ld;
eps2=(rho*rho*Cd2)/Ld;
gamma=R*C*rho/Ld;
D=d1*d2+d*d1+d*d2;
B=d^2/D;
B1=(d*(d+d2))/D;
B2=(d*(d+d1))/D;
V0=((A1+(I0*R)/K)*K*D)/(d*d2)+Vd0;

x1=Y(1);
y1=Y(2);
z1=Y(3);
x2=Y(4);
y2=Y(5);
z2=Y(6);

%dynamical system of two tunnel diodes coupld in parallel
dY(1)=1/eps1*(x1-x1^3/3-y1);
dY(2)=x1+z1-dL*y1-aL;
dY(3)=1/gamma*(-B1*z1+B*z2-y1*d+A1);
dY(4)=1/eps2*(x2-x2^3/3-y2);
dY(5)=x2+z2-dL*y2-aL;
dY(6)=1/gamma*(-B2*z2+B*z1-y2*d+A2);
