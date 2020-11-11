delete_first(_, [], []).
delete_first(E, [E|T], T) :- !.
delete_first(E, [X|T], [X|Res]) :-
    delete_first(E, T, Res).

% delete_first(1, [1, 2, 3, 4, 5], X).
