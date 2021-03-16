prost(1):-!.
prost(2):-!.
prost(X):-X1 is X div 2,prost(X,X1).
prost(_,1):-!.
prost(X,I):-not( del(X,I)),I1 is I-1,prost(X,I1).

del(X,Y):-0 is X mod Y.

sum_del(1,1):-!.
sum_del(X,I):- sum_del(X,I,1,X).
sum_del(_,I,I,1):-!.
sum_del(X,I,T,W):- (del(X,W),prost(W),W1 is W-1,T1 is T+W,sum_del(X,I,T1,W1),!);(W1 is W-1,sum_del(X,I,T,W1),!).
