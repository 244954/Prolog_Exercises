gramatyka1 --> ab.
ab --> ``.
ab --> `a`,ab,`b`.

gramatyka2 --> ac(0).
ac(X) --> `a`,{Y is X + 1},ac(Y),`c`.
ac(X) --> b(X).
b(0) --> ``.
b(X) --> `b`,{Y is X - 1}, b(Y).

gramatyka3 --> a(0).
a(X) --> `a`,{Y is X + 1},a(Y).
a(X) --> {fib(X,Y)}, b(Y).

fib(0,1) :-
    !.
fib(1,1) :-
    !.
fib(N,M) :-
    N1 is N - 1,
    N2 is N - 2,
    fib(N1,M1),
    fib(N2,M2),
    M is M1 + M2.
