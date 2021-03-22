read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

first6([H1,H2,H3,H4,H5,H6|_],[H1,H2,H3,H4,H5,H6]).

addto12(Res,12,Res):-!.
addto12(Str,N,Res):-N1 is N+1,append(Str,[111],Str1),addto12(Str1,N1,Res).

pr11:-read_str(A,N),(N>10->first6(A,NewA);addto12(A,N,NewA)),name(Res,NewA),write(Res).
