min(X,M):-M1 is X mod 10,X1 is X div 10,min(X1,M,M1).
min(X,M,Mt):- X1 is X div 10, X1 is 0,M is Mt,!.
min(X,M,Mt):-((Mt>X mod 10,M1 is X mod 10,!);(M1 is Mt,!)),X1 is X div 10,!,min(X1,M,M1).
