select count(*) from employee;
select count(*) from department;

select * 
from employee, department
order by eno,employee.dno;  /*카디시안곱 (비효율)*/

select * 
from employee, department 
where employee.dno = department.dno;  /*Equi Join*/

select * 
from employee, department
where employee.dno = department.dno
and employee.job = 'CLERK';  /*and 연산자로 특정 값 찾기*/

select eno, ename, dname, d.dno
from employee e, department d
where e.dno = d.dno
and e.eno = 7788; 

select e.eno, e.ename, d.dname, dno
from employee e natural join department d
where e.eno = 7788;           /*공통된 칼럼을 알아서 찾아서 조인*/

select e.eno, e.ename, d.dname, dno
from employee e join department d
using (dno)
where e.eno = 7788;     /*using으로 공통칼럼 지정*/

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

select e.eno 사원번호, e.ename 사원명, m.eno 상관번호, m.ename 상관이름
from employee e, employee m
where e.manager = m.eno;    /*self join*/

select e.eno 사원번호, e.ename 사원명, m.eno 상관번호, m.ename 상관이름
from employee e, employee m
where e.manager = m.eno(+); /*outer join*/

select * from department;
select * from employee;

select d.dno, d.dname, e.eno, e.ename
from department d, employee e
where d.dno(+) = e.dno
order by d.dno;
