readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X),append(CurL,[X],CurL1),rList(N,I1,CurL1,L).

min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.

min_list_down([H|T],Min):-min_l_d([H|T],H,Min).
min_l_d([],Min,Min):-!.
min_l_d([H|T],Tec,Min):-min(Tec,H,Tec1),min_l_d(T,Tec1,Min).

read_min_elem_list(N):-
    write("List: "),readList(N,List),nl,
    write("Min elem = "),min_list_down(List,X),
    write(X),nl,false.
