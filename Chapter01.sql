desc employee;


select *
from employee;

select eno, ename, salary, salary *12
from employee;

select ename �̸�, salary, job "����", dno, commission,nvl(commission,0),
        salary*12, salary*12+nvl(commission,0) as ����
        from employee;
        
select job || ',' ||ename|| ',' ||salary 
from employee;

select distinct job
from employee;

select distinct job, dno
from employee;

select *
from employee 
where ename ='SCOTT';   --"SCOTT" (ū����ǥ) ��� �� ����--

select *
from employee
where hiredate <= '1981/01/01';

select *
from employee
where dno = 10 and job = 'MANAGER';

select *
from employee
where dno = 10 or job = 'MANAGER';

select *
from employee
where not dno =10;

select *
from employee
where dno <> 10;

select *
from employee
where salary >=1000 and salary<=1500;

select *
from employee
where salary between 1000 and 1500;

select *
from employee
where salary not between 1000 and 1500; -- �� ����� ���̾� --

select *
from employee
where salary < 1000 or salary > 1500;

select *
from employee
where dno in (10,20); --or�� �������� �������� �϶� ����ϸ� ����--

select *
from employee
where dno not in (10,20);


select *
from employee
where ename like '%N';  --%n% n�� ���Ե� ��� ��. %n n���� ������ ��� ��. n% n���� �����ϴ� ��� ��.

select *
from employee
where ename not like '%N%';

select *
from employee
where ename like '__A%'; --���� ° ���ڰ� A�� ��� ��.

select *
from employee
where commission is null; -- = null �� �ǹ̻� ���� �ʱ� ������ is null ���.

select *
from employee
where commission is not null;

select *
from employee
order by ename;  --���� (�⺻������ �������� ����)

select *
from employee
order by hiredate desc;

select *
from employee
order by ename desc; --��������

select *
from employee
order by ename asc; --��������

select *
from employee
order by salary desc, ename asc; --�޿��� ������������ �Ҷ�, ���� ���� �����ϸ� �̸� ������������ ����




