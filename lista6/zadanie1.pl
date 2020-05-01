biały(' ' ).
biały('\t').
biały('\n').
znak('+').
znak('-').
znak('<').
znak('>').
znak(';').
znak('*').
znak('=').
znak('/').
znak(':').
znak('(').
znak(')').


scanner(Stream,Tokens) :-
    czytaj(Stream,Tokens).

czytaj(S,X) :-
    get_char(S,C),
    czytaj_dalej(S,C,X).

czytaj_dalej(_,end_of_file,[]) :-
    !.
czytaj_dalej(S,C1,X) :-
    biały(C1),
    !,
    get_char(S,C2),
    czytaj_dalej(S,C2,X).
czytaj_dalej(S,C1,TT) :-
    znak(C1),
    !,
    czytaj_znak(S,C1,C2, '',H),
    zmień_słowo(H,HHH),
    czytaj_dalej(S,C2,T),
    append([HHH],T,TT).
czytaj_dalej(S,C1,TT) :-
    czytaj_słowo(S,C1,C2, '',H),
    zmień_słowo(H,HHH),
    czytaj_dalej(S,C2,T),
    append([HHH],T,TT).

czytaj_słowo(_,end_of_file,end_of_file,N,N) :-
    !.
czytaj_słowo(_,C,C,N,N) :-
    biały(C),
    !.
czytaj_słowo(_,C,C,N,N) :-
    znak(C),
    !.
czytaj_słowo(S,C1,C3,N1,N) :-
    atom_concat(N1,C1,N2),
    get_char(S,C2),
    czytaj_słowo(S,C2,C3,N2,N).

czytaj_znak(_,end_of_file,end_of_file,N,N) :-
    !.
czytaj_znak(_,C,C,N,N) :-
    \+ znak(C),
    !.
czytaj_znak(S,C1,C3,N1,N) :-
    atom_concat(N1,C1,N2),
    get_char(S,C2),
    czytaj_znak(S,C2,C3,N2,N).


zmień_słowo('read',key(read)) :- !.
zmień_słowo('write',key(write)) :- !.
zmień_słowo('if',key(if)) :- !.
zmień_słowo('then',key(then)) :- !.
zmień_słowo('else',key(else)) :- !.
zmień_słowo('fi',key(fi)) :- !.
zmień_słowo('while',key(while)) :- !.
zmień_słowo('do',key(do)) :- !.
zmień_słowo('od',key(od)) :- !.
zmień_słowo('and',key(and)) :- !.
zmień_słowo('or',key(or)) :- !.
zmień_słowo('mod',key(mod)) :- !.

zmień_słowo(;,sep(;)) :- !.
zmień_słowo(+,sep(+)) :- !.
zmień_słowo(-,sep(-)) :- !.
zmień_słowo(*,sep(*)) :- !.
zmień_słowo(/,sep(/)) :- !.
zmień_słowo('(','sep(()') :- !.
zmień_słowo(')','sep())') :- !.
zmień_słowo(=<,sep(=<)) :- !.
zmień_słowo(>=,sep(>=)) :- !.
zmień_słowo(<,sep(<)) :- !.
zmień_słowo(>,sep(>)) :- !.
zmień_słowo(:=,sep(:=)) :- !.
zmień_słowo(/=,sep(/=)) :- !.
zmień_słowo(=,sep(=)) :- !.
zmień_słowo(Upper,id(Upper)) :-
    upcase_atom(Upper,X),
    X == Upper,
    !.
   % get_string_code(1,Upper,First),code_type(First,upper),!
zmień_słowo(Number,int(X)) :- atom_number(Number,X),!.

zmień_słowo(H,H) :- write('Nielegalne słowo: '), write(H),nl.


program([]) --> [].
program([I|L]) --> instrukcja(I), [sep(;)], program(L).

instrukcja(read(ID)) --> [key(read)], [id(ID)].
instrukcja(assign(ID,WYRAŻENIE)) --> [id(ID)], [sep(:=)], wyrażenie(WYRAŻENIE).
instrukcja(write(WYRAŻENIE)) --> [key(write)], wyrażenie(WYRAŻENIE).
instrukcja(if(WARUNEK, PROGRAM)) --> [key(if)], warunek(WARUNEK), [key(then)], program(PROGRAM), [key(fi)].
instrukcja(if(WARUNEK, PROGRAM, PROGRAM2)) --> [key(if)], warunek(WARUNEK), [key(then)], program(PROGRAM), [key(else)], program(PROGRAM2), [key(fi)].
instrukcja(while(WARUNEK, PROGRAM)) --> [key(while)], warunek(WARUNEK), [key(do)], program(PROGRAM), [key(od)].

wyrażenie(id(ID)) --> [id(ID)].
wyrażenie(int(NUM)) --> [int(NUM)].
wyrażenie(id(ID) + WYRAŻENIE2) --> [id(ID)], [sep(+)], wyrażenie(WYRAŻENIE2).
wyrażenie(int(NUM) + WYRAŻENIE2) --> [int(NUM)], [sep(+)], wyrażenie(WYRAŻENIE2).
wyrażenie(id(ID) - WYRAŻENIE2) --> [id(ID)], [sep(-)], wyrażenie(WYRAŻENIE2).
wyrażenie(int(NUM) - WYRAŻENIE2) --> [int(NUM)], [sep(-)], wyrażenie(WYRAŻENIE2).
wyrażenie(id(ID) * WYRAŻENIE2) --> [id(ID)], [sep(*)], wyrażenie(WYRAŻENIE2).
wyrażenie(int(NUM) * WYRAŻENIE2) --> [int(NUM)], [sep(*)], wyrażenie(WYRAŻENIE2).
wyrażenie(id(ID) / WYRAŻENIE2) --> [id(ID)], [sep(/)], wyrażenie(WYRAŻENIE2).
wyrażenie(int(NUM) / WYRAŻENIE2) --> [int(NUM)], [sep(/)], wyrażenie(WYRAŻENIE2).
wyrażenie(id(ID) mod WYRAŻENIE2) --> [id(ID)], [key(mod)], wyrażenie(WYRAŻENIE2).
wyrażenie(int(NUM) mod WYRAŻENIE2) --> [int(NUM)], [key(mod)], wyrażenie(WYRAŻENIE2).
% wyrażenie(WYRAŻENIE1 - WYRAŻENIE2) --> wyrażenie(WYRAŻENIE1), [sep(-)],
% wyrażenie(WYRAŻENIE2).
% wyrażenie(WYRAŻENIE1 * WYRAŻENIE2) --> wyrażenie(WYRAŻENIE1), [sep(*)],
% wyrażenie(WYRAŻENIE2).
% wyrażenie(WYRAŻENIE1 / WYRAŻENIE2) --> wyrażenie(WYRAŻENIE1), [sep(/)],
% wyrażenie(WYRAŻENIE2).
% wyrażenie(WYRAŻENIE1 mod WYRAŻENIE2) --> wyrażenie(WYRAŻENIE1),
% [key(mod)], wyrażenie(WYRAŻENIE2).

warunek(WYRAŻENIE1 =:= WYRAŻENIE2) --> wyrażenie(WYRAŻENIE1), [sep(=)], wyrażenie(WYRAŻENIE2).
warunek(WYRAŻENIE1 =\= WYRAŻENIE2) --> wyrażenie(WYRAŻENIE1), [sep(/=)], wyrażenie(WYRAŻENIE2).
warunek(WYRAŻENIE1 < WYRAŻENIE2) --> wyrażenie(WYRAŻENIE1), [sep(<)], wyrażenie(WYRAŻENIE2).
warunek(WYRAŻENIE1 > WYRAŻENIE2) --> wyrażenie(WYRAŻENIE1), [sep(>)], wyrażenie(WYRAŻENIE2).
warunek(WYRAŻENIE1 =< WYRAŻENIE2) --> wyrażenie(WYRAŻENIE1), [sep(=<)], wyrażenie(WYRAŻENIE2).
warunek(WYRAŻENIE1 >= WYRAŻENIE2) --> wyrażenie(WYRAŻENIE1), [sep(>=)], wyrażenie(WYRAŻENIE2).

warunek(WYRAŻENIE1 =:= WYRAŻENIE2 ; WARUNEK2) --> wyrażenie(WYRAŻENIE1), [sep(=)], wyrażenie(WYRAŻENIE2), [key(or)], warunek(WARUNEK2).
warunek(WYRAŻENIE1 =\= WYRAŻENIE2 ; WARUNEK2) --> wyrażenie(WYRAŻENIE1), [sep(/=)], wyrażenie(WYRAŻENIE2), [key(or)], warunek(WARUNEK2).
warunek(WYRAŻENIE1 < WYRAŻENIE2 ; WARUNEK2) --> wyrażenie(WYRAŻENIE1), [sep(<)], wyrażenie(WYRAŻENIE2), [key(or)], warunek(WARUNEK2).
warunek(WYRAŻENIE1 > WYRAŻENIE2 ; WARUNEK2) --> wyrażenie(WYRAŻENIE1), [sep(>)], wyrażenie(WYRAŻENIE2), [key(or)], warunek(WARUNEK2).
warunek(WYRAŻENIE1 =< WYRAŻENIE2 ; WARUNEK2) --> wyrażenie(WYRAŻENIE1), [sep(=<)], wyrażenie(WYRAŻENIE2), [key(or)], warunek(WARUNEK2).
warunek(WYRAŻENIE1 >= WYRAŻENIE2 ; WARUNEK2) --> wyrażenie(WYRAŻENIE1), [sep(>=)], wyrażenie(WYRAŻENIE2), [key(or)], warunek(WARUNEK2).

warunek(WYRAŻENIE1 =:= WYRAŻENIE2 ',' WARUNEK2) --> wyrażenie(WYRAŻENIE1), [sep(=)], wyrażenie(WYRAŻENIE2), [key(and)], warunek(WARUNEK2).
warunek(WYRAŻENIE1 =\= WYRAŻENIE2 ',' WARUNEK2) --> wyrażenie(WYRAŻENIE1), [sep(/=)], wyrażenie(WYRAŻENIE2), [key(and)], warunek(WARUNEK2).
warunek(WYRAŻENIE1 < WYRAŻENIE2 ',' WARUNEK2) --> wyrażenie(WYRAŻENIE1), [sep(<)], wyrażenie(WYRAŻENIE2), [key(and)], warunek(WARUNEK2).
warunek(WYRAŻENIE1 > WYRAŻENIE2 ',' WARUNEK2) --> wyrażenie(WYRAŻENIE1), [sep(>)], wyrażenie(WYRAŻENIE2), [key(and)], warunek(WARUNEK2).
warunek(WYRAŻENIE1 =< WYRAŻENIE2 ',' WARUNEK2) --> wyrażenie(WYRAŻENIE1), [sep(=<)], wyrażenie(WYRAŻENIE2), [key(and)], warunek(WARUNEK2).
warunek(WYRAŻENIE1 >= WYRAŻENIE2 ',' WARUNEK2) --> wyrażenie(WYRAŻENIE1), [sep(>=)], wyrażenie(WYRAŻENIE2), [key(and)], warunek(WARUNEK2).



% warunek(WARUNEK1 ; WARUNEK2) --> warunek(WARUNEK1), [key(or)],
% warunek(WARUNEK2). warunek(WARUNEK1 ',' WARUNEK2) -->
% warunek(WARUNEK1), [key(and)], warunek(WARUNEK2).
