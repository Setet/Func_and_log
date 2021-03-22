read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

writentime(_,N,N):-!.
writentime(List,I,N):-write_str(List),write(" "),NI is I+1,writentime(List,NI,N).

pr9:-write("Строка 1 "),read_str(A,NA),write("Строка 2 "),read_str(B,NB),(NB > NA -> N is NB-NA, writentime(B,0,N);N is NA-NB,writentime(A,0,N)).
