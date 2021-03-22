read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

whofirst([H|_],H,_):-!,write("Первый X").
whofirst([H|_],_,H):-!,write("Первый W").
whofirst([],_,_):-!,write("Нема такого").
whofirst([_|T],X,W):-whofirst(T,X,W).

pr8:-read_str(A,_),whofirst(A,120,119).
