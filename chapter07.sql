select ename, dno
from employee
where dno= (select dno from employee
where ename = 'SCOTT');

select dno, min(salary)
from employee
group by dno
having min(salary) > (select min(salary)
                 from employee
                 where dno=30);
                 
select eno, ename, salary, dno
from employee
where salary in (select min(salary)
                    from employee
                    group by dno);  
                    
select eno, ename, salary, dno
from employee
where exists (select min(salary)
                    from employee
                    group by dno);   /* in�� exists�� �ٲٱ� (����)*/
                    
select *
from department d
where exists (select dno 
               from employee e
               where e.dno = d.dno);
                    
select *
from department d
where dno in (select distinct dno
                from employee);  /*exists�� in���� �ٲٱ�*/
                
                
--any������

select eno, ename, job, salary
from employee
where salary > any(select salary from employee where job = 'SALESMAN')
and job <>'SALESMAN';

--all������
select eno, ename, job, salary
from employee
where salary > all(select salary from employee where job = 'SALESMAN')
and job <>'SALESMAN';