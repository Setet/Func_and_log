sumNumD(0,S,S):-!.
sumNumD(X,Cur,S):-X1 is X div 10, Cur1 is Cur + X mod 10,sumNumD(X1,Cur1,S).
sumNumDown(X,S):-sumNumD(X,0,S).
