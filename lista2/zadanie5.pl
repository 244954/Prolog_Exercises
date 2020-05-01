% calc(Mo�liwy wierzcho�ek,
% Jeszcze niemo�liwe wierzcho�ki,
% Wierzcho�ki kt�rych nie mo�e by� poniewa� od ostatniego wyst�pienia
% jest nieparzysta ilo�� wierzcho�k�w,
% Mo�liwe wierzcho�ki, gdy� dzieli je parzysta ilo��,
% Ci�g do kt�rego d��ymy,
% Do tej pory zbudowany ci�g,
% D�ugo�� listy celu (konieczna, gdy� ten nie musi by� dany) )

calc(_,_,_,_,Target,Curr,M) :- % koniec rekursji, gdy jest zgodno�� ze wzorcem
    length(Curr,M),
    Curr = Target.
calc([Poss|_],[],Odd,Even,Target,Curr,Len) :- % Poss trafia do ciagu i zostaje puste
    \+ length([Poss],0),
    \+ length(Curr,Len),
    % select(Poss,Next,Curr),
    append(Curr,[Poss],Next),
    append([Poss],Odd,New),
    calc([],[],Even,New,Target,Next,Len).
calc([Poss|_],[Y|Imposs],Odd,Even,Target,Curr,Len) :- % Poss trafia do ciagu i zostaje zast�pnione przez wyraz z Imposs
    \+ length(Curr,Len),
    % select(Poss,Next,Curr),
    append(Curr,[Poss],Next),
    append([Poss],Odd,New),
    calc([Y],Imposs,Even,New,Target,Next,Len).

calc(Poss,Imposs,Odd,Even,Target,Curr,Len) :- % Even trafia do ciagu
    \+ length(Curr,Len),
    select(X,Even,Next),
    append(Curr,[X],NextCurr),
    calc(Poss,Imposs,Next,Odd,Target,NextCurr,Len).




lista(N,Target) :-
    numlist(1,N,L), % L = [1,2,...,N]
    select(1,L,L2), % L2 = [2,3,...,N] czyli jeszcze niemo�liwe wierzcho�ki
    M is N * 2,
    calc([1],L2,[],[],Target,[],M). % (Possible,Impossible,Odd,Even,Target,Current,Length)
