countnumb([],N,N):-!.
countnumb([H|T],CurN,N):-(H>= 48,H=<57->NewN is CurN+1;NewN is CurN),countnumb(T,NewN,N).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

pr14:-read_str(A,_),countnumb(A,0,N),write("Count = "),write(N).
