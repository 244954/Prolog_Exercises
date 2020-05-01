regu�a(X, +, Y, Y) :-
    number(X),
    X =:= 0, !.
regu�a(X, +, Y, X) :-
    number(Y),
    Y =:= 0, !.
regu�a(X, -, X, 0).
regu�a(X, -, Y, X) :-
    number(Y),
    Y =:= 0, !.
regu�a(X, *, _, X) :-
    number(X),
    X =:= 0, !.
regu�a(_, *, 0, 0).
regu�a(0, *, _, 0).
regu�a(X, *, Y, X) :-
    number(Y),
    Y =:= 1, !.
regu�a(X, / , X, 1) :-
    number(X),
    X =\= 0, !.
regu�a(X, / , X, 1) :-
    \+ number(X).
regu�a(X, / , Y, X) :-
    number(Y),
    Y =:= 1, !.
regu�a(X*Y, /, Y, X) :-
    number(Y),
    Y =\= 0.
regu�a(X*Y, /, Y, X) :-
    \+ number(Y).


upro��(X,X) :-
    X =.. Z,
    Z = [_ | []].

upro��(X,Wynik) :-
    X =.. L,
    L = [Operator | _],
    select(Operator, L, L1),
    L1 = [Ar1 | _],
    select(Ar1, L1, L2),
    L2 = [Ar2 | _],
    regu�a(Ar1,Operator,Ar2,Wynik).

upro��(X,Wynik) :-
    X =.. L,
    L = [Operator | _],
    select(Operator, L, L1),
    L1 = [Ar1 | _],
    select(Ar1, L1, L2),
    L2 = [Ar2 | _],
    \+ regu�a(Ar1,Operator,Ar2,_),
    upro��(Ar1, N1),
    upro��(Ar2, N2),
    regu�a(N1,Operator,N2, Wynik).






