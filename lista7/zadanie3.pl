filozofowie :-
    mutex_create(Widelec1),
    mutex_create(Widelec2),
    mutex_create(Widelec3),
    mutex_create(Widelec4),
    mutex_create(Widelec5),
    thread_create(filozof(1,Widelec1,Widelec2),_,[detached(true)]),
    thread_create(filozof(2,Widelec2,Widelec3),_,[detached(true)]),
    thread_create(filozof(3,Widelec3,Widelec4),_,[detached(true)]),
    thread_create(filozof(4,Widelec4,Widelec5),_,[detached(true)]),
    thread_create(filozof(5,Widelec5,Widelec1),_,[detached(true)]).

filozof(Id,Prawywidelec,Lewywidelec) :-
    format("~a ~a~n",[Id,'mysli']),
    format("~a ~a~n",[Id,'chce prawy widelec']),
    mutex_lock(Prawywidelec),
    format("~a ~a~n",[Id,'podnosi prawy widelec']),
    format("~a ~a~n",[Id,'chce lewy widelec']),
    mutex_lock(Lewywidelec),
    format("~a ~a~n",[Id,'podnosi lewy widelec']),
    format("~a ~a~n",[Id,'je']),
    mutex_unlock(Prawywidelec),
    format("~a ~a~n",[Id,'odklada prawy widelec']),
    mutex_unlock(Lewywidelec),
    format("~a ~a~n",[Id,'odklada lewy widelec']),
    filozof(Id,Prawywidelec,Lewywidelec).

% jest możliwe, że wszystkie wątki się wzajemnie poblokują
% kiedy wszyscy naraz sięgną po swoje prawe widelce, będą wieczność czekać na lewe

