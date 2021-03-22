r_str_f(-1,A,A,N,N,1):-!.
r_str_f(10,A,A,N,N,0):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).
read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

pr1:-read_str_f(A,X,0),write_str(A),write(" , "),write_str(A),write(" , "),write_str(A),write(" , "),write(X).
