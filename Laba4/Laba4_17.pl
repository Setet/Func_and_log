lenght([],N,N):-!.
lenght([_|Tail],I,N):-NewI is I+1,lenght(Tail,NewI,N).
lenght(List,N):-lenght(List,0,N).
