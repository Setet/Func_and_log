abc([]):-!.
abc([H|_]):-H=\=97,H=\=98,H\=99,!,fail.
abc([_|T]):-abc(T).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

pr15:-read_str(A,_),abc(A).
