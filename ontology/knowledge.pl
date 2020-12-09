
% :- ['database_file.txt'].



:- dynamic property / 3.
:- dynamic inherit / 3.
:- dynamic inherit / 2.


inherit(transport, type, surface).
inherit(transport, type, air).
inherit(transport, type, underground).
inherit(transport, type, water).

inherit(transport, engine, electro).
inherit(transport, engine, fuel).

inherit(surface, bus).
inherit(bus, electrobus).
inherit(bus, minibus).


inherit(surface, trolley).
inherit(surface, taxi).


property(surface, shedule, random_shedule).
property(air, shedule, fixed_shedule).
property(water, shedule, fixed_shedule).
property(underground, shedule, random_shedule).



property(bus, engine, fuel).
property(bus, shedule, fixed_shedule).

property(minibus, engine, fuel).

property(electrobus, engine, electro).

property(trolley, engine, electro).

property(taxi, engine, fuel).


saveDB() :-
    tell('database_file.txt'), % открытие файла для записи
    listing(property), % переписывание данных из базы в файл
    listing(inherit), % переписывание данных из базы в файл
    listing(default_property), % переписывание данных из базы в файл
    told. % закрытие файла (сохранение изменений в файле)

