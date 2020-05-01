bia造(' ' ).
bia造('\t').
bia造('\n').
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
    bia造(C1),
    !,
    get_char(S,C2),
    czytaj_dalej(S,C2,X).
czytaj_dalej(S,C1,TT) :-
    znak(C1),
    !,
    czytaj_znak(S,C1,C2, '',H),
    zmie鎕s這wo(H,HHH),
    czytaj_dalej(S,C2,T),
    append([HHH],T,TT).
czytaj_dalej(S,C1,TT) :-
    czytaj_s這wo(S,C1,C2, '',H),
    zmie鎕s這wo(H,HHH),
    czytaj_dalej(S,C2,T),
    append([HHH],T,TT).

czytaj_s這wo(_,end_of_file,end_of_file,N,N) :-
    !.
czytaj_s這wo(_,C,C,N,N) :-
    bia造(C),
    !.
czytaj_s這wo(_,C,C,N,N) :-
    znak(C),
    !.
czytaj_s這wo(S,C1,C3,N1,N) :-
    atom_concat(N1,C1,N2),
    get_char(S,C2),
    czytaj_s這wo(S,C2,C3,N2,N).

czytaj_znak(_,end_of_file,end_of_file,N,N) :-
    !.
czytaj_znak(_,C,C,N,N) :-
    \+ znak(C),
    !.
czytaj_znak(S,C1,C3,N1,N) :-
    atom_concat(N1,C1,N2),
    get_char(S,C2),
    czytaj_znak(S,C2,C3,N2,N).


zmie鎕s這wo('read',key(read)) :- !.
zmie鎕s這wo('write',key(write)) :- !.
zmie鎕s這wo('if',key(if)) :- !.
zmie鎕s這wo('then',key(then)) :- !.
zmie鎕s這wo('else',key(else)) :- !.
zmie鎕s這wo('fi',key(fi)) :- !.
zmie鎕s這wo('while',key(while)) :- !.
zmie鎕s這wo('do',key(do)) :- !.
zmie鎕s這wo('od',key(od)) :- !.
zmie鎕s這wo('and',key(and)) :- !.
zmie鎕s這wo('or',key(or)) :- !.
zmie鎕s這wo('mod',key(mod)) :- !.

zmie鎕s這wo(;,sep(;)) :- !.
zmie鎕s這wo(+,sep(+)) :- !.
zmie鎕s這wo(-,sep(-)) :- !.
zmie鎕s這wo(*,sep(*)) :- !.
zmie鎕s這wo(/,sep(/)) :- !.
zmie鎕s這wo('(','sep(()') :- !.
zmie鎕s這wo(')','sep())') :- !.
zmie鎕s這wo(=<,sep(=<)) :- !.
zmie鎕s這wo(>=,sep(>=)) :- !.
zmie鎕s這wo(<,sep(<)) :- !.
zmie鎕s這wo(>,sep(>)) :- !.
zmie鎕s這wo(:=,sep(:=)) :- !.
zmie鎕s這wo(/=,sep(/=)) :- !.
zmie鎕s這wo(=,sep(=)) :- !.
zmie鎕s這wo(Upper,id(Upper)) :-
    upcase_atom(Upper,X),
    X == Upper,
    !.
   % get_string_code(1,Upper,First),code_type(First,upper),!
zmie鎕s這wo(Number,int(X)) :- atom_number(Number,X),!.

zmie鎕s這wo(H,H) :- write('Nielegalne s這wo: '), write(H),nl.


