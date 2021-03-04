sumNumUp(0,0):-!.
sumNumUp(X,S):-X1 is X div 10, sumNumUp(X1,S1), S is S1 + X mod 10.
