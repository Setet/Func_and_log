fibD(2,_,NextX,NextX):-!.
fibD(N,LastX,NextX,X):-N1 is N-1, NextX1 is LastX+NextX, fibD(N1,NextX,NextX1,X).
fibDown(N,X):-fibD(N,1,1,X).
