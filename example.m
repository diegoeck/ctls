clc

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
zr=z+0.4*v1;

Phi=[xr yr];

kls=Phi\zr; 
ktls=inv(Phi'*Phi - min(svd(Z'*Z))*eye(2))*Phi'*zr;

F=[0.2*ones(N,1) 0.3*ones(N,1) 0.4*ones(N,1)];
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
plot(K1(1,:),K1(2,:),'o')
plot(kmls(1),kmls(2),'o')
plot(kmtls(1),kmtls(2),'o')
plot(km1(1),km1(2),'o')
plot(2,3,'o')
hold off
legend('LS','TLS','CTLS','mLS','mTLS','mCTLS','correct','Location','southeast')


