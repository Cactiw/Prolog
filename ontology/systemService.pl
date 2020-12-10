
% Снимает всего один уровень списка (пример: [[[1, 2, 3]], [[1, 2, 3]]] -> [[1, 2, 3], [1, 2, 3]])
flat([], []).  
flat([H|T],R) :- is_list(H), flat(T,T1), !, append(H,T1,R).  flat(H,H).

% remove(E, L).
remove(_, [], []).
remove(X, [[X | _]|T], T) :- !.
remove(X, [E|T], [E | Res]) :-
    remove(X, T, Res).

get_property(Class, Property, Value) :-
    property(Class, Property, Value), !.
get_property(Class, Property, Value) :-
    property(Class, Property, AnotherValue),
    Value \== AnotherValue,
    !,
    fail.
get_property(Class, Property, Value) :-
    inherit(Parent, Class),
    get_property(Parent, Property, Value).



has_property(Class, Property, Value) :-
    property(Class, Property, Value).

has_property(Class, Property, Value) :-
    findall([X], property(Class, X, _), AllPropertiesNested),
    flat(AllPropertiesNested, AllProperties),
    maplist(dif(Property), AllProperties),

    inherit(Parent, Class),
    has_property(Parent, Property, Value).
    


get_all_properties(Class, Property, Value) :-
    distinct(has_property(Class, Property, Value)).


get_all_classes() :-
    findall(Child, distinct(inherit(_, Child)), Result),

    maplist(printSingle, Result).

printSingle(X) :-
    format("~w\n", [X]).



display_properties() :-
    writeln("Введите название объекта:"),
    readln([Class | _]),
    findall([X, Y], get_all_properties(Class, X, Y), Result),
    maplist(prettyPrint, Result, _).

display_differences() :-
    writeln("Введите название объектов через пробел:"),
    readln([Class1, Class2 | _]),
    findall([X, Y], get_all_properties(Class1, X, Y), Result1),
    findall([X, Y], get_all_properties(Class2, X, Y), Result2),
    compare_classes(Result1, Result2, Class1, Class2).


compare_classes([], [], _, _) :- !.
compare_classes([], Result2, Class1, Class2) :-
    compare_classes(Result2, [], Class2, Class1).
compare_classes([ [ Property, Value ] | T ], Result2, Class1, Class2) :-
    has_property(Class2, Property, Value),
    !,
    remove(Property, Result2, Result2New),
    compare_classes(T, Result2New, Class1, Class2).
compare_classes([ [ Property, Value ] | T ], Result2, Class1, Class2) :-
    has_property(Class2, Property, Value2),
    !,
    format("~w: ~w | ~w\n", [Property, Value, Value2]),
    remove(Property, Result2, Result2New),
    compare_classes(T, Result2New, Class1, Class2).
compare_classes([ [Property, Value ] | T ], Result2, Class1, Class2) :-
    format("~w: ~w | NULL\n", [Property, Value]),
    compare_classes(T, Result2, Class1, Class2).

    

prettyPrint([Property, Value], _) :-
    format("~w = ~w\n", [Property, Value]).
    
add_class() :-
    writeln("Введите название новго объекта, а также родительский объект:"),
    readln([Class, Parent | _]),
    assert(inherit(Parent, Class)),
    writeln("Класс добавлен!").

add_attribute() :-
    writeln("Введите: {Имя класса} {Свойство} {Значение}"),
    readln([Class, Property, Value]),
    assert(property(Class, Property, Value)),
    writeln("Свойство добавлено!").

