read_str(10,L,L,N,N):-!.
read_str(X,L,CurL,N,CurN):-NewN is CurN+1,append(CurL,[X],NewL),get0(Y),read_str(Y,L,NewL,N,NewN).

read_string(L,N):-nl,write("input string: "),get0(X),read_str(X,L,[],N,0).

write_string([]):-!.
write_string([H|T]):-put(H),write_string(T).

list_el_numb([],_,_,_):-fail,!.
list_el_numb([H|_],H,CurNum,CurNum):-!.
list_el_numb([_|T],Elem,CurNum,Num):-NewNum is CurNum+1,list_el_numb(T,Elem,NewNum,Num).
list_el_numb(List,Elem,Num):-list_el_numb(List,Elem,1,Num).

% проверить, встречаются ли элементы Sublist в List в том же порядке(из
% 4 лабы короче)
list_same_order([],_):-!.
list_same_order([H|T1],[H|T2]):-list_same_order(T1,T2),!.
list_same_order(Sublist,[_|T]):-list_same_order(Sublist,T).

% собирает в новый список элементы до заданного номера
build_list(_,CurList,CurList,1):-!.
build_list([H|T],CurList,ResList,Num):-	appendList(CurList,[H],NewList),CurNum is Num-1,build_list(T,NewList,ResList,CurNum).
build_list(List,ResList,Num):-build_list(List,[],ResList,Num).

% собирает в новый список элементы после заданного номера (через рекурсию вниз)
build_list_after([],CurL,CurL,_):-!.
build_list_after([H|T],CurL,ResL,N):-NewN is N-1,(NewN<0 -> appendList(CurL,[H],NewL);NewL=CurL),build_list_after(T,NewL,ResL,NewN).
build_list_after(L,ResL,N):-build_list_after(L,[],ResL,N).

%аналог append
appendList([],X,X).
appendList([H|T1],X,[H|T2]):-appendList(T1,X,T2).

%удалить элемент с заданным номером
list_delete_item([_|T],CurList,ResList,CurN,CurN):-appendList(CurList,T,ResList),!.
list_delete_item([H|T],CurList,ResList,CurN,N):-appendList(CurList,[H],NewList),NewN is CurN+1,list_delete_item(T,NewList,ResList,NewN,N).
list_delete_item(List,ResList,N):-list_delete_item(List,[],ResList,1,N).

list_length([],0):-!.
list_length([_|T],X):-list_length(T,CurX),X is CurX+1.

% вставить элемент на заданный индекс
insert_list(L,ResL,X,Ind):-build_list(L,L1,Ind),CurInd is Ind-1,build_list_after(L,L2,CurInd),append(L1,[X],CurL1),append(CurL1,L2,ResL).

% находит все первые индексы вхождения слова
find_index([],[],_,_,_):-!.
find_index(L,InL,Word,LenW,I):-CurLenW is LenW+1,build_list(L,CurWord,CurLenW),list_same_order(Word,CurWord),build_list_after(L,CurL,LenW),CurI is I+LenW,find_index(CurL,CurInL,Word,LenW,CurI),append([I],CurInL,InL),!.

find_index([_|T],InL,Word,LenW,I):-CurI is I+1,find_index(T,InL,Word,LenW,CurI).
find_index(L,InL,Word):-list_length(Word,LenW),find_index(L,InL,Word,LenW,1).

remove_word(L,L,0,_):-!.
remove_word(L,ResL,Length,I):-CurLength is Length-1,list_delete_item(L,CurL,I),remove_word(CurL,ResL,CurLength,I).

% вставляет слово, начиная с заданной позиции
insert_word(L,L,[],_):-!.
insert_word(L,ResL,[H|T],I):-insert_list(L,CurL,H,I),CurI is I+1,insert_word(CurL,ResL,T,CurI).

% заменяет все вхождения одного слова на другое
replace_words(L,L,[],_,_):-!.
replace_words(L,ResL,[I|T],W,Length):-remove_word(L,CurL,Length,I),insert_word(CurL,NewL,W,I),replace_words(NewL,ResL,T,W,Length).

% прооверяет находится ли после слов цифра
% *есть индексы вхождения слова*
find_word_dig(_,[],[],_):-!.
find_word_dig(L,[I|T],CurInL,LenW):-CurI is I+LenW,list_el_numb(L,Elem,CurI),Elem>=48,Elem=<57,find_word_dig(L,T,NewInL,LenW),append([I],NewInL,CurInL),!.
find_word_dig(L,[_|T],CurInL,LenW):-find_word_dig(L,T,CurInL,LenW).

% удаляет каждое слово X, после которого следует цифра
remove_word_by_dig(L,ResL,Word):-find_index(L,InL,Word),list_length(Word,LenW),find_word_dig(L,InL,CurInL,LenW),reverse(CurInL,NewInL),replace_words(L,ResL,NewInL,[],LenW).

pr18:-read_string(L,_),

		W=[97,98,99], %a,b,c

remove_word_by_dig(L,ResL,W),write("output modified string: "),write_string(ResL),nl,nl.
