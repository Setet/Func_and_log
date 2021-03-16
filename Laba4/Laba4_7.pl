min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.

min_list_down([H|T],Min):-min_l_d([H|T],H,Min).
min_l_d([],Min,Min):-!.
min_l_d([H|T],Tec,Min):-min(Tec,H,Tec1),min_l_d(T,Tec1,Min).
