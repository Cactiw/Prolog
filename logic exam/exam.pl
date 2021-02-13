
% 4 - (i, i, o), (i, i, i), (o, i, i), (i, o, i)
delete_all(_, [], []).
delete_all(E, [E|T], Res) :-
    !, delete_all(E, T, Res).
delete_all(E, [X|T], [X|Res]) :-
    delete_all(E, T, Res).

g(L, X) :-
    member(X, L),
    delete_all(X, L, LRes),
    test_elem(LRes, X),

    not(has_greater(L, X)),
    !.  


has_greater(L, X) :-
    member(Y, L),
    Y > X,
    delete_all(Y, L, LWithoutY),
    test_elem(LWithoutY, Y).


test_elem(L, E) :-
    test_elem(L, E, 0).
test_elem(L, E, E) :-
    !.
test_elem([X | T], E, CurSum) :-
    NewSum is CurSum + X,
    test_elem(T, E, NewSum).
test_elem([X | T], E, CurSum) :-
    test_elem(T, E, CurSum).
