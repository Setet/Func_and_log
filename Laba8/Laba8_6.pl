read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,1):-!.
r_str_f(10,A,A,N,N,0):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List):-read_str_f(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-read_str_f(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

skip_space([32|Tail],New_Str):-skip_space(Tail,New_Str),!.
skip_space(New_Str,New_Str).

get_word([],[],[]):-!.
get_word(Str,Word,New_Str_after_word):-get_word(Str,[],Word,New_Str_after_word).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,New_Str_after_word):-append(W,[H],W1),get_word(T,W1,Word,New_Str_after_word).

get_words(A,Words):-get_words(A,[],Words).

get_words([],List_words,List_words):-!.
get_words(Str,Words,List_words):-skip_space(Str,New_Str),get_word(New_Str,Word,New_Str_after_word),Word \=[],append(Words,[Word],New_list_word),get_words(New_Str_after_word,New_list_word,List_words),!.
get_words(_,List_words,List_words).

lenght([],L,L):-!.
lenght([_|T],I,L):-I1 is I+1,lenght(T,I1,L).
lenght(List,L):-lenght(List,1,L).

listWord([],Res,Res):-!.
listWord([H|T],I,Res):-get_words(H,Words),lenght(Words,CountWords),append(I,[CountWords],I1),listWord(T,I1,Res).

sorted([],[],[],[]):-!.
sorted([H],[H],[HStr],[HStr]):-!.
sorted([First,Second|T],[Second|ListWithMaxEnd],[FirstStr,SecondStr|TStr],[SecondStr|ListWithMaxEndStr]):-First>Second,!,sorted([First|T],ListWithMaxEnd,[FirstStr|TStr],ListWithMaxEndStr).
sorted([First, Second|T],[First|ListWithMaxEnd],[FirstStr,SecondStr|TStr],[FirstStr|ListWithMaxEndStr]):-sorted([Second|T],ListWithMaxEnd,[SecondStr|TStr],ListWithMaxEndStr).

listSorter(SortedList,SortedList,SortedListStr,SortedListStr):-sorted(SortedList,DoubleSortedList,SortedListStr,DoubleSortedListStr),SortedList = DoubleSortedList,SortedListStr = DoubleSortedListStr,!.

listSorter(List,SortedList,ListStr,SortedListStr):-sorted(List,SortedPart,ListStr,SortedPartListStr),listSorter(SortedPart,SortedList,SortedPartListStr,SortedListStr).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

pr6:-see('C:/Users/User/Desktop/Func_and_Log/Laba8/Prolog6.txt'),read_list_str(A), seen,tell('C:/Users/User/Desktop/Func_and_Log/Laba8/Prolog6.txt'),listWord(A,[],ListWord),listSorter(ListWord,_,A,SortedA),write_list_str(SortedA),told.
