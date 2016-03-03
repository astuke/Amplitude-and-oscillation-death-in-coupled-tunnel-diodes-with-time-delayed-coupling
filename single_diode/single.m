function dY=singlediode(t,Y,eps,a,d,gamma) %solve with singesolve.m
dY=zeros(3,1); 
%parameters
a=0;
rho=86;
RL=1;
d=0.57;
dL=RL/rho;
gamma=30;
eps=19.23;
I0=0.00122;
K=0.1306;
aL=RL*I0/K;

%the system has 3 variables:
x=Y(1); %voltage across internal capacitance
y=Y(2); %current through tunnel diode
z=Y(3); %voltage across external capacitor

%dynamical eqations describing circuit of one tunnel diode
dY(1)=1/eps*(x-x^3/3-y); 
dY(2)=x+z-dL*y-aL;
dY(3)=1/gamma*(a-z-d*y);

