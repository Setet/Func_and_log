%Я хз одно ли это задание,так что
%впихну всё сюда
del(X,Y):-0 is X mod Y.
nod(X,Y,H):-nod(X,Y,H,X).
nod(X,Y,H,I):-(del(X,I),del(Y,I),H is I,!);I1 is I-1,nod(X,Y,H,I1).
prost(1):-!.
prost(2):-!.
prost(X):-X1 is X div 2,prost(X,X1).
prost(_,1):-!.
prost(X,I):-not( del(X,I)),I1 is I-1,prost(X,I1).
kol_del(1,1):-!.
kol_del(X,I):-X1 is X div 2, kol_del(X,I,2,X1).
kol_del(_,I,I,1):-!.
kol_del(X,I,T,W):- (del(X,W),W1 is W-1,T1 is T+1,kol_del(X,I,T1,W1),!);(W1 is W-1,kol_del(X,I,T,W1),!).
