read_str(10,L,L,N,N):-!.
read_str(X,L,CurL,N,CurN):-NewN is CurN+1,append(CurL,[X],NewL),get0(Y),read_str(Y,L,NewL,N,NewN).

read_string(L,N):-nl,write("input string: "),get0(X),read_str(X,L,[],N,0).

write_string([]):-!.
write_string([H|T]):-put(H),write_string(T).

%вычленяем слово в начале строки
get_word([],[],[]):-!.
get_word(L,NewL,Word):-get_word(L,NewL,Word,[]).

get_word([],[],Word,Word).
get_word([32|T],T,Word,Word):-!.
get_word([H|T],NewL,Word,CurWord):-append(CurWord,[H],NewWord),get_word(T,NewL,Word,NewWord).

%убираем пробелы в начале строки
skip_spaces([32|T],NewL):-skip_spaces(T,NewL),!.
skip_spaces(L,L).


%собираем список из слов
get_words([],Words,Words,C,C):-!.
get_words(L,Words,CurWords,C,CurC):-skip_spaces(L,CurL),get_word(CurL,NewL,Word),Word \=[],NewC is CurC+1,append(CurWords,[Word],NewWords),get_words(NewL,Words,NewWords,C,NewC),!.
get_words(_,Words,Words,C,C).
get_words(L,Words,Count):-get_words(L,Words,[],Count,0).


%удаляем все лишние пробелы
remove_spaces(L,ResL):-	get_words(L,Words,_),build_string(Words,CurResL),skip_spaces(CurResL,ResL).

%вставляем между словами один пробел,
%остаётся лишний пробел в начале
build_string([],[]):-!.
build_string([H|T],ResL):-build_string(T,CurResL),append([32],H,CurH),append(CurH,CurResL,ResL).

pr20:-read_string(L,_),remove_spaces(L,ResL),write("output modified string: "),write_string(ResL),nl,nl.
