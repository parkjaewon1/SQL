/*Q1. �����ȣ, ����̸�, �μ��̸��� �˻��϶�.*/
select e.eno, e.ename, d.dname
from employee e, department d
where e.dno = d.dno;

/*Q2. ������ NEW YORK�� ����̸��� �˻��϶�.*/
select e.ename
from employee e, department d
where e.dno = d.dno 
and d.loc = 'NEW YORK';

/*Q3. ADAMS ����� �ٹ� ���� �μ��̸��� ������ �˻��϶�.*/
select d.dname, d.loc
from employee e, department d
where e.dno = d.dno 
and e.ename = 'ADAMS';

/*Q4. �޿��� 2000 �̻��� ������� ������ ����, �޿��� �˻��϶�.*/
select e.ename, d.loc, e.salary
from employee e, department d
where e.dno = d.dno 
and e.salary >=2000;

/*Q5. �޿��� 1000 �̻� 2000 ������ ������� �����ȣ, ����̸�, �μ��̸��� �����ȣ ������ �˻��϶�.*/
select e.eno, e.ename, d.dname, e.salary
from employee e, department d
where e.dno = d.dno 
and e.salary between 1000 and 2000
order by e.eno;

/*Q6. ��������� SALESMAN�̸鼭 CHICAGO ������ �ٹ� ���� ������ ������ �˻��϶�.*/
select e.ename, d.loc
from employee e, department d
where e.dno = d.dno 
and e.job = 'SALESMAN' 
and d.loc = 'CHICAGO' ;

/*Q7. NEW YORK�̳� DALLAS ������ �ٹ��ϴ� ������� �����ȣ�� ����̸�, ������ �����ȣ ������ �˻��϶�.*/
select e.eno,e.ename, d.loc
from employee e, department d
where e.dno = d.dno 
and d.loc in('NEW YORK','DALLAS')
order by e.eno;

/*Q8. �μ��̸��� ACCOUNTING�̰ų�, ������ CHICAGO�� ����� �����ȣ�� ����̸�, �μ���, ������ �˻��϶�.*/
select e.ename, d.dname, d.loc
from employee e, department d
where e.dno = d.dno 
and (d.dname = 'ACCOUNTING' 
or d.loc = 'CHICAGO');

/*Q9. �����ȣ, ����̸�, �޿�, �޿������ �޿���޺� �޿��� ���� ������ �˻��϶�.*/
select e.eno, e.ename, e.salary, s.grade
from employee e, salgrade s, department d
where e.dno = d.dno
and e.salary between s.losal and s.hisal
order by salary desc;

/*Q10. �����ȣ, ����̸�, ����ڻ����ȣ, ������̸��� �˻��϶�.*/
select eno, ename, manager
from employee e;
select eno, ename
from employee m;

select e.eno �����ȣ, e.ename ����̸�, m.eno ����ڹ�ȣ,
m.ename ������̸�
from employee e, employee m
where e.manager = m.eno;

/*Q11. BLAKE ������� ���� �޿��� �޴� ����̸��� �˻��϶�.*/

select ename, salary
from employee
where salary > (select salary
from employee  where ename='BLAKE');

select e.ename, e.salary
from employee e, employee b
where e.salary > b.salary
and b.ename = 'BLAKE';
