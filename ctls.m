function k = ctls(Phi,y,F)

[n,m]=size(Phi);
G=trace(F'*F);
C=[Phi y];
FF=@(g) abs(max(eig(inv(G)*F'*F-inv(g)*C'*C)));
g=fminsearch(FF,1);
[A,B]=eig(inv(G)*F'*F-inv(g)*C'*C);
k=-A(1:(m),m+1)/A(m+1,m+1);
