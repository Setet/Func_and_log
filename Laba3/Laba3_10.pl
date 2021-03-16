m_3(X,M):-m_3(X,M,0).
m_3(0,M,Mn):-M is Mn,!.
m_3(X,M,Mn):-((3>X mod 10,M1 is Mn +1,!);(M1 is Mn,!)),X1 is X div 10,!,m_3(X1,M,M1).
