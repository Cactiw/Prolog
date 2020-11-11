delete_one(E, [E|T], T).
delete_one(E, [X|T], [X|Res]) :-
    delete_one(E, T, Res).

% delete_one(1, [1, 2, 3, 4, 5], X).
% delete_one(5, [1, 5, 1, 5, 1, 5, 1], X).
