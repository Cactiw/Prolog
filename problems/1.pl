append(l1, [], l1).
append(l1, [X|T], Res) :-
    append([l1|X], [T], Res).

% append([1, 2, 3], [4, 5, 6], X).
