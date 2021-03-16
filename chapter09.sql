create table dept_copy
as
select *
from department 
where 0=1;

desc dept_copy;

insert into dept_copy
values(10,'ACCOUNTING','NEW YORK');

select * from dept_copy;

insert into dept_copy(dno, dname, loc)
values(20,'RESEARCH','DALLAS');

commit;

insert into dept_copy(dno, dname)
values(30,'SALES');

insert into dept_copy(dno, dname, loc)
values(40,'OPERATION',NULL);

insert into dept_copy(dno, dname, loc)
values(50,'IT','');

commit;
rollback;
select * from dept_copy;

create table emp_copy
as
select eno, ename, job, hiredate, dno from employee
where 0=1;

insert into emp_copy
values (7000,'CANDY', 'MANAGER', to_date('2021/03/05','YYYY/MM/DD'), 10);

insert into emp_copy
values (7020,'JERRY', 'SALESMAN', sysdate, 30);

select * from emp_copy;

insert into dept_copy
select * from department;

update dept_copy
set dname = 'PROGRAMMING'
where dno =10;

update dept_copy
set dname = 'hr';      /*출력시 모든 dname이 hr로 변경된다. 따라서 update 할때는 조건을 잘 설정해야함.*/

update dept_copy
set dname ='PROGRAMMING',
    loc = 'SEOUL'
    where dno = 10;
    
    update dept_copy
set dname = (select dname from department where dno =30),
    loc = (select loc from department where dno = 30)
    where dno = 10;
    
    delete from dept_copy
    where dno = 10;
select * from dept_copy;