list([El|_],El).
list([_|T],El):-list(T,El).

right_next(A,B,[C]):-fail.
right_next(A,B,[A|[B|Tail]]).
right_next(A,B,[_|List]):-right_next(A,B,List).

left_next(A,B,[C]):-fail.
left_next(A,B,[B|[A|Tail]]).
left_next(A,B,[_|List]):-left_next(A,B,List).

next_to(A,B,List):-right_next(A,B,List).
next_to(A,B,List):-left_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_stack:- Houses=[_,_,_,_,_],

		list(Houses,[red,english,_,_,_]),
		list(Houses,[_,spanish,_,dog,_]),
		list(Houses,[green,_,coffee,_,_]),
		list(Houses,[_,ukrain,tea,_,_]),
		right_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		list(Houses,[_,_,_,ulitka,old_gold]),
		list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		list(Houses,[_,_,orange,_,lucky]),
		list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		list(Houses,[_,WHO1,water,_,_]),
		list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		nl,write(WHO1),nl,write(WHO2).

