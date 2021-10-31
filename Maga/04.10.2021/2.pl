
% A1
numLabel(empty, _, 0).
numLabel(tree(V, L, R), V, Result) :-
    !,
    numLabel(L, V, ResL),
    numLabel(R, V, ResR),
    Result is ResL + ResR + 1.
numLabel(tree(X, L, R), V, Result) :-
    numLabel(L, V, ResL),
    numLabel(R, V, ResR),
    Result is ResL + ResR.


% B2
number(E, Bag, L) :-
    findall(N, count_number(E, 0, L, N), Bag).
    % count_number(E, 0, L, N).

count_number(E, N, [E|T], N).
count_number(E, N, [X|T], Res) :-
    N1 is N + 1,
    count_number(E, N1, T, Res).


