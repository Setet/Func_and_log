fibUp(2,1):-!.
fibUp(N,X):-N1 is N-1, fibUp(N1,X1), X is X+X1.
