delete_all(_, [], []).
delete_all(E, [E|T], Res) :-
    !, delete_all(E, T, Res).
delete_all(E, [X|T], [X|Res]) :-
    delete_all(E, T, Res).

% delete_all(1, [1, 2, 3, 4, 5], X).
% delete_all(5, [1, 2, 3, 4, 5, 5, 5, 5, 1, 1, 1], X).
% delete_all(6, [1, 2, 3, 4, 5, 5, 5, 5, 1, 1, 1], X).
