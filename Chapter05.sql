select sum(salary) as"�޿��Ѿ�",
       round(avg(salary)) as"�޿����",
       max(salary) as"�ִ�޿�",
       min(salary) as"�ּұ޿�",
       count(*) as"��������"
from employee;

select min(hiredate), max(hiredate)
from employee;

select sum(commission) "Ŀ�̼� �Ѿ�",
       avg(commission),
       round(sum(commission)/count(*))"Ŀ�̼� ���"
from employee;

select * from employee order by job;

select distinct job from employee;

select count(distinct job) from employee;

select dno, max(salary)
from employee;    /*����*/

select dno, max(salary), round(avg(salary))
from employee
group by dno; /*�Ϲ�Į������ group by �������*/

select dno, job, count(*), sum(salary)
from employee
group by dno, job
order by dno, job;

select dno, max(salary)
from employee
where dno <>20
group by dno
having max(salary) >=3000;


--manager�� �����ϰ�/ �޿� �Ѿ��� 5õ�̻���/ �������޿� �Ѿ�/ ���ϱ�
select job, sum(salary)
from employee
where job <> 'MANAGER'
group by job
having sum(salary) >=5000;

--�μ��� ��ձ޿� �߿��� �ְ���� �޿�
select max(round(avg(salary)))
from employee
group by dno;

