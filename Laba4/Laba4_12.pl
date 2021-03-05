delet_num([_|T],0,T):-!.
delet_num([H|T],N,[H|T1]):-N1 is N-1,delet_num(T,N1,T1).
