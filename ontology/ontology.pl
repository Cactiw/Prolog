
:- [systemService].
:- [knowledge].


main() :-
    writeln("Здравствуйте!\n1) Отобразить все классы\n2) Отобразить все свойства класса\n3) Найти различия двух классов\n4) Добавить класс\n5) Добавить или переопределить свойство к классу\n6) Удалить свойство\n\nq) Выход"),
    readln([Action | _]),
    menuAction(Action),
    writeln("\n"),
    main().


menuAction(1) :-
    get_all_classes.

menuAction(2) :-
    display_properties().

menuAction(3) :-
    display_differences().

menuAction(4) :-
    add_class().

menuAction(5) :-
    add_attribute().

menuAction(6) :-
    delete_attribute().

menuAction(q) :-
    exit().

exit() :-
    saveDB(),
    halt.


:- initialization(main, main).

