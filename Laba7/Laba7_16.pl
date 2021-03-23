wordChanger([H2,H3,H4],I,Res):-append(I,[H2,H3,H4],Res),!.
wordChanger([],Res,Res):-!.
wordChanger([H1,H2,H3,H4|T],I,Res):-wordCheck(H1,H2,H3,H4)->append(I,[108,101,116,116,101,114],I1),wordChanger(T,I1,Res);append(I,[H1],I1),wordChanger([H2,H3,H4|T],I1,Res).

wordCheck(H1,H2,H3,H4):-H1 =:= 119,H2 =:= 111,H3 =:= 114,H4 =:= 100.

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

pr16:-read_str(A,_),wordChanger(A,[],Res),name(NewA,Res),write(NewA).
