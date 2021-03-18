create user usertest02 identified by pass2;

grant create session, create table, create view to usertest02;

conn usertest02/pass2;


create role roletest01;
grant create session, create table, create view to roletest01;
grant roletest01 to usertest01;


create role roletest02;

grant roletest02 to usertest01;

create table sampletbl(
    memo varchar2(50)
);

insert into sampletbl 
values ('박재원');
insert into sampletbl 
values ('박재원2');

grant select on sampletbl to hr;

select * from sampletbl;

create public synonym pub_sampletbl for system.sampletbl; /*공용동의어 생성*/