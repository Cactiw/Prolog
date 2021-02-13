
list_length([], 0).
list_length([_ | T], Answer) :-
    list_length(T, Res),
    Answer is Res + 1.

g(L, N, Res) :-
    get_subset(L, Res),
    list_length(Res, N),
    all_prime(Res),
    !.


get_subset([], []).
get_subset([X | T], [X | Res]) :-
    get_subset(T, Res).
get_subset([_ | T], Res) :-
    get_subset(T, Res).
    


all_prime(L) :-
    not(has_other_prime(L)).
    
    

has_other_prime(L) :-
    member(X, L),
    member(Y, L),
    Y \== X,
    \+ is_prime(Y, X).


is_prime(A, B) :-
    gcd(A, B, Res),
    Res = 1.

gcd(A, B, Divisor):-
    B > A, !, gcd(B, A, Divisor).
gcd(A, B, Divisor):-
    A > B, !, Difference is A - B,
    gcd(Difference, B, Divisor).
gcd(Divisor, Divisor, Divisor).
