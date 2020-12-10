
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
inherit(surface, train).

inherit(trane, local_train).
inherit(trane, express_train).
inherit(trane, locomotive).
inherit(train, speed_train).

inherit(air, plane).
inherit(air, helicopter).

inherit(water, boat).
inherit(water, ship).

inherit(underground, subway).


property(surface, shedule, random_shedule).
property(air, shedule, fixed_shedule).
property(water, shedule, fixed_shedule).
property(underground, shedule, random_shedule).

property(surface, capacity, many).
property(air, capacity, many).
property(water, capacity, small).
property(underground, capacity, many).

property(surface, comfort, good).
property(air, comfort, bad).
property(water, comfort, bad).
property(underground, comfort, good).

property(surface, places, random).
property(air, places, fixed).
property(water, places, fixed).
property(underground, places, random).


property(locomotive, engine, coal).
property(train, engine, electro).


property(water, engine, fuel).
property(air, engine, fuel).

property(underground, engine, electro).

property(boat, engine, electro).
property(boat, places, random).

property(ship, capacity, many).

property(bus, engine, fuel).
property(bus, shedule, fixed_shedule).

property(minibus, engine, fuel).
property(minibus, capacity, small).
property(minibus, comfort, bad).

property(electrobus, engine, electro).

property(trolley, engine, electro).

property(taxi, engine, fuel).
property(taxi, places, fixed).

property(helicopter, capacity, small).
property(helicopter, places, random).

property(plain, comfort, good).


saveDB() :-
    tell('database_file.txt'), % открытие файла для записи
    listing(property), % переписывание данных из базы в файл
    listing(inherit), % переписывание данных из базы в файл
    told. % закрытие файла (сохранение изменений в файле)

