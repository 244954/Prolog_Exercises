reguła(X, +, Y, Y) :-
    number(X),
    X =:= 0, !.
reguła(X, +, Y, X) :-
    number(Y),
    Y =:= 0, !.
reguła(X, -, X, 0).
reguła(X, -, Y, X) :-
    number(Y),
    Y =:= 0, !.
reguła(X, *, _, X) :-
    number(X),
    X =:= 0, !.
reguła(_, *, 0, 0).
reguła(0, *, _, 0).
reguła(X, *, Y, X) :-
    number(Y),
    Y =:= 1, !.
reguła(X, / , X, 1) :-
    number(X),
    X =\= 0, !.
reguła(X, / , X, 1) :-
    \+ number(X).
reguła(X, / , Y, X) :-
    number(Y),
    Y =:= 1, !.
reguła(X*Y, /, Y, X) :-
    number(Y),
    Y =\= 0.
reguła(X*Y, /, Y, X) :-
    \+ number(Y).


uprość(X,X) :-
    X =.. Z,
    Z = [_ | []].

uprość(X,Wynik) :-
    X =.. L,
    L = [Operator | _],
    select(Operator, L, L1),
    L1 = [Ar1 | _],
    select(Ar1, L1, L2),
    L2 = [Ar2 | _],
    reguła(Ar1,Operator,Ar2,Wynik).

uprość(X,Wynik) :-
    X =.. L,
    L = [Operator | _],
    select(Operator, L, L1),
    L1 = [Ar1 | _],
    select(Ar1, L1, L2),
    L2 = [Ar2 | _],
    \+ reguła(Ar1,Operator,Ar2,_),
    uprość(Ar1, N1),
    uprość(Ar2, N2),
    reguła(N1,Operator,N2, Wynik).






