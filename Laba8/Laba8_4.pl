read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

countNumbL([],N,N):-!.
countNumbL([H|T],CurN,N):-(H>= 54,H=<57->NewN is CurN+1;NewN is CurN),countNumbL(T,NewN,N).

allSimbNotIn(_,256):-!.
allSimbNotIn(A,N):-in_list(A,N),N1 is N+1,allSimbNotIn(A,N1),!;N1 is N+1,name(NormN,[N]),write(NormN),write(" "),allSimbNotIn(A,N1),!.

pr6:-read_str(A,_),countNumbL(A,0,N),write("Count = "),write(N).

pr12:-read_str(A,_),allSimbNotIn(A,224).
