reverse([], []).
reverse([X|T], [X|Res]) :-
    reverse(T, Res).

% reverse([1, 2, 3, 4, 5], X).
