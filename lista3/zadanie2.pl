% u¿ywany jest algorytm Kadane
% https://en.wikipedia.org/wiki/Maximum_subarray_problem#Kadane's_algorithm

% wersja ze zwyk³¹ rekursj¹

max_sum2(L,X) :-
    max_sum2(L,0,X).

max_sum2([],X,X).
max_sum2([A|L],X,Y) :-
    (X+A>0 -> X1 is X+A; (A>0 -> X1 is A; X1 is 0)),
    max_sum2(L,X1,Y1),
    (X1>Y1 -> Y is X1; Y is Y1).

% rekursja ogonowa

max_sum(L,X) :-
    max_sum(L,0,0,X).

% (Lista,Maksymalna suma po lewej,Maksymalna suma do tej pory,Cel)
max_sum([],_,X,X).
max_sum([A|L],X,Z,Y) :-
    (X+A>0 -> X1 is X+A; (A>0 -> X1 is A; X1 is 0)),
    (X1>Z -> Z1 is X1; Z1 is Z ),
    max_sum(L,X1,Z1,Y).

