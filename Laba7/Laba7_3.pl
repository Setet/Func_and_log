r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).
read_str(A,N):-get0(X),r_str(X,A,[],N,0).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

uniqueElems([], []):- !.
uniqueElems([H|T], List2):- uniqueElems([H|T], List2, []).
uniqueElems([], CurList, CurList):- !.
uniqueElems([H|T], List, []):- uniqueElems(T, List, [H]), !.
uniqueElems([H|T], List, CurList):-not(contains(CurList, H)), append(CurList, [H], NewList), uniqueElems(T, List, NewList), !.
uniqueElems([_|T], List, CurList):- uniqueElems(T, List, CurList).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).

counts([],[],_):-!.
counts([Word|T_words],[Count|T_counts],Words):-count(Word,Words,Count),counts(T_words,T_counts,Words).

elbynumber(A,Ind,El):-elbynumber(A,1,Ind,El).
elbynumber([],_,_,nil):-!.
elbynumber([El|_],Ind,Ind,El):-!.
elbynumber([_|T],I,Ind,El):-I1 is I+1,el_by_number(T,I1,Ind,El).

%1. Uniq_el(A,B) В элементы списка А без повторов
%2. count(El,List,Count) сколько раз El в списке
%3. номер мин имального элемента списка (нумерация с 1).

count(_, [], 0):-!.
count(Elem, List, X):- count(Elem, List, 0, X).
count(_, [], Count, Count):- !.
count(Elem, [Elem|T], Count,X):- Count1 is Count + 1,count(Elem, T, Count1, X), !.
count(Elem, [_|T], Count, X):- count(Elem, T, Count, X).

indofmax(X,Y):-indexofmin(X,Y).
indexofmin([], -1):- !.
indexofmin([H|T], X):-indexofmin(T, 1, 1, X, H).
indexofmin([], _, MinInd, MinInd, _):-!.
indexofmin([H|T], CurInd, _, X, CurMin):-H > CurMin, NewCurInd is CurInd + 1,indexofmin(T, NewCurInd, NewCurInd, X, H), !.
indexofmin([_|T], CurInd, MinInd, X, CurMin):-NewCurInd is CurInd + 1, indexofmin(T, NewCurInd, MinInd, X, CurMin).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).


brain_fuck:-read_str(A,_),get_words(A,Words,_),uniqueElems(Words,U_words),counts(U_words,C,Words),indofmax(C,Ind),elbynumber(U_words,Ind,El),write_str(El).




