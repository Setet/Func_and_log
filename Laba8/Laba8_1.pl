read_length(N,Flag):-get0(X),r_l_str(X,N,0,Flag).
r_l_str(-1,N,N,1):-!.
r_l_str(10,N,N,0):-!.
r_l_str(_,N,K,Flag):-K1 is K+1,get0(X1),r_l_str(X1,N,K1,Flag).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

readlength(LengthList):-read_length(N,Flag),readlength([N],LengthList,Flag).
readlength(LengthList, LengthList,1):-!.
readlength(CurLengthList,LengthList,0):-read_length(N,Flag),append(CurLengthList, [N],NewLengthList),readlength(NewLengthList,LengthList,Flag).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

max(List, MaxEl):- max(List, 0, MaxEl).
max([],CurMax, CurMax):- !.
max([H|T], CurMax, X):- H > CurMax, NewMax is H, max(T,NewMax,X), !.
max([_|T], CurMax, X):- max(T, CurMax, X).

nospace([],N,N):-!.
nospace([H|T],N,NSp):-spaceCounter(H)->NN is N+1,nospace(T,NN,NSp);nospace(T,N,NSp).

spaceCounter([]):-!.
spaceCounter([H|_]):-H is 32,!,fail.
spaceCounter([_|T]):-spaceCounter(T).

readstr(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

readlist(List):-readstr(A,_,Flag),readlist([A],List,Flag).
readlist(List,List,1):-!.
readlist(Cur_list,List,0):-readstr(A,_,Flag),append(Cur_list,[A],C_l),readlist(C_l,List,Flag).

countA([],ListCount,ListCount):-!.
countA([H|T],I,ListCount):-countAstr(H,0,CountA),append(I,[CountA],NI),countA(T,NI,ListCount).

countAstr([],N,N):-!.
countAstr([H|T],I,N):-(H is 65->NI is I+1,countAstr(T,NI,N);countAstr(T,I,N)).

average(Count,Ave):-average(Count,0,Sum,0,N),Ave is Sum/N.
average([],Sum,Sum,N,N):-!.
average([H|T],CSum,Sum,CN,N):-NewSum is CSum+H,NewN is CN+1,average(T,NewSum,Sum,NewN,N).

aveA([],_):-!.
aveA([H|T],Ave):-countAstr(H,0,CountA),(CountA>Ave->name(H1,H),write(H1),aveA(T,Ave);aveA(T,Ave)).

count(_, [], 0):-!.
count(Elem, List, X):- count(Elem, List, 0, X).
count(_, [], Count, Count):- !.
count(Elem, [Elem|T], Count, X):- Count1 is Count + 1,count(Elem, T, Count1, X), !.
count(Elem, [_|T], Count, X):- count(Elem, T, Count, X).

counts([],[],_):-!.
counts([Word|T_words],[Count|T_counts],Words):-count(Word,Words,Count),counts(T_words,T_counts,Words).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

uniqueElems([], []):- !.
uniqueElems([H|T], List2):- uniqueElems([H|T], List2, []).
uniqueElems([], CurList, CurList):- !.
uniqueElems([H|T], List, []):- uniqueElems(T, List, [H]), !.
uniqueElems([H|T], List, CurList):-not(contains(CurList, H)), append(CurList, [H], NewList), uniqueElems(T, List, NewList), !.
uniqueElems([_|T], List, CurList):- uniqueElems(T, List, CurList).

skipspace([32|Tail],New_Str):-skipspace(Tail,New_Str),!.
skipspace(New_Str,New_Str).

getword([],[],[]):-!.
getword(Str,Word,New_Str_after_word):-getword(Str,[],Word,New_Str_after_word).

getword([],Word,Word,[]).
getword([32|T],Word,Word,T):-!.
getword([H|T],W,Word,New_Str_after_word):-append(W,[H],W1),getword(T,W1,Word,New_Str_after_word).

wordsAllstr([],List_frequent,List_frequent):-!.
wordsAllstr([Head|Tail],I,List_frequent):-getwords(Head,Words),append(I,Words,I1),wordsAllstr(Tail,I1,List_frequent).

getwords(A,Words):-getwords(A,[],Words).

getwords([],List_words,List_words):-!.
getwords(Str,Words,List_words):-skipspace(Str,New_Str),getword(New_Str,Word,New_Str_after_word),Word \=[],append(Words,[Word],New_list_word),getwords(New_Str_after_word,New_list_word,List_words),!.
getwords(_,List_words,List_words).

indOfmax(X,Y):-indexOfmax(X,Y).
indexOfmax([], -1):- !.
indexOfmax([H|T], X):-indexOfmax(T, 1, 1, X, H).
indexOfmax([], _, MinInd, MinInd, _):-!.
indexOfmax([H|T], CurInd, _, X, CurMin):-H > CurMin, NewCurInd is CurInd + 1,indexOfmax(T, NewCurInd, NewCurInd, X, H), !.
indexOfmax([_|T], CurInd, MinInd, X, CurMin):-NewCurInd is CurInd + 1, indexOfmax(T, NewCurInd, MinInd, X, CurMin).

elBynumber(A,Ind,El):-elBynumber(A,1,Ind,El).
elBynumber([],_,_,nil):-!.
elBynumber([El|_],Ind,Ind,El):-!.
elBynumber([_|T],I,Ind,El):-I1 is I+1,elBynumber(T,I1,Ind,El).

noInciden([],_):-!.
noInciden([H|T],UniqueWords):-(getwords(H,WordsHead),coin_str(WordsHead,UniqueWords)->write_str(H),nl,noInciden(T,UniqueWords);noInciden(T,UniqueWords)).

coin_str([],_):-!.
coin_str([H|T],UniqueWords):-in_list(UniqueWords,H),coin_str(T,UniqueWords).

del(_,[],[]):-!.
del(H,[H|T],Res):-del(H,T,Res),!.
del(H,[H1|T],[H1|Res]):-not(H=H1),del(H,T,Res).

notRepeat([],[]):-!.
notRepeat([H|T],[H|Res]):-not(in_list(T,H)),notRepeat(T,Res),!.
notRepeat([H|T],Res):-del(H,T,H1),notRepeat(H1,Res).

%Ex1
pr1:- see('C:/Users/user/Desktop/Func_and_Log/Laba8/Prolog1.txt'),readlength(LengthList),seen, max(LengthList,Max),write(Max).

%Ex2
pr2:- see('C:/Users/user/Desktop/Func_and_Log/Laba8/Prolog2.txt'),readlist(List),seen,nospace(List,0,N),write(N).

%Ex3
pr3:- see('C:/Users/user/Desktop/Func_and_Log/Laba8/Prolog3.txt'),readlist(List),seen,countA(List,[],ListCount),average(ListCount,Ave),aveA(List,Ave).

%Ex4
pr4:-see('C:/Users/user/Desktop/Func_and_Log/Laba8/Prolog4.txt'),readlist(List), seen,wordsAllstr(List,[],List_frequent),uniqueElems(List_frequent,Unique_words),counts(Unique_words,C,List_frequent),indOfmax(C,Ind),elBynumber(Unique_words,Ind,Word),name(Word1,Word),write(Word1).

%Ex5
pr5:-see('C:/Users/user/Desktop/Func_and_Log/Laba8/Prolog5(1).txt'),readlist(List),seen,wordsAllstr(List,[],AllWords),notRepeat(AllWords,UniqueWords),tell('C:/Users/user/Desktop/Func_and_Log/Laba8/Prolog5(2).txt'),noInciden(List,UniqueWords),told.













