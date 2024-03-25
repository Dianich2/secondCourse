use Korneliuk_MyBase
create table Показатели
(Название_показателя nvarchar(20) primary key,
Важность_показателя real not null
) on FG1;

create table Предприятия
(Название nvarchar(20) primary key,
Банковские_реквизиты nvarchar(50) not null,
Телефон nvarchar(15) not null,
Контакнтое_лицо nvarchar(50) not null
) on FG1;

create table Оценки
(Номер_оценки int primary key,
Дата_оценки datetime not null,
Предприятие nvarchar(20) foreign key references Предприятия (Название),
Показатель nvarchar(20) foreign key references Показатели (Название_показателя)
) on FG1;

alter table Оценки add SomeColumn date;

alter table Оценки drop column SomeColumn;

insert into Показатели (Название_показателя, Важность_показателя)
values ('Прибыль', 1),
	   ('Себестоимость', 0.8);

insert into Предприятия (Название, Банковские_реквизиты, Телефон, Контакнтое_лицо)
values ('Предприятие 1', 'IBAN:234234049823049', '80294857385', 'Контактное лицо1, HR'),
	   ('Предприятие 2', 'IBAN:324728940938523', '80295285792', 'Контактное лицо2, HR');

insert into Оценки (Номер_оценки, Дата_оценки, Предприятие, Показатель)
values (1, '2024-02-21 10:30:00', 'Предприятие 1', 'Прибыль'),
	   (2, '2024-02-21 21:30:00', 'Предприятие 2', 'Себестоимость');


select * from Оценки;
select Предприятие, Показатель from Оценки;
select count(*) from Оценки;

update Оценки set Дата_оценки = '2024-02-22 15:20:00' where Номер_оценки=2;
