czytaj([H | T], H, T).
pisz(H, [H | T], T).
zamknij([]).

merge(In1,In2,Out) :-
    freeze(In1,
           (   czytaj(In1,I1,In1_) % jesli pierwszy strumien jest niepusty
           ->  merge1(In1_,In2,Out,I1) % sprobuj porownac go z elementem z drugiego strumienia
           ;   freeze(In2,
                      (   czytaj(In2,I2,In2_)
                      ->  merge2(In1,In2_,Out,I2)
                      ;   zamknij(Out))))).

% porownanie elementu z drugim strumieniem
merge1(In1,In2,Out,N1) :-
    freeze(In2,
           (   czytaj(In2,I2,In2_)
           ->  ( N1 < I2
               ->  pisz(N1,Out,Out_),
                   merge2(In1,In2_,Out_,I2)
               ;   pisz(I2,Out,Out_),
                   merge1(In1,In2_,Out_,N1))
           ;   totheend(In1,Out,N1))).

% porownianie elementu z pierwszym strumieniem
merge2(In1,In2,Out,N2) :-
    freeze(In1,
           (   czytaj(In1,I1,In1_)
           ->  ( N2 < I1
               ->  pisz(N2,Out,Out_),
                   merge1(In1_,In2,Out_,I1)
               ;   pisz(I1,Out,Out_),
                   merge2(In1_,In2,Out_,N2))
           ;   totheend(In2,Out,N2))).

% jeden ze strumieni sie skonczyl, wiec ten drugi wypisujemy do konca
totheend(In,Out,N) :-
    freeze(In,
           (   czytaj(In,I,In_)
           ->  (   N < I
               ->  pisz(N,Out,Out_),
                   totheend(In_,Out_,I)
               ;   pisz(I,Out,Out_),
                   totheend(In_,Out_,N))
           ;   pisz(N,Out,[]))). % koniec! mozna zamknac strumien Out

