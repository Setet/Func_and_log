:- dynamic paper/2.
:- dynamic death/2.
:- dynamic friends/2.
:- dynamic author/2.
:- dynamic receiver/2.
:- dynamic cost/2.

read_str(A):-get0(X),r_str(X,A,[]).
r_str(12,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

%Paper
paper_r(X,Y):-repeat,(paper(X,Y)->(nl,write(X),nl,write(Y),write("."),retract(paper(X,Y))) ;X=nil,Y=nil).

prPaperTell:-tell('C:/Users/user/Desktop/Func_and_Log/Laba11/Paper.txt'),paper_r(X,_),X=nil,told.
prPaperSee:-see('C:/Users/user/Desktop/Func_and_Log/Laba11/Paper.txt'),get0(Sym),readPaper(Sym),seen.

readPaper(-1):-!.
readPaper(_):-read_str(Lang),name(X,Lang),read(Y),asserta(paper(X,Y)),get0(Sym),readPaper(Sym).

%Death
death_r(X,Y):-repeat,(death(X,Y)->(nl,write(X),nl,write(Y),write("."),retract(death(X,Y))) ;X=nil,Y=nil).

prDeathTell:-tell('C:/Users/user/Desktop/Func_and_Log/Laba11/Death.txt'),death_r(X,_),X=nil,told.
prDeathSee:-see('C:/Users/user/Desktop/Func_and_Log/Laba11/Death.txt'),get0(Sym),readDeath(Sym),seen.

readDeath(-1):-!.
readDeath(_):-read_str(Lang),name(X,Lang),read(Y),asserta(death(X,Y)),get0(Sym),readDeath(Sym).

%Friends
friends_r(X,Y):-repeat,(friends(X,Y)->(nl,write(X),nl,write(Y),write("."),retract(friends(X,Y))) ;X=nil,Y=nil).

prFriendsTell:-tell('C:/Users/user/Desktop/Func_and_Log/Laba11/Friends.txt'),friends_r(X,_),X=nil,told.
prFriendsSee:-see('C:/Users/user/Desktop/Func_and_Log/Laba11/Friends.txt'),get0(Sym),readFriends(Sym),seen.

readFriends(-1):-!.
readFriends(_):-read_str(Lang),name(X,Lang),read(Y),asserta(friends(X,Y)),get0(Sym),readFriends(Sym).

%Author
author_r(X,Y):-repeat,(author(X,Y)->(nl,write(X),nl,write(Y),write("."),retract(author(X,Y))) ;X=nil,Y=nil).

prAuthorTell:-tell('C:/Users/user/Desktop/Func_and_Log/Laba11/Author.txt'),author_r(X,_),X=nil,told.
prAuthorSee:-see('C:/Users/user/Desktop/Func_and_Log/Laba11/Author.txt'),get0(Sym),readAuthor(Sym),seen.

readAuthor(-1):-!.
readAuthor(_):-read_str(Lang),name(X,Lang),read(Y),asserta(author(X,Y)),get0(Sym),readAuthor(Sym).

%Receiver
receiver_r(X,Y):-repeat,(receiver(X,Y)->(nl,write(X),nl,write(Y),write("."),retract(receiver(X,Y))) ;X=nil,Y=nil).

prReceiverTell:-tell('C:/Users/user/Desktop/Func_and_Log/Laba11/Receiver.txt'),receiver_r(X,_),X=nil,told.
prReceiverSee:-see('C:/Users/user/Desktop/Func_and_Log/Laba11/Receiver.txt'),get0(Sym),readReceiver(Sym),seen.

readReceiver(-1):-!.
readReceiver(_):-read_str(Lang),name(X,Lang),read(Y),asserta(receiver(X,Y)),get0(Sym),readReceiver(Sym).

%Cost
cost_r(X,Y):-repeat,(cost(X,Y)->(nl,write(X),nl,write(Y),write("."),retract(cost(X,Y))) ;X=nil,Y=nil).

prCostTell:-tell('C:/Users/user/Desktop/Func_and_Log/Laba11/Cost.txt'),cost_r(X,_),X=nil,told.
prCostSee:-see('C:/Users/user/Desktop/Func_and_Log/Laba11/Cost.txt'),get0(Sym),readCost(Sym),seen.

readCost(-1):-!.
readCost(_):-read_str(Lang),name(X,Lang),read(Y),asserta(cost(X,Y)),get0(Sym),readCost(Sym).

prSeeAll:-prPaperSee,prDeathSee,prFriendsSee,prAuthorSee,prReceiverSee,prCostSee.
prTellAll:-prPaperTell,prDeathTell,prFriendsTell,prAuthorTell,prReceiverTell,prCostTell.

question1(X1):-write("1)Sheets of a book made of yellow paper?"),nl,
				write("1. yes"),nl,
				write("0. no"),nl,
				read(X1).

question2(X2):-write("2)Is the main character of the book dying?"),nl,
				write("1. yes"),nl,
				write("0. no"),nl,
				read(X2).

question3(X3):-write("3)Does the main character have friends?"),nl,
				write("1. yes"),nl,
				write("0. no"),nl,
				read(X3).

question4(X4):-write("4)Is the author of the book alive?"),nl,
				write("1. yes"),nl,
				write("0. no"),nl,
				read(X4).

question5(X5):-write("5)Does the author have a receiver?"),nl,
				write("1. yes"),nl,
				write("0. no"),nl,
				read(X5).

question6(X6):-write("6)What is the cost of an advertising campaign?"),nl,
				write("0. 1000"),nl,
                                write("1. 2000"),nl,
                                write("2. 3000"),nl,
                                write("3. 4000"),nl,
                                write("4. 5000"),nl,
				read(X6).

pr:- question1(X1),question2(X2),question3(X3),question4(X4),question5(X5),question6(X6),(paper(X,X1),death(X,X2),friends(X,X3),author(X,X4),receiver(X,X5),cost(X,X6),write("It- "),write(X);newOne(X1,X2,X3,X4,X5,X6)),fail.

newOne(X1,X2,X3,X4,X5,X6):-writeln("Who is it?"),writeln("1 - Newbie"),writeln("0 - Do you know him"),read(Ans),(Ans is 1 ->writeln("Yes? Then let him say his name and data"),read(Name),addNewOne(X1,X2,X3,X4,X5,X6,Name);writeln("Remembered"),fail).

addNewOne(X1,X2,X3,X4,X5,X6,Name):-
    append('C:/Users/user/Desktop/Func_and_Log/Laba11/Paper.txt'),
    nl, write(Name), nl,write(X1),write("."), told,

    append('C:/Users/user/Desktop/Func_and_Log/Laba11/Death.txt'),
    nl, write(Name), nl,write(X2),write("."), told,

    append('C:/Users/user/Desktop/Func_and_Log/Laba11/Friends.txt'),
    nl, write(Name), nl,write(X3),write("."), told,

    append('C:/Users/user/Desktop/Func_and_Log/Laba11/Author.txt'),
    nl, write(Name), nl,write(X4),write("."), told,

    append('C:/Users/user/Desktop/Func_and_Log/Laba11/Receiver.txt'),
    nl, write(Name), nl,write(X5),write("."), told,

    append('C:/Users/user/Desktop/Func_and_Log/Laba11/Cost.txt'),
    nl, write(Name), nl,write(X6),write("."), told.
