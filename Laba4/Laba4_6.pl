min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.

min_list_up([],9999):-!.
min_list_up([H|List],Min):-min_list_up(List,NewMin),min(NewMin,H,Min).
