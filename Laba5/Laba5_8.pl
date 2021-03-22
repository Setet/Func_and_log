list([El|_],El).
list([_|T],El):-list(T,El).

very_cool_assignment:- Gnomes=[[brikli,_,_,_],[drikli,_,_,_],[figli,_,_,_],[kvakli,_,_,_],[zvakli,_,_,_]],
%Инструменты
   list(Gnomes,[_,kyle,_,_]),
   list(Gnomes,[_,dyrdodym,_,_]),
   list(Gnomes,[_,kirka,_,_]),
   list(Gnomes,[_,zastyp,_,_]),
   list(Gnomes,[_,molot,_,_]),
%Вид камня
   list(Gnomes,[_,_,saphir,_]),
   list(Gnomes,[_,_,almaz,_]),
   list(Gnomes,[_,_,izymrud,_]),
   list(Gnomes,[_,_,agat,_]),
   list(Gnomes,[_,_,rybin,_]),
%Срок заключения
   list(Gnomes,[_,_,_,80]),
   list(Gnomes,[_,_,_,131]),
   list(Gnomes,[_,_,_,159]),
   list(Gnomes,[_,_,_,176]),
   list(Gnomes,[_,_,_,202]),

   not(list(Gnomes,[_,kyle,saphir,_])),

   list(Gnomes,[_,molot,almaz,_]),

   not(list(Gnomes,[brikli,dyrdodym,_,_])),
   not(list(Gnomes,[brikli,_,izymrud,_])),

   not(list(Gnomes,[_,_,izymrud,80])),
   not(list(Gnomes,[figli,_,izymrud,_])),

   not(list(Gnomes,[zvakli,_,saphir,_])),
   not(list(Gnomes,[zvakli,_,agat,_])),

   not(list(Gnomes,[kvakli,kirka,_,_])),
   not(list(Gnomes,[kvakli,molot,_,_])),
   not(list(Gnomes,[kvakli,_,almaz,_])),

   write(Gnomes),!.


