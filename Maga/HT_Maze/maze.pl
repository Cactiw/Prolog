connected(X, Y, [[X, Y] | Maze]). 
connected(X, Y, [[Y, X] | Maze]).
connected(X, Y, [[A, B] | Maze]) :-
    connected(X, Y, Maze).


find_path(Maze, Path) :-
    find_path(in, out, Maze, Path).
find_path(In, Out, Maze, Path) :-
    path(In, Out, Maze, [in], Path).

elem_in_list(E, [E|L]).
elem_in_list(E, [X|T]):-
    elem_in_list(E, T).


% path(In, Out, Maze, Visited, Path)
path(Out, Out, Maze, Visited, [Out]).
path(Current, Out, Maze, Visited, [Current | Path]) :-
    connected(Current, NewRoom, Maze),
    not(elem_in_list(NewRoom, Visited)),
    path(NewRoom, Out, Maze, [NewRoom | Visited], Path).
