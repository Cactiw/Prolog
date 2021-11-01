connected(X, Y, [[X, Y] | Maze]). 
connected(X, Y, [[Y, X] | Maze]).
connected(X, Y, [[A, B] | Maze]) :-
    connected(X, Y, Maze).


find_path(Maze, Path) :-
    find_path(in, out, Maze, Path).
find_path(In, Out, Maze, Path) :-
    path(In, Out, Maze, [In], Path).

elem_in_list(E, [E|L]).
elem_in_list(E, [X|T]):-
    elem_in_list(E, T).


% path(In, Out, Maze, Visited, Path)
path(Out, Out, Maze, Visited, [Out]).
path(Current, Out, Maze, Visited, [Current | Path]) :-
    connected(Current, NewRoom, Maze),
    not(elem_in_list(NewRoom, Visited)),
    path(NewRoom, Out, Maze, [NewRoom | Visited], Path).


% (i, o), [(i, i) - только в правильном порядке] 
% Создаёт множество из списка (удаляет повторяющиеся элементы)
create_set([], []).
create_set([X|T], [X|S]) :-
    delete_all(X, T, NewT),
    create_set(NewT, S).

create_set_without_in_out(List, Result):-
    delete_all(in, List, ListWithoutIn),
    delete_all(out, ListWithoutIn, ListWithoutInOut),
    create_set(ListWithoutInOut, Result).

% 1 - любые прототипы, неопределён только (o, o, o)
my_append([], L, L).
my_append([X|L1], L2, [X|L3]):- my_append(L1, L2, L3).


% 4 - (i, i, o), (i, i, i), (o, i, i), (i, o, i)
delete_all(_, [], []).
delete_all(E, [E|T], Res) :-
    !, delete_all(E, T, Res).
delete_all(E, [X|T], [X|Res]) :-
    delete_all(E, T, Res).


find_all_rooms_from_ends(Maze, ResultNoDublicates) :-
    findall(Room, find_path(in, Room, Maze, _), ResIn),
    findall(Room, find_path(out, Room, Maze, _), ResOut),
    my_append(ResIn, ResOut, Result),
    create_set_without_in_out(Result, ResultNoDublicates).

% Снимает всего один уровень списка (пример: [[[1, 2, 3]], [[1, 2, 3]]] -> [[1, 2, 3], [1, 2, 3]])
flat([], []).  
flat([H|T],R) :- is_list(H), flat(T,T1), !, append(H,T1,R).  flat(H,H).

find_rooms_in_ways(Maze, Result) :-
    findall(Path, find_path(in, out, Maze, Path), AllPaths),
    flat(AllPaths, AllRoomsInPaths),
    create_set_without_in_out(AllRoomsInPaths, Result).

% room(Maze, Room).
room([[Room, Room2] | Maze], Room).
room([[Room, Room2] | Maze], Room2).
room([Path | Maze], Room) :-
    room(Maze, Room).

% all_rooms(Maze, Rooms) :-
%     findall(NewRoom, room(Maze, NewRoom), RoomsWithDublicates),
%     create_set(RoomsWithDublicates, Rooms).

closed_room(Maze, Room) :-
    find_all_rooms_from_ends(Maze, RoomsWithPath),
    room(Maze, Room),
    not(member(Room, RoomsWithPath)).

find_all_closed_rooms(Maze, Result):-
    findall(ClosedRoom, closed_room(Maze, ClosedRoom), ResultWithDublicates),
    create_set(ResultWithDublicates, Result).



