
has_dbl([X, X | T]) :- !.
has_dbl([X | T]) :-
    has_dbl(T).

similar([], []).
similar([X | T1], [X | T2]) :-
    similar(T1, T2).
similar([ [X1 | T1] | L1 ], [ [X2 | T2] | L2 ]):-
    similar(L1, L2).

num_list(empty, 0) :- !.
num_list(tree(empty, empty, X), 1) :- !.
num_list(tree(L, R, X), Res) :-
    num_list(L, NL),
    num_list(R, NR),
    Res is NL + NR.

shrink(L, R) :- shrink(L, R, 2).
shrink([], [], Remain).
shrink(L, L, 0) :- !.
shrink([X | T], Res, Remain) :-
    Remain > 0,
    RemainNew is Remain - 1,
    shrink(T, Res, RemainNew).
shrink([X | T], [X | Res], Remain) :-
    shrink(T, Res, Remain).
