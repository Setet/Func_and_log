%Задание просто 12/10
%Коментов много потому что
%надо
read_str(10,L,L,N,N):-!.
read_str(X,L,CurL,N,CurN):-NewN is CurN+1,append(CurL,[X],NewL),get0(Y),read_str(Y,L,NewL,N,NewN).

read_string(L,N):-nl,write("input string: "),get0(X),read_str(X,L,[],N,0).

% вывод строки через список ASCII кодов символов(мой класичекий вывод
% поехал кукухой и не захотел работать,пришлось реализовывать через
% костыли)
write_string([]):-!.
write_string([H|T]):-put(H),write_string(T).

write_strings([]):-!.
write_strings([H|T]):-write_string(H),nl,write_strings(T).

% аналог append
appendList([],X,X).
appendList([H|T1],X,[H|T2]):-appendList(T1,X,T2).

%
list_el_numb([],_,_,_):-fail,!.
list_el_numb([H|_],H,CurNum,CurNum):-!.
list_el_numb([_|T],Elem,CurNum,Num):-NewNum is CurNum+1,list_el_numb(T,Elem,NewNum,Num).
list_el_numb(List,Elem,Num):-list_el_numb(List,Elem,1,Num).

% собирает в новый список элементы до заданного номера
build_list(_,CurList,CurList,1):-!.
build_list([H|T],CurList,ResList,Num):-	appendList(CurList,[H],NewList),CurNum is Num-1,build_list(T,NewList,ResList,CurNum).
build_list(List,ResList,Num):-build_list(List,[],ResList,Num).

% собирает в новый список элементы после заданного номера (через рекурсию вниз)
build_list_after([],CurL,CurL,_):-!.
build_list_after([H|T],CurL,ResL,N):-NewN is N-1,(NewN<0 -> appendList(CurL,[H],NewL);NewL=CurL),build_list_after(T,NewL,ResL,NewN).
build_list_after(L,ResL,N):-build_list_after(L,[],ResL,N).

pr21:-read_string(L,_),read_string(Seps,_),words_by_seps(L,Seps,Words),nl,writeln("words of string:"),write_strings(Words),nl.

% разбивает строку на слова через заданные разделители
words_by_seps([],_,Words,Words):-!.
words_by_seps(L,[Sep|T],Words,CurWords):-list_el_numb(L,Sep,SepI),build_list(L,Word,SepI),append(CurWords,[Word],NewWords),build_list_after(L,CurL,SepI),words_by_seps(CurL,T,Words,NewWords),!.

words_by_seps(L,_,Words,CurWords):-append(CurWords,[L],Words).
words_by_seps(L,Seps,Words):-words_by_seps(L,Seps,Words,[]).

pr22:-read_string(L,Length),(Length>=2 ->list_el_numb(L,First,1),list_el_numb(L,Last,Length),nl,write("first character: "),put(First),nl,write("last character: "),put(Last),(1 is Length mod 2 ->I is (Length div 2)+1,list_el_numb(L,Middle,I),nl,write("middle character: "),put(Middle),nl,nl;nl,writeln("middle character: *missing*"),nl);writeln("failure: string must contain at least 2 characters!"),nl).
