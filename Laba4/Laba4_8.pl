readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X),append(CurL,[X],CurL1),rList(N,I1,CurL1,L).

min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.

min_list_up([],9999):-!.
min_list_up([H|List],Min):-min_list_up(List,NewMin),min(NewMin,H,Min).

read_min_elem_list(N):-
    write("List: "),readList(N,List),nl,
    write("Min elem =: "),min_list_up(List,X),
    write(X),nl,false.
