read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

countsimb([],N,N,_):-!.
countsimb([H|T],I,N,Simb):-(H=:=Simb -> NI is I+1,countsimb(T,NI,N,Simb));countsimb(T,I,N,Simb).

pr7:-read_str(A,_),name(+,Pl),name(-,Mi),name(0,Ze),countsimb(A,0,NPl,Pl),countsimb(A,0,NMi,Mi),countsimb(A,0,NZe,Ze),Sum is NPl+NMi+NZe,write("Count = "),write(Sum).
