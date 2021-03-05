list_el_numb([H|_],H,0):-!.
list_el_numb([_|List],Elem,Numb):-list_el_numb(List,Elem,NewNumb),Numb is NewNumb+1.
