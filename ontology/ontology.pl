
:- [systemService].
:- [knowledge].


main() :-
    writeln("������������!\n1) ���������� ��� ������\n2) ���������� ��� �������� ������\n3) ����� �������� ���� �������\n4) �������� �����\n5) �������� �������� � ������\n\nq) �����"),
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

