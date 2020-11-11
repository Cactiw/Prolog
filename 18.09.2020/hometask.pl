
tree_depth(empty, 0).
tree_depth(tree(L, _, R), Res) :-
    tree_depth(L, LRes),
    tree_depth(R, RRes),
    Res is max(LRes, RRes) + 1.
