read_str(10,L,L,N,N):-!.
read_str(X,L,CurL,N,CurN):-NewN is CurN+1,append(CurL,[X],NewL),get0(Y),read_str(Y,L,NewL,N,NewN).

read_string(L,N):-nl,write("input string: "),get0(X),read_str(X,L,[],N,0).

write_string([]):-!.
write_string([H|T]):-put(H),write_string(T).

% хз что даже писать здесь,задача как по мне на фоне следующих
% тривиальна так что...
replace_even([],L,L,_):-!.
replace_even([H|T],CurL,ResL,I):-CurI is I+1,1 is CurI mod 2,append(CurL,[H],NewL),replace_even(T,NewL,ResL,CurI),!.

replace_even([H|T],CurL,ResL,I):-CurI is I+1,H \= 97,H \= 98,append(CurL,[97],NewL),replace_even(T,NewL,ResL,CurI),!.

replace_even([_|T],CurL,ResL,I):-CurI is I+1,append(CurL,[99],NewL),replace_even(T,NewL,ResL,CurI).

replace_even(L,ResL):-replace_even(L,[],ResL,0).

pr13:-read_string(L,_),replace_even(L,ResL),write("output modified string: "),write_string(ResL),nl,nl.
