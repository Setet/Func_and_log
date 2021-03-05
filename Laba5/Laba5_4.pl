list([El|_],El).
list([_|T],El):-list(T,El).


hard_workers:- Workers=[_,_,_],

	list(Workers,[slesar,_,0,0,_]),
	list(Workers,[tokar,_,_,1,_]),
	list(Workers,[svarschik,_,_,_,_]),
	list(Workers,[_,borisov,1,_,_]),
	list(Workers,[_,ivanov,_,_,_]),
	list(Workers,[_,semenov,_,2,borisov]),

write(Workers),!.
