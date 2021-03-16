del(X,Y):-0 is X mod Y.

prost(1):-!.
prost(2):-!.
prost(X):-X1 is X div 2,prost(X,X1).
prost(_,1):-!.
prost(X,I):-not( del(X,I)),I1 is I-1,prost(X,I1).

d_16(X):-d_16(X,1,1,O),O is 1,!.
d_16(X,Y,Z,O):-X is Y+2*Z*Z,prost(Y),O = 1.
d_16(X,Y,Z,O):-(X>=Y,Y<X,Z<X,Y1 is Y+1,Z1 is Z+1,d_16(X,Y1,Z,O1),d_16(X,Y,Z1,O2),O2+O1>0,O=1);(O = 0).

spi(X):-spi(3,X).
spi(XT,X):-prost(XT),not(d_16(X)),X=XT,!.
spi(XT,X):-XT1 is XT+1,spi(XT1,X).
