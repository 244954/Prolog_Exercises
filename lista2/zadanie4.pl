regu³a(X, +, Y, Y) :-
    number(X),
    X =:= 0, !.
regu³a(X, +, Y, X) :-
    number(Y),
    Y =:= 0, !.
regu³a(X, -, X, 0).
regu³a(X, -, Y, X) :-
    number(Y),
    Y =:= 0, !.
regu³a(X, *, _, X) :-
    number(X),
    X =:= 0, !.
regu³a(_, *, 0, 0).
regu³a(0, *, _, 0).
regu³a(X, *, Y, X) :-
    number(Y),
    Y =:= 1, !.
regu³a(X, / , X, 1) :-
    number(X),
    X =\= 0, !.
regu³a(X, / , X, 1) :-
    \+ number(X).
regu³a(X, / , Y, X) :-
    number(Y),
    Y =:= 1, !.
regu³a(X*Y, /, Y, X) :-
    number(Y),
    Y =\= 0.
regu³a(X*Y, /, Y, X) :-
    \+ number(Y).


uproœæ(X,X) :-
    X =.. Z,
    Z = [_ | []].

uproœæ(X,Wynik) :-
    X =.. L,
    L = [Operator | _],
    select(Operator, L, L1),
    L1 = [Ar1 | _],
    select(Ar1, L1, L2),
    L2 = [Ar2 | _],
    regu³a(Ar1,Operator,Ar2,Wynik).

uproœæ(X,Wynik) :-
    X =.. L,
    L = [Operator | _],
    select(Operator, L, L1),
    L1 = [Ar1 | _],
    select(Ar1, L1, L2),
    L2 = [Ar2 | _],
    \+ regu³a(Ar1,Operator,Ar2,_),
    uproœæ(Ar1, N1),
    uproœæ(Ar2, N2),
    regu³a(N1,Operator,N2, Wynik).






