

g(L, X) :-
    dictionary(L, X),
    not(has_shorter(L, X)),
    !.

list_length([], 0).
list_length([_ | T], Length) :-
    length(T, TailLength),
    Length is TailLength + 1.


get_subset([], []).
get_subset([X | T], [X | Res]) :-
    get_subset(T, Res).
get_subset([_ | T], Res) :-
    get_subset(T, Res).


dictionary(L, X) :-
    get_subset(L, X),
    not(incorrect_answer(L, X)).
    

incorrect_answer(L, D) :-
    member(W, L),
    not(has_unique_letter(W, D)).

has_unique_letter(W, D) :-
    member(Letter, W),
    member(Word, D),
    member(Letter, Word).


has_shorter(L, Res) :-
    dictionary(L, NewRes),
    list_length(Res, ResLength),
    list_length(NewRes, NewResLength),
    ResLength > NewResLength.

% g([[а], [а, б], [в]], X).
% g([[а], [а, б], [в]], X).
