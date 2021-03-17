desc dept_second;

drop table dept_second;

drop table dept_third;

create table dept_second(
    dno       number(2)     constraint pk_dept_second primary key,
    dname     varchar2(14),
    loc       varchar2(13)
    );
    
create table dept_third(
    dno       number(2),    
    dname     varchar2(14),
    loc       varchar2(13),
    constraint pk_dept_third primary key (dno)
    );
    
    create table customer(
    id varchar2(20)     unique,
    pwd varchar2(20)     not null,
    name varchar2(20)     not null,
    phone varchar2(30),
    address varchar2(100)
    );

desc customer;

insert into customer
values (null, null, null, '010-1234-1234', 'SEOUL');

insert into customer
values ('ydgil', '0000', '길용단', '010-1234-1234', 'SEOUL');

insert into customer
values ('ydgil', '1111', '길용단', '010-1234-1234', 'SEOUL');

select *
from user_constraints
where table_name in ('customer');

    create table customer(
    id varchar2(20),
    pwd varchar2(20)     constraint customer_pwd_nn not null,
    name varchar2(20)     constraint customer_name_nn not null,
    phone varchar2(30),
    address varchar2(100),
    constraint customer_id_pk primary key(id)
    );

insert into customer
values ('ydgil', '1111', '길용단', '010-1234-1234', 'SEOUL');

insert into customer
values ('green', '0000', '녹차', '010-2345-1234', 'SEOUL');

select * from customer;

drop table customer;

create table emp_second(
    eno     number(4)   constraint emp_second_dno_pk primary key,
    ename   varchar2(10),
    job     varchar2(9),
    dno     number(2)   constraint emp_second_dno_fk references department
);
insert into emp_second
values(1000, '홍길동', 'FC', 50);  /*department에 50 값이없어서 참조무결성 오류가 난다.*/

insert into emp_second
values(1000, '홍길동', 'FC', 10);   /*참조무결성 조건 충족*/

select * from department;

drop table emp_second;

create table emp_second(
    eno     number(4)   constraint emp_second_dno_pk primary key,
    ename   varchar2(10),
    salary  number(7,2)   constraint emp_second_salary_min check(salary > 0)
);

insert into emp_second
values(1000, '홍길동', -100); /*check문 조건에 맞지않음*/

insert into emp_second
values(1000, '홍길동', 100);

drop table emp_second;

create table emp_second(
    eno     number(4)   constraint emp_second_dno_pk primary key,
    ename   varchar2(10),
    salary  number(7,2) default 0
);

insert into emp_second(eno, ename)
values(1000, '홍길동');

select * from emp_second;

drop table emp_copy;
drop table dept_copy;

create table emp_copy
as select * from employee;

create table dept_copy
as select * from department;

--primary key 제약조건 추가
alter table emp_copy
add constraint emp_copy_eno_pk primary key(eno);

alter table dept_copy
add constraint dept_copy_eno_pk primary key(dno);

--foreign key 제약조건 추가
alter table emp_copy
add constraint emp_copy_dno_fk foreign key(dno) references dept_copy(dno);

alter table emp_copy
modify ename constraint emp_copy_ename_nn not null;

select * from emp_copy;


alter table emp_copy
drop primary key;

alter table emp_copy
drop constraint emp_copy_dno_fk;

alter table emp_copy
drop constraint emp_copy_ename_nn;

alter table emp_copy
add constraint emp_copy_eno_pk primary key(eno);

alter table dept_copy
add constraint dept_copy_dno_pk primary key(dno);

alter table emp_copy
add constraint emp_copy_dno_fk foreign key(dno) references dept_copy(dno);


