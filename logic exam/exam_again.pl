

addict(X, L) :-
    member(X1, L),
    member(X2, L),
    X is X1 + X2.


can_not_addict(L1, L2):-
    member(X, L1),
    not(addict(X, L2)).
    


all_addict(L1, L2):-
    not(can_not_addict(L1, L2)).
