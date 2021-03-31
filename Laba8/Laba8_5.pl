read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,1):-!.
r_str_f(10,A,A,N,N,0):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List):-read_str_f(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-read_str_f(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

lenght([],L,L):-!.
lenght([_|T],I,L):-I1 is I+1,lenght(T,I1,L).
lenght(List,L):-lenght(List,1,L).

listLenght([],Res,Res):-!.
listLenght([H|T],I,Res):-lenght(H,LenghtHead),append(I,[LenghtHead],I1),listLenght(T,I1,Res).


sorted([],[],[],[]):-!.
sorted([H],[H],[HStr],[HStr]):-!.
sorted([First,Second|T],[Second|ListWithMaxEnd],[FirstStr,SecondStr|TStr],[SecondStr|ListWithMaxEndStr]):-First>Second,!,sorted([First|T],ListWithMaxEnd,[FirstStr|TStr],ListWithMaxEndStr).
sorted([First, Second|T],[First|ListWithMaxEnd],[FirstStr,SecondStr|TStr],[FirstStr|ListWithMaxEndStr]):-sorted([Second|T],ListWithMaxEnd,[SecondStr|TStr],ListWithMaxEndStr).


listSorter(SortedList,SortedList,SortedListStr,SortedListStr):-sorted(SortedList,DoubleSortedList,SortedListStr,DoubleSortedListStr),SortedList = DoubleSortedList,SortedListStr = DoubleSortedListStr,!.

listSorter(List,SortedList,ListStr,SortedListStr):-sorted(List,SortedPart,ListStr,SortedPartListStr),listSorter(SortedPart,SortedList,SortedPartListStr,SortedListStr).

pr5:-see('C:/Users/User/Desktop/Func_and_Log/Laba8/Prolog5.txt'),read_list_str(A), seen,tell('C:/Users/User/Desktop/Func_and_Log/Laba8/Prolog5.txt'),listLenght(A,[],ListLenght),listSorter(ListLenght,_,A,SortedA),write_list_str(SortedA),told.
