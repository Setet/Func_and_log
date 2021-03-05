delet_all([],_,[]):-!.
delet_all([H|T],El,[H|T1]):-H=\=El,delet_all(T,El,T1),!.
delet_all([_|T],El,T1):-delet_all(T,El,T1).
