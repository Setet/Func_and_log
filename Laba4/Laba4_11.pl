ravenstvo([H],[H|_]):-!.
ravenstvo([H|_],[H]):-!.
ravenstvo([H|T],[H1|T1]):- H is H1 ,ravenstvo(T,T1).
sravn([H|T],[H1|T1]):-ravenstvo([H|T],[H1|T1]).
sravn([H|T],[_|T1]):-sravn([H|T],T1).
