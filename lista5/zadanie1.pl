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


