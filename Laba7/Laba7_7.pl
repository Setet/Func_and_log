read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

number_times([],0,_):-!.
number_times([H|T],X,H):-number_times(T,CurX,H),X is CurX+1,!.
number_times([_|T],X,N):-number_times(T,X,N).

string_next([],_,0):-!.
string_next([_|[]],_,0):-!.
string_next([_,H2|T],H2,Count):-string_next([H2|T],H2,CurCount),Count is CurCount+1,!.
string_next([_|T],X,Count):-string_next(T,X,Count).

pr7:-read_str(L,_),

		number_times(L,CountP,43),	% +
		number_times(L,CountM,45),	% -

                CountPM is CountP+CountM,

                string_next(L,48,CountN),	% 0

		nl,write("total quantity of '+' and '-': "),
		writeln(CountPM),

		write("number of characters followed by '0': "),
		writeln(CountN),nl.
