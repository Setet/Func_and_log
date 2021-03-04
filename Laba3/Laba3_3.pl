factUp(1,1):-!.
factUp(N,X):-N1 is N-1, factUp(N1,X1),X is N*X1.
