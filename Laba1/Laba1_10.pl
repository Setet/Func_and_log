man(eren).
man(armin).
man(zik).
man(jean).
man(koni).
man(marko).
man(ervin).
man(marlo).
man(hannes).
man(levi).

woman(mikasa).
woman(christa).
woman(sasha).
woman(imir).
woman(handji).
woman(hitch).
woman(dina).
woman(frida).
woman(anni).
woman(pick).

parent(eren,armin).
parent(eren,sasha).
parent(eren,jean).
parent(eren,handji).

parent(levi,christa).
parent(levi,zik).
parent(levi,imir).
parent(levi,koni).

parent(pick,christa).
parent(pick,zik).
parent(pick,imir).
parent(pick,koni).

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

grand_pa(X,Y):-parent(X,Z),parent(Z,Y),man(X).

grand_pa_and_son(X,Y):-grand_pa(X,Y)\=grand_pa(Y,X),man(X),man(Y).
