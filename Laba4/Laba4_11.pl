p([],[]):-!.
p([HS|Sublist],[HL|List]):-p(Sublist,List),HS =:= HL.
