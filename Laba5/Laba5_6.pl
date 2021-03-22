list([El|_],El).
list([_|T],El):-list(T,El).

talants :- Talants = [_, _, _, _],

                list(Talants, [voronov, _, _,_]),
		list(Talants, [pavlov, _, _,_]),
		list(Talants, [levitskiy, _, _, _]),
		list(Talants, [saharov,_,_,_]),

		list(Talants, [_, dancer,_,_ ]),
		list(Talants, [_, painter,_,_ ]),
		list(Talants, [_, singer,_,_]),
		list(Talants, [_, writer, _ ,_]),

                list(Talants, [voronov, _, cons,writer]),
		list(Talants, [pavlov, _, _,painter]),
		list(Talants, [levitskiy, _, cons, _]),
                list(Talants, [saharov,_,_,writer]),

		list(Talants, [_, singer,cons,_]),
		list(Talants, [_, writer, _,painter]),

                not(list(Talants, [levitskiy, singer,_,_])),
                not(list(Talants, [pavlov, writer,_,_])),

		write(Talants), !.
