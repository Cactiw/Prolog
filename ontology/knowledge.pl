
% :- ['database_file.txt'].



:- dynamic property / 2.
:- dynamic inherit / 2.
:- dynamic default_property / 2.


inherit(transport, type, surface).
inherit(transport, type, air).
inherit(transport, type, underground).
inherit(transport, type, water).

inherit(transport, engine, electro).
inherit(transport, engine, fuel).

default_property(surface, shedule, random_shedule).
default_property(air, shedule, fixed_shedule).
default_property(water, shedule, fixed_shedule).
default_property(underground, shedule, random_shedule).



property(bus, type, surface).
property(bus, engine, fuel).
property(bus, shedule, fixed_shedule).

property(minibus, type, surface).
property(minibus, engine, fuel).

property(trolley, type, surface).
property(trolley, engine, electro).

property(taxi, type, surface).
property(taxi, engine, fuel).


saveDB() :-
    tell('database_file.txt'), % открытие файла для записи
    listing(test), % переписывание данных из базы в файл
    told. % закрытие файла (сохранение изменений в файле)

