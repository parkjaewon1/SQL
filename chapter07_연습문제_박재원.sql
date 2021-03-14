/* Q1. FORD ����� ���� �μ��� �ٹ��ϴ� ����� ������ �˻��϶�. */
select *
from employee
where dno in(select dno 
from employee 
where ename ='FORD'); 

/* Q2. CHICAGO ������ ��ġ�ϴ� �μ��� �ٹ��ϴ� ����� ������ �˻��϶�. */
select *
from employee
where dno = (select dno 
from department 
where loc = 'CHICAGO');


/* Q3. FORD ����� ���� �޿��� �޴� ����� �����ȣ�� ����̸��� �˻��϶�. */
select eno, ename
from employee 
where salary = (select salary 
from employee
where ename = 'FORD')
and ename !='FORD';


/* Q4. SCOTT ������� ���� �޿��� �޴� ��� ������ �˻��϶�. */
select eno, ename
from employee 
where salary > (select salary 
from employee
where ename = 'SCOTT');


/* Q5. ALLEN ������� ���� �޿��� �޴� ��� ������ �˻��϶�. */
select eno, ename
from employee 
where salary < (select salary 
from employee
where ename = 'ALLEN');


/* Q6. 20�� �μ� ����� ��������� ���� ��������� �ٸ� �μ��� ��� ������ �˻��϶�. */
select *
from employee
where dno != 20
and job in (select distinct job
  from employee
  where dno = 20);

/* Q7. ��ü ����� ��� �޿����� �޿��� ���� ��� ������ �˻��϶�. */
select *
from employee
where salary > (select round(avg(salary))
                from employee);

/* Q8. �޿��� ��� �μ����� ��� �޿����� ���� ��� ������ �˻��϶� */
select *
from employee
where salary > all(select round(avg(salary))
                from employee
                group by dno);
                
/* Q9. 30�� �μ��� �ִ� �޿����� �ִ� �޿��� ū �μ��� ��ȣ�� �ִ� �޿��� �˻��϶�. */
select dno, max(salary)
from employee
group by dno,salary
having salary > all (select max(salary) 
from employee 
where dno=30);
