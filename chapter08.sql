create table dept (
    dno     number(2),
    dname   varchar2(14),
    loc     varchar2(13)
    );
desc dept;


create table dept_second
as select * from department;

desc dept_second;

create table dept_third
as
select dno, dname
from dept_second
where 0=1;

desc dept_third;

create table employee_backup20210304
as 
select * from employee;

select * from employee_backup20210304;

create table dept20 (
    eno     number(2),
    ename   varchar2(14),
    annsal  number(10)
    );
desc dept20 ;

alter table dept20
add (birth date);

select * from dept20;

alter table emp20
    modify annsal number;
    
alter table dept20
    drop column ename;    
    
alter table dept20
set unused(eno);

alter table dept20
drop unused columns;

rename dept20 to emp20;

desc emp20;

drop table emp20;

select *from employee;

select table_name from user_tables;

