bia�y(' ' ).
bia�y('\t').
bia�y('\n').
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
    bia�y(C1),
    !,
    get_char(S,C2),
    czytaj_dalej(S,C2,X).
czytaj_dalej(S,C1,TT) :-
    znak(C1),
    !,
    czytaj_znak(S,C1,C2, '',H),
    zmie�_s�owo(H,HHH),
    czytaj_dalej(S,C2,T),
    append([HHH],T,TT).
czytaj_dalej(S,C1,TT) :-
    czytaj_s�owo(S,C1,C2, '',H),
    zmie�_s�owo(H,HHH),
    czytaj_dalej(S,C2,T),
    append([HHH],T,TT).

czytaj_s�owo(_,end_of_file,end_of_file,N,N) :-
    !.
czytaj_s�owo(_,C,C,N,N) :-
    bia�y(C),
    !.
czytaj_s�owo(_,C,C,N,N) :-
    znak(C),
    !.
czytaj_s�owo(S,C1,C3,N1,N) :-
    atom_concat(N1,C1,N2),
    get_char(S,C2),
    czytaj_s�owo(S,C2,C3,N2,N).

czytaj_znak(_,end_of_file,end_of_file,N,N) :-
    !.
czytaj_znak(_,C,C,N,N) :-
    \+ znak(C),
    !.
czytaj_znak(S,C1,C3,N1,N) :-
    atom_concat(N1,C1,N2),
    get_char(S,C2),
    czytaj_znak(S,C2,C3,N2,N).


zmie�_s�owo('read',key(read)) :- !.
zmie�_s�owo('write',key(write)) :- !.
zmie�_s�owo('if',key(if)) :- !.
zmie�_s�owo('then',key(then)) :- !.
zmie�_s�owo('else',key(else)) :- !.
zmie�_s�owo('fi',key(fi)) :- !.
zmie�_s�owo('while',key(while)) :- !.
zmie�_s�owo('do',key(do)) :- !.
zmie�_s�owo('od',key(od)) :- !.
zmie�_s�owo('and',key(and)) :- !.
zmie�_s�owo('or',key(or)) :- !.
zmie�_s�owo('mod',key(mod)) :- !.

zmie�_s�owo(;,sep(;)) :- !.
zmie�_s�owo(+,sep(+)) :- !.
zmie�_s�owo(-,sep(-)) :- !.
zmie�_s�owo(*,sep(*)) :- !.
zmie�_s�owo(/,sep(/)) :- !.
zmie�_s�owo('(','sep(()') :- !.
zmie�_s�owo(')','sep())') :- !.
zmie�_s�owo(=<,sep(=<)) :- !.
zmie�_s�owo(>=,sep(>=)) :- !.
zmie�_s�owo(<,sep(<)) :- !.
zmie�_s�owo(>,sep(>)) :- !.
zmie�_s�owo(:=,sep(:=)) :- !.
zmie�_s�owo(/=,sep(/=)) :- !.
zmie�_s�owo(=,sep(=)) :- !.
zmie�_s�owo(Upper,id(Upper)) :-
    upcase_atom(Upper,X),
    X == Upper,
    !.
   % get_string_code(1,Upper,First),code_type(First,upper),!
zmie�_s�owo(Number,int(X)) :- atom_number(Number,X),!.

zmie�_s�owo(H,H) :- write('Nielegalne s�owo: '), write(H),nl.


