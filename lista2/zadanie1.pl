rowne([],[]).
rowne([_|L1],[_|L2]) :-
    rowne(L1,L2).

srodkowy([X],X).
srodkowy([Y | P],X) :-
    split([Y],P,X).
split(L,[Y|P],X) :- rowne(L,P),Y = X.
split(L,[Y|P],X) :- append(L,[Y],Z),split(Z,P,X).
