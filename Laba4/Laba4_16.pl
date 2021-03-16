kolwo([H|T],X,K):-kolw([H|T],X,K,0).
kolw([],_,K,K):-!.
kolw([H|T],X,K,Tec):-(H is X -> T1 is  Tec+1;T1 is Tec),kolw(T,X,K,T1).
