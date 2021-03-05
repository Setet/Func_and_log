list([El|_],El).
list([_|T],El):-list(T,El).

pr_girls_look:- Girls=[_,_,_],
list(Girls,[_,white,_]),
list(Girls,[_,green,_]),
list(Girls,[_,blue,_]),
list(Girls,[_,_,white]),
list(Girls,[_,_,green]),
list(Girls,[_,_,blue]),
list(Girls,[ann,_,_]),
list(Girls,[natasha,_,green]),
list(Girls,[valya,_,_]),
not(list(Girls,[natasha,green,_])),
not(list(Girls,[valya,white,white])),
write(Girls),!.
