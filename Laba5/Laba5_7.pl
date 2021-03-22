list([El|_],El).
list([_|T],El):-list(T,El).

friends :- Friend = [_, _, _],

    list(Friend, [michael,_,_,_,_]),
    list(Friend, [simon,_,_,_,_]),
    list(Friend, [richard,_,_,_,_]),

    list(Friend, [_,american,_,_,_]),
    list(Friend, [_,israelite,_,_,_]),
    list(Friend, [_,australian,_,_,_]),

    list(Friend, [_,_,1,_,_]),
    list(Friend, [_,_,2,_,_]),
    list(Friend, [_,_,3,_,_]),

    list(Friend, [_,_,_,basketball,_]),
    list(Friend, [_,_,_,tennis,_]),
    list(Friend, [_,_,_,cricket,_]),


    list(Friend, [michael,_,_,basketball,american]),
    list(Friend, [simon,israelite,_,_,tennis]),
    list(Friend, [_,_,1,cricket,_]),

    list(Friend,[W1,australian,_,_,_]),
    list(Friend,[richard,_,_,W2,_]),

    write("Australian is "),write(W1),nl,write("Richard plays "),write(W2),nl,write(Friend), !.

