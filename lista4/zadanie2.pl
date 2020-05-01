% Ld - lista domków od lewej do prawej
% Każdy domek reprezentowany przez d(Kolor, Mieszkaniec, Zwierzę, Pićko,
% Fajki)
rybki(Kto):-
    domki(Ld),
    member(d(_,Kto,rybki,_,_),Ld).

domki(Ld) :-
    % 1. Norweg zamieszkuje pierwszy dom
    Ld = [d(_,norweg,_,_,_),_,_,_,_],
    % 2. Anglik mieszka w czerwonym domu.
    member(d(czerwony,anglik,_,_,_),Ld),
    % 3. Zielony dom znajduje się bezpośrednio po lewej stronie domu białego.
    (
        Ld = [d(zielony,_,_,_,_),d(biały,_,_,_,_),_,_,_] ;
        Ld = [_,d(zielony,_,_,_,_),d(biały,_,_,_,_),_,_] ;
        Ld = [_,_,d(zielony,_,_,_,_),d(biały,_,_,_,_),_] ;
        Ld = [_,_,_,d(zielony,_,_,_,_),d(biały,_,_,_,_)]
    ),
    % 4. Duńczyk pija herbatkę.
    member(d(_,duńczyk,_,herbatka,_),Ld),
    % 5. Palacz papierosów light mieszka obok hodowcy kotów.
    obok(d(_,_,_,_,light),d(_,_,koty,_,_),Ld),
    % 6. Mieszkaniec żółtego domu pali cygara.
    member(d(żółty,_,_,_,cygara),Ld),
    % 7. Niemiec pali fajkę.
    member(d(_,niemiec,_,_,fajka),Ld),
    % 8. Mieszkaniec środkowego domu pija mleko.
    Ld = [_,_,d(_,_,_,mleko,_),_,_],
    % 9. Palacz papierosów light ma sąsiada, który pija wodę.
    obok(d(_,_,_,_,light),d(_,_,_,woda,_),Ld),
    % 10. Palacz papierosów bez filtra hoduje ptaki.
    member(d(_,_,ptaki,_,bezfiltra),Ld),
    % 11. Szwed hoduje psy.
    member(d(_,szwed,psy,_,_),Ld),
    % 12. Norweg mieszka obok niebieskiego domu.
    obok(d(_,norweg,_,_,_),d(niebieski,_,_,_,_),Ld),
    % 13. Hodowca koni mieszka obok żółtego domu.
    obok(d(_,_,konie,_,_),d(żółty,_,_,_,_),Ld),
    % 14. Palacz mentolowych pija piwo.
    member(d(_,_,_,piwo,mentolowe),Ld),
    % 15. W zielonym domu pija się kawę.
    member(d(zielony,_,_,kawa,_),Ld),
    % Kto choduje rybki?
    member(d(_,_,rybki,_,_),Ld).


obok(A,B,L) :- L = [A,B | _].
obok(A,B,L) :- L = [B,A | _].
obok(A,B,[_|L]) :- obok(A,B,L).
