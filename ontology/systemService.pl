
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
    inherit(Parent, Class),
    has_property(Parent, Property, Value).
