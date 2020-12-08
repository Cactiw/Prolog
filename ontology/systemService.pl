
% Снимает всего один уровень списка (пример: [[[1, 2, 3]], [[1, 2, 3]]] -> [[1, 2, 3], [1, 2, 3]])
flat([], []).  
flat([H|T],R) :- is_list(H), flat(T,T1), !, append(H,T1,R).  flat(H,H).

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
    