readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X),append(CurL,[X],CurL1),rList(N,I1,CurL1,L).

list_el_numb([H|_],H,0):-!.
list_el_numb([_|List],Elem,Numb):-list_el_numb(List,Elem,NewNumb),Numb is NewNumb+1.

read_list_el(N):-
    write("List: "),readList(N,List),nl,
    write("Element: "),read(Elem),nl,
    write("Number: "),list_el_numb(List,Elem,X),
    write(X),nl,false.
