max(X,Y,X):-X>Y,!.
max(_,Y,Y):-!.
max(X,Y,Z,U):-max(X,Y,T),max(T,Z,U).

posled(I):-posled(1,250000,X),posled(250000,500000,Y),posled(500000,750000,Z),max(X,Y,Z,I1),posled(750000,1000000,I2),max(I1,I2,I).



posled(X,T,I):-posled(X,T,I,0).
posled(X,X,I,It):-I = It,!.
posled(X,T,I,It):-d_13(X,Y,0),(It<Y->I1 = Y;I1 = It),X1 is X+1,posled(X1,T,I,I1).
d_13(1,K,Kt):-K is Kt +1,!.
d_13(X,K,Kt):-0 is X mod 2 ->(K1 is Kt+1,X1 is X/2,d_13(X1,K,K1),! );(K1 is Kt+1,X1 is X*3+1,d_13(X1,K,K1),!).
