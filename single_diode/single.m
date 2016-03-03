function dY=single(t,Y,eps,a,d,gamma)
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

x=Y(1);
y=Y(2);
z=Y(3);
    
dY(1)=1/eps*(x-x^3/3-y); %dynamical eqations describing circuit with one tunnel diode
dY(2)=x+z-dL*y-aL;
dY(3)=1/gamma*(a-z-d*y);

