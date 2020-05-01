even_permutation([],[]).
even_permutation([A|X],Y) :-
    even_permutation(X,Z),
    insert_at_odd_position(A,Z,Y). % insert_at_odd_position nie zmieni parzystoœci
even_permutation([A|X],Y) :-
    odd_permutation(X,Z),
    insert_at_even_position(A,Z,Y). % insert_at_even_position zmieni parzystoœæ z odd z powrotem na even


odd_permutation([A|X],Y) :-
    odd_permutation(X,Z), % insert_at_odd_position nie zmieni parzystoœci
    insert_at_odd_position(A,Z,Y).
odd_permutation([A|X],Y) :-
    even_permutation(X,Z),
    insert_at_even_position(A,Z,Y).

% na przyk³ad pierwotna pozycja
% (1,[2,3,4,5,6],X) -> [1,2,3,4,5,6] ; [2,3,1,4,5,6] ; [2,3,4,5,1,6]
insert_at_odd_position(X,Lista,[X|Lista]).
insert_at_odd_position(X,[Y,Z|Lista1],[Y,Z|Lista2]) :-
    insert_at_odd_position(X,Lista1,Lista2).

% na przyk³ad pozycja o jeden dalej lub bli¿ej
% (1,[2,3,4,5,6],X) -> [2,1,3,4,5,6] ; [2,3,4,1,5,6] ; [2,3,4,5,6,1]
insert_at_even_position(X,[A|Lista],[A,X|Lista]).
insert_at_even_position(X,[A,B|Lista1],[A,B|Lista2]) :-
    insert_at_even_position(X,Lista1,Lista2).


