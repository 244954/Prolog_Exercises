arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).

osiagalny(X,Y) :- calc(Y,[X]).
calc(X,[A|_]) :- X = A.
calc(X,[A|Y]) :-
    arc(A,B),
    A \= B,
    \+ member(B,Y),
    calc(X,[B,A|Y]).
