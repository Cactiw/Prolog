
% :- ['database_file.txt'].



:- dynamic property / 3.
:- dynamic inherit / 3.
:- dynamic default_property / 3.


inherit(transport, type, surface).
inherit(transport, type, air).
inherit(transport, type, underground).
inherit(transport, type, water).

inherit(transport, engine, electro).
inherit(transport, engine, fuel).

inherit(surface, bus).
inherit(surface, minibus).
inherit(surface, trolley).
inherit(surface, taxi).


default_property(surface, shedule, random_shedule).
default_property(air, shedule, fixed_shedule).
default_property(water, shedule, fixed_shedule).
default_property(underground, shedule, random_shedule).



property(bus, engine, fuel).
property(bus, shedule, fixed_shedule).

property(minibus, engine, fuel).

property(trolley, engine, electro).

property(taxi, engine, fuel).


saveDB() :-
    tell('database_file.txt'), % открытие файла для записи
    listing(test), % переписывание данных из базы в файл
    told. % закрытие файла (сохранение изменений в файле)

