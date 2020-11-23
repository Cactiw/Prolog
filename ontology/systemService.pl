
get_property(Class, Property, Value) :-
    property(Class, Property, Value).
get_property(Class, Property, Value) :-
    default_property(Class, Property, Value).
get_property(Class, Property, Value) :-
    inherit(Parent, Class),
    get_property(Parent, Property, Value).

