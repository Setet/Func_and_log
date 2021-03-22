reverse(A, Z):-reverse(A,Z,[]).
reverse([],Z,Z).
reverse([H|T],Z,Acc):-reverse(T,Z,[H|Acc]).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

numSimbLast([],_,_):-!.
numSimbLast([El|T],El,I):-write(I),write(" "),NI is I+1,numSimbLast(T,El,NI),!.
numSimbLast([_|T],El,I):-NI is I+1,numSimbLast(T,El,NI),!.

pr5:-read_str(A,_),reverse(A,[H|_]),numSimbLast(A,H,0),!.
