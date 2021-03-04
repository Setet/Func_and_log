min_1(X,Min):-X < 10, Min is X,!.
min_1(X,Min):-X>=10,X1 is X mod 10, X2 is X div 10, min_1(X2,Min),Min > X1,Min is X1.
min_1(X,Min):-X>=10,X1 is X mod 10, X2 is X div 10, min_1(X2,Min),Min < X1,Min is Min.
min:-read(X), min_1(X,Min), writeln(Min).
