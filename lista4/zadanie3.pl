duze(K) :-
    L = [[1,2,3,4,7,11,14,18,21,22,23,24]],
    length(L,K).
srednie(K) :-
    numlist(1,24,X),
    L = [[1,2,4,6,11,13,15,16],[2,3,5,7,12,14,16,17],[8,9,11,13,18,20,22,23],[9,10,12,14,19,21,23,24]],
    srednie(X,L,K).
male(K) :-
    L = [[1,4,5,8],[2,5,6,9],[3,6,7,10],[8,11,12,15],[9,12,13,16],[10,13,14,17],[15,18,19,22],[16,19,20,23],[17,20,21,24]],
    length(L,K).

zapałki(N,( duze(D),srednie(S),male(M) )) :-
    (   D is 0 -> ZabronioneD = [1,2,3,4,7,11,14,18,21,22,23,24],KonieczneD = [] ; ZabronioneD = [],KonieczneD = [1,2,3,4,7,11,14,18,21,22,23,24] ),
    selectn(S,KonieczneS,[[1,2,4,6,11,13,15,16],[2,3,5,7,12,14,16,17],[8,9,11,13,18,20,22,23],[9,10,12,14,19,21,23,24]],ZabronioneS),
    selectn(M,KonieczneM,[[1,4,5,8],[2,5,6,9],[3,6,7,10],[8,11,12,15],[9,12,13,16],[10,13,14,17],[15,18,19,22],[16,19,20,23],[17,20,21,24]],ZabronioneM),
    bigunion(KonieczneM,KonieczneS,KonieczneD,K,[]),
    bigintersection(K,ZabronioneM,ZabronioneS,ZabronioneD),
    sort(K,Konieczne),
    length(Konieczne,N1),
    N is 24 - N1,

    writesolutionW([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24],Konieczne).

zapałki(N,( srednie(S),male(M) )) :-
    KonieczneD = [],
    ZabronioneD = [],
    selectn(S,KonieczneS,[[1,2,4,6,11,13,15,16],[2,3,5,7,12,14,16,17],[8,9,11,13,18,20,22,23],[9,10,12,14,19,21,23,24]],ZabronioneS),
    selectn(M,KonieczneM,[[1,4,5,8],[2,5,6,9],[3,6,7,10],[8,11,12,15],[9,12,13,16],[10,13,14,17],[15,18,19,22],[16,19,20,23],[17,20,21,24]],ZabronioneM),
    bigunion(KonieczneM,KonieczneS,KonieczneD,K,[]),
    bigintersection(K,ZabronioneM,ZabronioneS,ZabronioneD),
    sort(K,Konieczne),
    length(Konieczne,N1),
    N is 24 - N1,

    writesolutionW([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24],Konieczne).

zapałki(N,( duze(D),male(M) )) :-
    (   D is 0 -> ZabronioneD = [1,2,3,4,7,11,14,18,21,22,23,24],KonieczneD = [] ; ZabronioneD = [],KonieczneD = [1,2,3,4,7,11,14,18,21,22,23,24] ),
    KonieczneS = [],
    ZabronioneS = [],
    selectn(M,KonieczneM,[[1,4,5,8],[2,5,6,9],[3,6,7,10],[8,11,12,15],[9,12,13,16],[10,13,14,17],[15,18,19,22],[16,19,20,23],[17,20,21,24]],ZabronioneM),
    bigunion(KonieczneM,KonieczneS,KonieczneD,K,[]),
    bigintersection(K,ZabronioneM,ZabronioneS,ZabronioneD),
    sort(K,Konieczne),
    length(Konieczne,N1),
    N is 24 - N1,

    writesolutionW([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24],Konieczne).

zapałki(N,( duze(D),srednie(S))) :-
    (   D is 0 -> ZabronioneD = [1,2,3,4,7,11,14,18,21,22,23,24],KonieczneD = [] ; ZabronioneD = [],KonieczneD = [1,2,3,4,7,11,14,18,21,22,23,24] ),
    selectn(S,KonieczneS,[[1,2,4,6,11,13,15,16],[2,3,5,7,12,14,16,17],[8,9,11,13,18,20,22,23],[9,10,12,14,19,21,23,24]],ZabronioneS),
    KonieczneM = [],
    ZabronioneM = [],
    bigunion(KonieczneM,KonieczneS,KonieczneD,K,[]),
    bigintersection(K,ZabronioneM,ZabronioneS,ZabronioneD),
    sort(K,Konieczne),
    length(Konieczne,N1),
    N is 24 - N1,

    writesolutionW([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24],Konieczne).




writesolutionW(A,B) :-
    write('Rozwiązanie: '),
    nl,
    writesolution(A,B).
writesolution([],[]).
writesolution([A|L1],[B|L2]) :-
    (   1 =:= mod(A,7) ; 2 =:= mod(A,7) ),
    A = B,
    write('+--'),
    writesolution(L1,L2).
writesolution([A|L1],[B|L2]) :-
    (   1 =:= mod(A,7) ; 2 =:= mod(A,7) ),
    A \= B,
    write('+  '),
    writesolution(L1,[B|L2]).
writesolution([A|L1],[]) :-
    (   1 =:= mod(A,7) ; 2 =:= mod(A,7) ),
    write('+  '),
    writesolution(L1,[]).
writesolution([A|L1],[B|L2]) :-
    3 =:= mod(A,7),
    A = B,
    write('+--+'),
    nl,
    writesolution(L1,L2).
writesolution([A|L1],[B|L2]) :-
    3 =:= mod(A,7),
    A \= B,
    write('+  +'),
    nl,
    writesolution(L1,[B|L2]).
writesolution([A|L1],[]) :-
    3 =:= mod(A,7),
    write('+  +'),
    nl,
    writesolution(L1,[]).
writesolution([A|L1],[B|L2]) :-
    (   4 =:= mod(A,7) ; 5 =:= mod(A,7) ; 6 =:= mod(A,7) ),
    A = B,
    write('|  '),
    writesolution(L1,L2).
writesolution([A|L1],[B|L2]) :-
    (   4 =:= mod(A,7) ; 5 =:= mod(A,7) ; 6 =:= mod(A,7) ),
    A \= B,
    write('   '),
    writesolution(L1,[B|L2]).
writesolution([A|L1],[]) :-
    (   4 =:= mod(A,7) ; 5 =:= mod(A,7) ; 6 =:= mod(A,7) ),
    write('   '),
    writesolution(L1,[]).
writesolution([A|L1],[B|L2]) :-
    0 =:= mod(A,7),
    A = B,
    write('|'),
    nl,
    writesolution(L1,L2).
writesolution([A|L1],[B|L2]) :-
    0 =:= mod(A,7),
    A \= B,
    write(' '),
    nl,
    writesolution(L1,[B|L2]).
writesolution([A|L1],[]) :-
    0 =:= mod(A,7),
    write(' '),
    nl,
    writesolution(L1,[]).



bigunion([],[],[],X,X) :-!.
bigunion([X|M],S,D,U,Acc) :-
    union(X,Acc,Acc2),
    bigunion(M,S,D,U,Acc2).
bigunion([],[X|S],D,U,Acc) :-
    union(X,Acc,Acc2),
    bigunion([],S,D,U,Acc2).
bigunion([],[],D,U,Acc) :-
    union(D,Acc,Acc2),
    bigunion([],[],[],U,Acc2).

bigintersection(K,[X|M],S,D) :-
    intersection(K,X,R),
    sort(R,R1),
    R1 \= X,
    bigintersection(K,M,S,D).
bigintersection(K,[],[X|S],D) :-
    intersection(K,X,R),
    sort(R,R1),
    R1 \= X,
    bigintersection(K,[],S,D).
bigintersection(K,[],[],D) :-
    intersection(K,D,R),
    sort(R,R1),
    R1 \= D.
bigintersection(_,[],[],[]).



selectn(0, [], Rest, Rest).
selectn(N, [A|B], C, Rest) :-
    append(H, [A|T], C),
    M is N-1,
    selectn(M, B, T, S),
    append(H, S, Rest).

