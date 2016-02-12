function dY=parallel(t,Y)
dY=zeros(6,1);

A1=0;
A2=A1;
%V0=0.37;

d=0.12;

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
Cd2=1.03*Cd1
R=d*rho;

% nondimensional params
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



V0=((A1+(I0*R)/K)*K*D)/(d*d2)+Vd0
%A1=(d*d2*(V0-Vd0))/(K*D)-I0*R/K
%A2=A1;


%
% Physical params

%R = 10;
%R1 = 8;
%R2 = R1;

%V0 = 1/1000 * 300;
%Vd0 = 0.26;
%K = 0.1306;
%I0 = 1.22 * 10^(-3);
%rho = 86;
%Ld = 10 * 10^(-9);
%Cd = 26 * 10^(-12);

%RL = 1;
%C = 56 * 10^(-12);

% Non dimensional params

%eps = rho * rho * Cd / Ld;
%gamma = R * C * rho / Ld;
%d = R / rho;
%d1 = R1 / rho;
%d2 = R2 / rho;
%dL = RL / rho;
%aL = RL * I0 / K;
%D = d * d1 + d * d2 + d1 * d2;
%B = I0 * R / K;
%A1 = d * d2 * (V0 - Vd0) / (D * K);
%A2 = d * d1 * (V0 - Vd0) / (D * K);
%E = d * d / D;
%E1 = d * (d + d2) / D;
%E2 = d * (d + d1) / D;
%C1 = A1 - B;
%C2 = A2 - B;


x1=Y(1);
y1=Y(2);
z1=Y(3);
x2=Y(4);
y2=Y(5);
z2=Y(6);

[eps1 eps2  dL  aL  gamma   B1 B2  B   d  A1]
[x1 y1 z1 x2 y2 z2]

dY(1)=1/eps1*(x1-x1^3/3-y1);
dY(2)=x1+z1-dL*y1-aL;
dY(3)=1/gamma*(-B1*z1+B*z2-y1*d+A1);
dY(4)=1/eps2*(x2-x2^3/3-y2);
dY(5)=x2+z2-dL*y2-aL;
dY(6)=1/gamma*(-B2*z2+B*z1-y2*d+A2);
