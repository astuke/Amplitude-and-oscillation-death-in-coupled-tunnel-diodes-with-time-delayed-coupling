function dY=series(t,Y,eps,a,d,gamma) %solve with seriessolve.m
dY=zeros(6,1); 

% physical parameters
a2=0;
d=0.57;
rho=86;
RL=1; 
R=d*rho
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
eps=(rho*rho*Cd1)/Ld;
gamma =R*C*rho/Ld;

%6 variables (3 for each tunnel diode):
x1=Y(1); %voltage across internal capacitor of first TD
y1=Y(2); %current through first TD 
z1=Y(3); %voltage across external capacitor of first TD
x2=Y(4); %voltage across internal capacitor of second TD
y2=Y(5); %current through second TD 
z2=Y(6); %voltage across external capacitor of second TD

%dynamical system of two tunnel diodes coupled in series   
dY(1)=1/eps*(x1-x1^3/3-y1);
dY(2)=x1+z1-dL*y1-aL;
dY(3)=1/gamma*(a2-z1-z2-d*y1);
dY(4)=1/eps*(x2-x2^3/3-y2);
dY(5)=x2+z2-dL*y2-aL;
dY(6)=1/gamma*(a2-z2-z1-d*y2);
