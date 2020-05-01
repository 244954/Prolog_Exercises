% zwyk³a postaæ sumy (niewykorzystywana)
suma([],0).
suma([A|X],Y) :-
    suma(X,Z),
    Y is A + Z.

% postaæ ogonowa sumy
suma2([A|Y],X) :-
    suma3(Y,A,X).

suma3([],X,X).
suma3([A|B],X,Y) :-
    Z is A + X,
    suma3(B,Z,Y).

% praktycznie to samo, ale dla wariancji
warsum([A|Y],X,Avg) :-
    Newelem is (A - Avg)**2,
    warsum(Y,Newelem,X,Avg).

warsum([],X,X,_).
warsum([A|B],X,Y,Avg) :-
    Newelem is (A - Avg)**2,
    Z is Newelem + X,
    warsum(B,Z,Y,Avg).

% potrzebna nam œrednia
œrednia(L,X) :-
    suma2(L,S),
    length(L,D),
    D > 0,
    X is S / D.

wariancja(L,D) :-
    œrednia(L,Avg),
    length(L,Len),
    warsum(L,Sum,Avg),
    D is Sum / Len.
