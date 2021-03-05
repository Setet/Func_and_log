list([El|_],El).
list([_|T],El):-list(T,El).

prgachi_party:- Friends=[_,_,_],
    list(Friends,[belokurov,_]),
    list(Friends,[chernov,_]),
    list(Friends,[rizhov,_]),
    list(Friends,[_,ginger]),
    list(Friends,[_,blond]),
    list(Friends,[_,brunette]),

    not(list(Friends,[belokurov,blond])),
    not(list(Friends,[chernov,brunette])),
    not(list(Friends,[rizhov,ginger])),
    not(list(Friends,[belokurov,brunette])),
    write(Friends),!.
