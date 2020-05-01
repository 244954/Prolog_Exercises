board(L) :-
    length(L,N),
    drawboard(L,N,N).

% drawboard(lista,wiersz)
% nieparzyste zaczynają się od czarnego pola
%
% pozwalam na kilka hetmanów w jednym rzędzie np. board([1,2,2,3,3]).

drawboard(_,N,0):-
    !,
    lastrow(N).
drawboard(L,N,N1) :-
    membernum(L,N1,X),
    !,
    (   N1 mod 2 =:= 0 -> drawrow1white(1,N,X) ; drawrow1black(1,N,X)),
    N2 is N1 - 1,
    drawboard(L,N,N2).
drawboard(L,N,N1) :-
    N3 is N + 1,
    (   N1 mod 2 =:= 0 -> drawrow1white(1,N,N3) ; drawrow1black(1,N,N3)),
    N2 is N1 - 1,
    drawboard(L,N,N2).


lastrow(X) :-
    X is 1,
    !,
    write('+-----+'),
    nl.
lastrow(X) :-
    X2 is X - 1,
    write('+-----'),
    lastrow(X2).


drawrow1white(N,N,X) :-
    !,
    write('+-----+'),
    nl,
    drawrow2white(1,N,X).
drawrow1white(M,N,X) :-
    !,
    write('+-----'),
    M2 is M + 1,
    drawrow1white(M2,N,X).
drawrow2white(N,N,X) :-
    member(N,X),
    !,
    (   N mod 2 =:= 1 -> write('| ### |') ; write('|:###:|')  ),
    nl,
    drawrow3white(1,N,X).
drawrow2white(N,N,X) :-
    !,
    (   N mod 2 =:= 1 -> write('|     |') ; write('|:::::|')  ),
    nl,
    drawrow3white(1,N,X).
drawrow2white(M,N,X) :-
    member(M,X),
    !,
    (   M mod 2 =:= 1 -> write('| ### ') ; write('|:###:')  ),
    M2 is M + 1,
    drawrow2white(M2,N,X).
drawrow2white(M,N,X) :-
    (   M mod 2 =:= 1 -> write('|     ') ; write('|:::::')  ),
    M2 is M + 1,
    drawrow2white(M2,N,X).
drawrow3white(N,N,X) :-
    member(N,X),
    !,
    (   N mod 2 =:= 1 -> write('| ### |') ; write('|:###:|')  ),
    nl.
drawrow3white(N,N,_) :-
    !,
    (   N mod 2 =:= 1 -> write('|     |') ; write('|:::::|')  ),
    nl.
drawrow3white(M,N,X) :-
    member(M,X),
    !,
    (   M mod 2 =:= 1 -> write('| ### ') ; write('|:###:')  ),
    M2 is M + 1,
    drawrow3white(M2,N,X).
drawrow3white(M,N,X) :-
    (   M mod 2 =:= 1 -> write('|     ') ; write('|:::::')  ),
    M2 is M + 1,
    drawrow3white(M2,N,X).




drawrow1black(N,N,X) :-
    !,
    write('+-----+'),
    nl,
    drawrow2black(1,N,X).
drawrow1black(M,N,X) :-
    !,
    write('+-----'),
    M2 is M + 1,
    drawrow1black(M2,N,X).
drawrow2black(N,N,X) :-
    member(N,X),
    !,
    (   N mod 2 =:= 0 -> write('| ### |') ; write('|:###:|')  ),
    nl,
    drawrow3black(1,N,X).
drawrow2black(N,N,X) :-
    !,
    (   N mod 2 =:= 0 -> write('|     |') ; write('|:::::|')  ),
    nl,
    drawrow3black(1,N,X).
drawrow2black(M,N,X) :-
    member(M,X),
    !,
    (   M mod 2 =:= 0 -> write('| ### ') ; write('|:###:')  ),
    M2 is M + 1,
    drawrow2black(M2,N,X).
drawrow2black(M,N,X) :-
    (   M mod 2 =:= 0 -> write('|     ') ; write('|:::::')  ),
    M2 is M + 1,
    drawrow2black(M2,N,X).
drawrow3black(N,N,X) :-
    member(N,X),
    !,
    (   N mod 2 =:= 0 -> write('| ### |') ; write('|:###:|')  ),
    nl.
drawrow3black(N,N,_) :-
    !,
    (   N mod 2 =:= 0 -> write('|     |') ; write('|:::::|')  ),
    nl.
drawrow3black(M,N,X) :-
    member(M,X),
    !,
    (   M mod 2 =:= 0 -> write('| ### ') ; write('|:###:')  ),
    M2 is M + 1,
    drawrow3black(M2,N,X).
drawrow3black(M,N,X) :-
    (   M mod 2 =:= 0 -> write('|     ') ; write('|:::::')  ),
    M2 is M + 1,
    drawrow3black(M2,N,X).

membernum(L,X,A) :-
    membernum(L,X,1,A).


membernum([],_,_,[]).
membernum([X|A],X,N,L) :-
    !,
    N1 is N + 1,
    membernum(A,X,N1,L2),
    append([N],L2,L).
membernum([_|A],X,N,L) :-
    N1 is N + 1,
    membernum(A,X,N1,L).

