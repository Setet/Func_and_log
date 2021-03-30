read_str(10,L,L,N,N):-!.
read_str(X,L,CurL,N,CurN):-NewN is CurN+1,append(CurL,[X],NewL),get0(Y),read_str(Y,L,NewL,N,NewN).

read_string(L,N):-nl,write("input string: "),get0(X),read_str(X,L,[],N,0).

%аналог append
appendList([],X,X).
appendList([H|T1],X,[H|T2]):-appendList(T1,X,T2).

list_length([],0):-!.
list_length([_|T],X):-list_length(T,CurX),X is CurX+1.

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

% находит все первые индексы вхождения слова
find_index([],[],_,_,_):-!.
find_index(L,InL,Word,LenW,I):-CurLenW is LenW+1,build_list(L,CurWord,CurLenW),list_same_order(Word,CurWord),build_list_after(L,CurL,LenW),CurI is I+LenW,find_index(CurL,CurInL,Word,LenW,CurI),append([I],CurInL,InL),!.

find_index([_|T],InL,Word,LenW,I):-CurI is I+1,find_index(T,InL,Word,LenW,CurI).
find_index(L,InL,Word):-list_length(Word,LenW),find_index(L,InL,Word,LenW,1).

pr19:-	read_string(L,_),

		W=[97,98,97],

find_index(L,InL,W),list_length(InL,Count),write("number of occurrences 'aba': "),write(Count),nl.
