list([El|_],El).
list([_|T],El):-list(T,El).


masters:- masters:=[_,_,_,_],
    list(masters,[voronov,_]),
    list(masters,[pavlov,_]),
    list(masters,[levitsky,_]),
    list(masters,[saharov,_]),
    list(masters,[_,dancer]),
    list(masters,[_,painter]),
    list(masters,[_,singer]),
    list(masters,[_,writer]),

    not(list(masters,[voronov,singer])),
    not(list(masters,[voronov,painter])),
    not(list(masters,[pavlov,painter])),
    not(list(masters,[pavlov,writer])),
    not(list(masters,[saharov,writer])),
    not(list(masters,[voronov,writer])),

write(masters),!.
