% 1 - любые прототипы, 
my_append([], L, L).
my_append([X|L1], L2, [X|L3]):- my_append(L1, L2, L3).

% 2 - (i, o), (i, i), (o, i)
reverse(L1, L2) :- reverse(L1, [], L2).
reverse([], X, X).
reverse([X|T], Ac, L2) :-
    reverse(T, [X|Ac], L2).

% 3 - (i, i, o), (i, i, i), (o, i, i), (i, o, i)
delete_first(E, [E|T], T) :- !.
delete_first(E, [X|T], [X|Res]) :-
    delete_first(E, T, Res).

% 4 - (i, i, o), (i, i, i), (o, i, i), (i, o, i)
delete_all(_, [], []).
delete_all(E, [E|T], Res) :-
    !, delete_all(E, T, Res).
delete_all(E, [X|T], [X|Res]) :-
    delete_all(E, T, Res).

% 5 - (i, i, o), (i, i, i), (o, i, i), (i, o, i)
delete_one(E, [E|T], T).
delete_one(E, [X|T], [X|Res]) :-
    delete_one(E, T, Res).

%  6 - (i, o), (i, i)
no_doubles([], []).
no_doubles([E|T], [E|ResFinal]) :-
    delete_all(E, T, Res), no_doubles(Res, ResFinal).
% no_doubles([1, 1, 2, 3, 1, 4, 4, 5, 4, 5], X).
% no_doubles([1, 1, 2, 3, 1, 4, 4, 5, 4, 5], [1, 2, 3, 4, 5]).

% 7 - (i, i), (i, o), (o, i), (o, o)
sublist(L1, L2) :-
    append(X, Y, L2),
    append(Z, L1, X).
    dif(L1, []).

% 8 - Все возможные прототипы
number(E, N, L) :-
    count_number(E, 0, L, N).

count_number(E, N, [E|T], N).
count_number(E, N, [X|T], Res) :-
    N1 is N + 1,
    count_number(E, N1, T, Res).

% 12 - из домашнего задания, все прототипы
tree_depth(empty, 0).
tree_depth(tree(L, _, R), Res) :-
    tree_depth(L, LRes),
    tree_depth(R, RRes),
    Res is max(LRes, RRes) + 1.

% 13 - (i, i), (o, i)
sub_tree(empty, empty).
sub_tree(tree(L1, X, R1), tree(L1, X, R1)).
sub_tree(tree(L1, X1, R1), tree(L2, Y, R2)) :-
    sub_tree(tree(L1, X1, R1), L2).
sub_tree(tree(L1, X1, R1), tree(L2, Y, R2)) :-
    sub_tree(tree(L1, X1, R1), R2).

% sub_tree(tree(tree(empty, p, empty), k, tree(empty, r, empty)), 
%          tree(tree(empty, f, empty), g, tree(
%               tree(empty, p, empty), k, tree(empty, r, empty)))).

% 14 - все прототипы
flatten_tree(T, L) :- flat(T, [], L).
flat(empty, L, L).
flat(tree(TL, M, TR), Ac, Res) :-
    flat(TR, Ac, Res1), flat(TL, [M|Res1], Res).

% 15 - искренне не понимаю, почему не работает, всё правильно же??
substitute(empty, _, _, empty).
substitute(tree(TL, V, TR), V, T, tree(NewL, T, newR)) :-
    !,
    substitute(TL, V, T, NewL), 
    substitute(TR, V, T, newR).
substitute(tree(TL, M, TR), V, T, tree(NewL, M, newR)) :-
    substitute(TL, V, T, NewL), 
    substitute(TR, V, T, newR).    


edge(a, c, 8).
edge(a, b, 3).
edge(c, d, 12).
edge(b, d, 0).
edge(e, d, 9).

has_edge(X, Y, L) :-
    edge(X, Y, L); edge(Y, X, L).

% 16 - все прототипы
path(X, Y, L) :- 
    count_path(X, Y, L, _).


count_path(X, Y, L, S) :-
    count_path(X, Y, L, S, [X]).

count_path(X, X, [X], 0, Visited).
count_path(X, Y, [X|Res], Sum, Visited) :-
    has_edge(X, Z, El), not(member(Z, Visited)), count_path(Z, Y, Res, NewS, [Z|Visited]),
    Sum is NewS + El.


% Служебная функция - поиск минимума в списке
% Можно найти руками, но это будет не в одну строчку, и не так красиво.
min(L, M) :- aggregate(min(E), member(E, L), M).

% Нужно далее - снимает всего один уровень списка (пример: [[[1, 2, 3]], [[1, 2, 3]]] -> [[1, 2, 3], [1, 2, 3]])
flat([], []).  
flat([H|T],R) :- is_list(H), flat(T,T1), !, append(H,T1,R).  flat(H,H).

% 17 - (i, i, o)
min_path(X, Y, L) :-
    findall([S], count_path(X, Y, L, S), Bag),
    min(Bag, MinLength),
    count_path(X, Y, L, MinLength).

% 18 - (i, i, o)
short_path(X, Y, L) :-
    findall([L], path(X, Y, L), Bag),
    flat(Bag, BagFlatted),  %  Выпрямляем список на один уровень, чтобы можно было посчитать длины
    maplist(length, BagFlatted, BagLengths),  % Считаем длины найденных путей
    min( BagLengths, MinLength),  % Ищем минимальную длину пути
    path(X, Y, L),  % Находим путь с нужной нам длиной
    length(L, MinLength).


% 19
cyclic() :-
    path(X, Y, L),
    path(X, Y, L1),
    X \== Y,
    L \== L1,
    !;
    % findall([L], path(X, Y, L), Bag),
    % dif(X, Y).
    % % length(Bag, Length),
    % % Length > 1.

% (i, o), [(i, i) - только в правильном порядке] 
create_set([], []).
create_set([X|T], [X|S]) :-
    delete_all(X, T, NewT),
    create_set(NewT, S).

get_vertexes(L) :-
    findall([X, Y], has_edge(X, Y, Length), Bag),
    flat(Bag, BagFlatted),
    create_set(BagFlatted, L).
    

% 20
is_connected() :-
    get_vertexes(L),
    member(X, L), 
    member(Y, L),
    X \== Y,
    findall([PathList], path(X, Y, PathList), Bag),
    length(Bag, 0),
    !, fail.
is_connected().
