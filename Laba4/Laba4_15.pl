delet_all([],_,[]):-!.
delet_all([H|T],El,[H|T1]):-H=\=El,delet_all(T,El,T1),!.
delet_all([_|T],El,T1):-delet_all(T,El,T1).

make_this([],[]):-!.
make_this([H|T],[H|T1]):-delet_all([H|T],H,New),make_this(New,T1).
