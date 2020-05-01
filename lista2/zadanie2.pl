jednokrotnie(X,[X]).
jednokrotnie(X,[X|Y]) :- czydrugi(X,Y).
jednokrotnie(X,[Z|Y]) :- jednokrotnie(X,Y), Z \= X.
czydrugi(_,[]).
czydrugi(X,[Y|Z]) :- czydrugi(X,Z), X \= Y.

dwukrotnie(X,[X,X]).
dwukrotnie(X,[X|Y]) :- pierwszy(X,Y).
dwukrotnie(X,[Z|Y]) :- dwukrotnie(X,Y), Z \= X.
pierwszy(X,[X|Y]) :- drugi(X,Y).
pierwszy(X,[Z|Y]) :- pierwszy(X,Y), Z \= X.
drugi(_,[]).
drugi(X,[Y|Z]) :- X \= Y, drugi(X,Z).
