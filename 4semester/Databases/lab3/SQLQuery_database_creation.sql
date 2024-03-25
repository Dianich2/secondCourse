use master
create database Korneliuk_MyBase  on primary
(name=N'Korneliuk_MyBase_mdf', filename=N'D:\Study\university\4semester\Databases\lab3\Korneliuk_MyBase_mdf.mdf',
size=10240Kb, maxsize=UNLIMITED, filegrowth=1024Kb),
(name=N'Korneliuk_MyBase_ndf', filename=N'D:\Study\university\4semester\Databases\lab3\Korneliuk_MyBase_ndf.ndf',
size=10240KB, maxsize=1GB, filegrowth=25%),
filegroup FG1
(name=N'Korneliuk_MyBase_fg1_1', filename=N'D:\Study\university\4semester\Databases\lab3\Korneliuk_MyBase_fgq_1.ndf',
size=10240Kb, maxsize=1GB, filegrowth=25%),
(name=N'Korneliuk_MyBase_fg1_2', filename=N'D:\Study\university\4semester\Databases\lab3\Korneliuk_MyBase_fgq_2.ndf',
size=10240Kb, maxsize=1GB, filegrowth=25%)
log on
(name=N'Korneliuk_MyBase_log', filename=N'D:\Study\university\4semester\Databases\lab3\Korneliuk_MyBase_log.ldf',
size=10240Kb, maxsize=1GB, filegrowth=10%)