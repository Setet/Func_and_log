next_to(A,B,List):-right_next(A,B,List).
next_to(A,B,List):-left_next(A,B,List).

left_next(A,B,[C]):-fail.
left_next(A,B,[B|[A|Tail]]).
left_next(A,B,[_|List]):-left_next(A,B,List).


right_next(A,B,[C]):-fail.
right_next(A,B,[A|[B|Tail]]).
right_next(A,B,[_|List]):-right_next(A,B,List).

list([El|_],El).
list([_|T],El):-list(T,El).

drink:- Drinks=[_,_,_,_],
    list(Drinks,[bottle,_]),
    list(Drinks,[glass,_]),
    list(Drinks,[jug,_]),
    list(Drinks,[jar,_]),
    list(Drinks,[_,milk]),
    list(Drinks,[_,lemonade]),
    list(Drinks,[_,kvass]),
    list(Drinks,[_,water]),

    not(list(Drinks,[bottle,water])),
    not(list(Drinks,[bottle,milk])),

    right_next([jug,_],[_,lemonade],Drinks),
    right_next([_,lemonade],[_,kvass],Drinks),

    not(list(Drinks,[jar,lemonade])),
    not(list(Drinks,[jar,water])),

    next_to([jar,_],[glass,_],Drinks),
    next_to([jar,_],[_,milk],Drinks),

write(Drinks),!.
