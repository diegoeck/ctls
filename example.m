clc
clear all

N=1000
M=100

Kls=[];
Ktls=[];
Kctls=[];


for i=1:M

x=randn(N,1);
y=randn(N,1);
z=2*x+3*y;

v1=randn(N,1);


xr=x+0.2*v1;
yr=y+0.3*v1;
zr=z+4*v1;

Phi=[xr yr];

kls=Phi\zr; 
Z=[Phi zr];
ktls=inv(Phi'*Phi - min(svd(Z'*Z))*eye(2))*Phi'*zr;

F=[0.2*ones(N,1) 0.3*ones(N,1) 4*ones(N,1)];
kctls=ctls(Phi,zr,F);

Kls   =[Kls   kls];
Ktls  =[Ktls  ktls];
Kctls =[Kctls kctls];

end

kls_m    =(mean(Kls'))'
ktls_m   =(mean(Ktls'))'
kctls_m  =(mean(Kctls'))'

figure(1)
title('one case')
surf([1 -1]*2,[1 -1]*2,[5 -1;1 -5]*2)
hold on
plot3(xr,yr,zr,'o')
hold off

figure(2)
plot(Kls(1,:),Kls(2,:),'o')
hold on
plot(Ktls(1,:),Ktls(2,:),'o')
plot(Kctls(1,:),Kctls(2,:),'o')
plot(kls_m(1),kls_m(2),'o')
plot(ktls_m(1),ktls_m(2),'o')
plot(kctls_m(1),kctls_m(2),'o')
plot(2,3,'o')
hold off
legend('LS','TLS','CTLS','mLS','mTLS','mCTLS','correct','Location','southeast')


