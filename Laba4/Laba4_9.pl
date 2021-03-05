elem([X,_],X):-!.
elem([_|T],X):-elem(T,X).
