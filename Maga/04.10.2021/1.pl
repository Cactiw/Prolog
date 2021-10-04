

% A2
prefix([], _).
prefix([X1|L1],[X1|L2]) :-
    prefix(L1, L2).



% 13 - (i, i), (o, i)
% B4
% sub_tree(empty, empty).
sub_tree(tree(L1, X, R1), tree(L1, X, R1)).
sub_tree(tree(L1, X1, R1), tree(L2, Y, R2)) :-
    sub_tree(tree(L1, X1, R1), L2).
sub_tree(tree(L1, X1, R1), tree(L2, Y, R2)) :-
    sub_tree(tree(L1, X1, R1), R2).


% C1
replaceAll(empty, _, empty, _).
replaceAll(tree(V1, L1, R1), V1, tree(V2, TreeLeft, TreeRight), V2) :-
    replaceAll(L1, V1, TreeLeft, V2),
    replaceAll(R1, V1, TreeRight, V2).
replaceAll(tree(X1, L1, R1), V1, tree(X1, TreeLeft, TreeRight), V2) :-
    replaceAll(L1, V1, TreeLeft, V2),
    replaceAll(R1, V1, TreeRight, V2).


% C4
mirror(empty, empty).
mirror(tree(V, L1, R1), tree(V, RightResult, LeftResult)) :-
    mirror(R1, RightResult),
    mirror(L1, LeftResult).



prefix1([], _).
prefix1([X | Xs],  [X | Res]) :-
    prefix1(Xs, Res).
