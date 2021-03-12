select count(*) from employee;
select count(*) from department;

select * 
from employee, department
order by eno,employee.dno;  /*ī��þȰ� (��ȿ��)*/

select * 
from employee, department 
where employee.dno = department.dno;  /*Equi Join*/

select * 
from employee, department
where employee.dno = department.dno
and employee.job = 'CLERK';  /*and �����ڷ� Ư�� �� ã��*/

select eno, ename, dname, d.dno
from employee e, department d
where e.dno = d.dno
and e.eno = 7788; 

select e.eno, e.ename, d.dname, dno
from employee e natural join department d
where e.eno = 7788;           /*����� Į���� �˾Ƽ� ã�Ƽ� ����*/

select e.eno, e.ename, d.dname, dno
from employee e join department d
using (dno)
where e.eno = 7788;     /*using���� ����Į�� ����*/

select e.ename, e.salary, s.grade
from employee e, salgrade s
where e.salary between s.losal and s.hisal;


select e.ename,d.dname, e.salary, s.grade
from employee e, salgrade s, department d
where e.dno = d.dno
and e.salary between s.losal and s.hisal;

select eno, ename, manager 
from employee e;

select eno, ename
from employee m;

select e.eno �����ȣ, e.ename �����, m.eno �����ȣ, m.ename ����̸�
from employee e, employee m
where e.manager = m.eno;    /*self join*/

select e.eno �����ȣ, e.ename �����, m.eno �����ȣ, m.ename ����̸�
from employee e, employee m
where e.manager = m.eno(+); /*outer join*/

select * from department;
select * from employee;

select d.dno, d.dname, e.eno, e.ename
from department d, employee e
where d.dno(+) = e.dno
order by d.dno;
