man(eren).
man(armin).
man(zik).
man(jean).
man(koni).
man(marko).
man(ervin).
man(marlo).
man(hannes).

woman(mikasa).
woman(christa).
woman(sasha).
woman(imir).
woman(handji).
woman(hitch).
woman(dina).
woman(frida).
woman(anni).

parent(eren,armin).
parent(eren,sasha).
parent(eren,jean).
parent(eren,handji).

parent(mikasa,armin).
parent(mikasa,sasha).
parent(mikasa,jean).
parent(mikasa,handji).

parent(armin,marko).
parent(armin,ervin).
parent(christa,marko).
parent(christa,ervin).

parent(zik,marlo).
parent(zik,hitch).
parent(sasha,marlo).
parent(sasha,hitch).

parent(jean,dina).
parent(jean,frida).
parent(imir,dina).
parent(imir,frida).

parent(koni,anni).
parent(koni,hannes).
parent(handji,anni).
parent(handji,hannes).

b_s(X,Y):-parent(Z,X),parent(Z,Y),woman(Z).
b_s(X):-b_s(Y,X),write(Y),write(", "),fail.
