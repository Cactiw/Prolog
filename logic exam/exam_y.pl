
list_length([], 0).
list_length([_ | T], Length) :-
    length(T, TailLength),
    Length is TailLength + 1.

g(L, Res) :-
    get_suitable_answer(L, Res),
    not(has_shorter(L, Res)),
    !.

has_shorter(L, Res) :-
    get_suitable_answer(L, NewRes),
    list_length(Res, ResLength),
    list_length(NewRes, NewResLength),
    ResLength > NewResLength.


get_suitable_answer(L, Res) :-
    subset(L, Res),
    not(check_list(L, Res)).


check_list(L, Res) :-
    member(X, L),
    \+ has_sum(X, Res).


subset([], []).
subset([_ | T], Res) :-
    subset(T, Res).
subset([X | T], [X | Res]) :-
    subset(T, Res).

has_sum(E, L) :-
    member(X, L),
    member(Y, L),
    E is X + Y.  % Нет проверки на неравенство, так как элементы могут быть одинаковыми.


