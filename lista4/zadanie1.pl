wyrażenie(L,N,X) :-
    pairup(L,Lnew),
    N is Lnew,
    X = Lnew.

% wybiera dwa kolejne elementy
selecttwo(A,B,[A,B|L],L).
selecttwo(A,B,[Y|L1],[Y|L2]) :-
    selecttwo(A,B,L1,L2).

mergetwo([A,B|L],[X|L]) :-
    X = A+B.
mergetwo([A,B|L],[X|L]) :-
    X = A-B.
mergetwo([A,B|L],[X|L]) :-
    X = A*B.
mergetwo([A,B|L],[X|L]) :-
    Y is B,
    Y \= 0,
    B =.. C,
    nozero(C),
    X = A/B.
mergetwo([Y|L1],[Y|L2]) :-
    mergetwo(L1,L2).

pairup([W],W).
pairup(L,W) :-
    mergetwo(L,L1),
    pairup(L1,W).

nozero([_]).
nozero([+,X|_]) :-
       Y is X,
       Y \= 0.
nozero([-,X|_]) :-
       Y is X,
       Y \= 0.


