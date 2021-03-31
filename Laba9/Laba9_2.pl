write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

two_a(_,0,Perm1):-count(a,Perm1,N),(N=:=2->write_str(Perm1),nl,!,fail;!,fail).
two_a(A,N,Perm):-in_list(A,El),N1 is N-1,two_a(A,N1,[El|Perm]).

count(_, [], 0):-!.
count(Elem, List, X):- count(Elem, List, 0, X).
count(_, [], Count, Count):- !.
count(Elem, [Elem|T], Count,X):- Count1 is Count + 1,count(Elem, T, Count1, X), !.
count(Elem, [_|T], Count, X):- count(Elem, T, Count, X).

pr2:-tell('C:/Users/User/Desktop/Func_and_Log/Laba9/Prolog2.txt'),two_a([a,b,c,d,e,f],5,[]),told.
