:- use_module(library(clpfd)).

sum([],X,X).
sum([A|L],X,SUM) :-
    X1 #= A + X,
    sum(L,X1,SUM).
ile2([1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0],X,X1) :-
    X1 #= X + 1.
ile2([1|_],_,_) :-
    fail.
ile2([0|L],X,ILE) :-
    ile([0|L],X,ILE).
ile([0,1],X,X1) :-
    X1 #= X + 1.
ile([1,1],X,X).
ile([1,0],X,X).
ile([0,0],X,X).
ile([0,1 | L],X,ILE) :-
    X1 #= X + 1,
    ile([1|L],X1,ILE).
ile([1,1 | L],X,ILE) :-
    ile([1|L],X,ILE).
ile([1,0 | L],X,ILE) :-
    ile([0|L],X,ILE).
ile([0,0 | L],X,ILE) :-
    ile([0|L],X,ILE).

odcinek(X) :-
    length(X, 16),
    X ins 0..1,
    sum(X,0,Y),
    ile2(X,0,Z),
    Y #= 8,
    Z #= 1.
