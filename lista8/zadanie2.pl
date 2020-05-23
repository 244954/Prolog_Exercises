:- use_module(library(clpfd)).

% dot product
multi([],[],Sum, Sum).
multi([A|X], [B|Y], Z, Sum):-
    Z1 #= Z + A * B,
    multi(X, Y, Z1, Sum).


plecak(Wartosci, Wielkosci, Pojemnosc, Zmienne) :-
    length(Wartosci, N),
    length(Zmienne, N),
    Zmienne ins 0..1,
    multi(Wartosci, Zmienne, 0, X),
    multi(Wielkosci, Zmienne, 0, Y),
    Y #=< Pojemnosc,
    once(labeling([max(X)],Zmienne)).
