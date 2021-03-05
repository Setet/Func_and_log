check_is(_,[]):-!.
check_is(X,[H|T]):- X =\= H,check_is(X,T).
check([H|T]):-check_is(H,T),check(T).
check([]):-!.
