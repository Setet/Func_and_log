read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

excchanger([H1,H2,H3|T],Ch):-(H1 is 97,H2 is 98,H3 is 99->append([119,119,119],T,Ch);append([H1,H2,H3|T],[122,122,122],Ch)).

pr10:-read_str(A,_),excchanger(A,ChA),name(NormA,ChA),write(NormA).
