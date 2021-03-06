clc
clear all

N=1000
M=1000

Kls=[];
Ktls=[];
Kctls=[];
Kvi=[];


for i=1:M
    i

x=randn(N,1);
y=randn(N,1);
z=2*x+3*y;

v1=randn(N,1);
xr=x+0.3*v1;
yr=y+0.2*v1;
zr=z+0.4*v1;
Phi=[xr yr];

v2=randn(N,1);
xr2=x+0.3*v2;
yr2=y+0.2*v2;
zr2=z+4*v2;
Phi2=[xr2 yr2];

kls=Phi\zr; 
Z=[Phi zr];
ktls=inv(Phi'*Phi - min(svd(Z'*Z))*eye(2))*Phi'*zr;

F=[0.3*ones(N,1) 0.2*ones(N,1) 0.4*ones(N,1)];
kctls=ctls(Phi,zr,F);


kvi=(Phi'*Phi2)\(Phi'*zr2);

Kls   =[Kls   kls];
Ktls  =[Ktls  ktls];
Kctls =[Kctls kctls];
Kvi =[Kvi kvi];

end

kls_m    =(mean(Kls'))'
ktls_m   =(mean(Ktls'))'
kctls_m  =(mean(Kctls'))'
kvi_m    =(mean(Kvi'))'

figure(1)
title('one case')
surf([1 -1]*3,[1 -1]*3,[15 -3;3 -15])
hold on
plot3(xr,yr,zr,'o')
hold off

figure(2)
plot(Kvi(1,:),Kvi(2,:),'o')
hold on
plot(Kls(1,:),Kls(2,:),'o')
plot(Ktls(1,:),Ktls(2,:),'o')
plot(Kctls(1,:),Kctls(2,:),'o')
plot(kvi_m(1),kvi_m(2),'o')
plot(kls_m(1),kls_m(2),'o')
plot(ktls_m(1),ktls_m(2),'o')
plot(kctls_m(1),kctls_m(2),'o')
plot(2,3,'o')
hold off
legend('VI','LS','TLS','CTLS','mvi','mLS','mTLS','mCTLS','correct','Location','southeast')


