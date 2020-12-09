
:- [systemService].
:- [knowledge].


main() :-
    writeln("Здравствуйте!\n1) Отобразить все классы\n2) Отобразить все свойства класса\n3) Найти различия двух классов\n4) Добавить класс\n5) Добавить свойство к классу\n\nq) Выход"),
    readln([Action | _]),
    menuAction(Action),
    writeln("\n\n"),
    main().


menuAction(1) :-
    writeln("Not implemented").

menuAction(2) :-
    display_properties().

menuAction(3) :-
    display_differences().

menuAction(4) :-
    add_class().

menuAction(5) :-
    add_property().

menuAction(q) :-
    exit().

exit() :-
    saveDB(),
    halt.


:- initialization(main, main).

