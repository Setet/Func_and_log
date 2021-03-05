min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.

minLD([],Min,Min):-!.
minLD([H|L],CurMin,Min):-min(CurMin,H,NewCurMin),minLD(L,NewCurMin,Min).

min_list_down(List,Min):-minLD(List,9999,Min).
