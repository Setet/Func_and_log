readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X),append(CurL,[X],CurL1),rList(N,I1,CurL1,L).

sum_list_up([],0):-!.
sum_list_up([H|List],Sum):-sumListUp(List,SumNew),Sum is SumNew + H.

read_sum_List(N):-
    readList(N,L),
    sum_list_up(L,Sum),
    nl, write("Sum = "),write(Sum),nl,fail.


