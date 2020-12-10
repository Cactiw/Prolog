
:- [systemService].
:- [knowledge].


main() :-
    writeln("������������!\n1) ���������� ��� ������\n2) ���������� ��� �������� ������\n3) ����� �������� ���� �������\n4) �������� �����\n5) �������� ��� �������������� �������� � ������\n6) ������� ��������\n\nq) �����"),
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

