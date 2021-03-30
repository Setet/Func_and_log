%Мммм,ещё одно замечательное задание
read_str(10,L,L,N,N):-!.
read_str(X,L,CurL,N,CurN):-NewN is CurN+1,append(CurL,[X],NewL),get0(Y),read_str(Y,L,NewL,N,NewN).

read_string(L,N):-nl,write("input string: "),get0(X),read_str(X,L,[],N,0).

write_string([]):-!.
write_string([H|T]):-put(H),write_string(T).

list_length([],0):-!.
list_length([_|T],X):-list_length(T,CurX),X is CurX+1.

%аналог append
appendList([],X,X).
appendList([H|T1],X,[H|T2]):-appendList(T1,X,T2).

% собирает в новый список элементы до заданного номера
build_list(_,CurList,CurList,1):-!.
build_list([H|T],CurList,ResList,Num):-	appendList(CurList,[H],NewList),CurNum is Num-1,build_list(T,NewList,ResList,CurNum).
build_list(List,ResList,Num):-build_list(List,[],ResList,Num).

% собирает в новый список элементы после заданного номера (через рекурсию вниз)
build_list_after([],CurL,CurL,_):-!.
build_list_after([H|T],CurL,ResL,N):-NewN is N-1,(NewN<0 -> appendList(CurL,[H],NewL);NewL=CurL),build_list_after(T,NewL,ResL,NewN).
build_list_after(L,ResL,N):-build_list_after(L,[],ResL,N).

%удалить элемент с заданным номером
list_delete_item([_|T],CurList,ResList,CurN,CurN):-appendList(CurList,T,ResList),!.
list_delete_item([H|T],CurList,ResList,CurN,N):-appendList(CurList,[H],NewList),NewN is CurN+1,list_delete_item(T,NewList,ResList,NewN,N).
list_delete_item(List,ResList,N):-list_delete_item(List,[],ResList,1,N).

% проверить, встречаются ли элементы Sublist в List в том же порядке(из
% 4 лабы короче)
list_same_order([],_):-!.
list_same_order([H|T1],[H|T2]):-list_same_order(T1,T2),!.
list_same_order(Sublist,[_|T]):-list_same_order(Sublist,T).


% удаляет заданное количество элементов, начиная с заданного индекса
remove_word(L,L,0,_):-!.
remove_word(L,ResL,Length,I):-CurLength is Length-1,list_delete_item(L,CurL,I),remove_word(CurL,ResL,CurLength,I).

% вставить элемент на заданный индекс
insert_list(L,ResL,X,Ind):-build_list(L,L1,Ind),CurInd is Ind-1,build_list_after(L,L2,CurInd),append(L1,[X],CurL1),append(CurL1,L2,ResL).

% вставляет слово, начиная с заданной позиции
insert_word(L,L,[],_):-!.
insert_word(L,ResL,[H|T],I):-insert_list(L,CurL,H,I),CurI is I+1,insert_word(CurL,ResL,T,CurI).

% заменяет все вхождения одного слова на другое
replace_words(L,L,[],_,_):-!.
replace_words(L,ResL,[I|T],W,Length):-remove_word(L,CurL,Length,I),insert_word(CurL,NewL,W,I),replace_words(NewL,ResL,T,W,Length).

% находит все первые индексы вхождения слова
find_index_in([],[],_,_,_):-!.
find_index_in(L,InL,Word,LenW,I):-	CurLenW is LenW+1,
					build_list(L,CurWord,CurLenW),
					list_same_order(Word,CurWord),
					build_list_after(L,CurL,LenW),
					CurI is I+LenW,
					find_index_in(CurL,CurInL,Word,LenW,CurI),
					append([I],CurInL,InL),!.

find_index_in([_|T],InL,Word,LenW,I):-	CurI is I+1,find_index_in(T,InL,Word,LenW,CurI).
find_index_in(L,InL,Word):-list_length(Word,LenW),find_index_in(L,InL,Word,LenW,1).

replace_words(L,ResL,W1,W2):-find_index_in(L,InL,W1),reverse(InL,CurInL),list_length(W1,Length),replace_words(L,ResL,CurInL,W2,Length).

pr17:-read_string(L,_),

		W1=[120,97,98,99],	% xabc
		W2=[97,98,99],		% abc

replace_words(L,ResL,W1,W2),write("output modified string: "),write_string(ResL),nl,nl.
