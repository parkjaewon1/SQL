select sum(salary) as"급여총액",
       round(avg(salary)) as"급여평균",
       max(salary) as"최대급여",
       min(salary) as"최소급여",
       count(*) as"총직원수"
from employee;

select min(hiredate), max(hiredate)
from employee;

select sum(commission) "커미션 총액",
       avg(commission),
       round(sum(commission)/count(*))"커미션 평균"
from employee;

select * from employee order by job;

select distinct job from employee;

select count(distinct job) from employee;

select dno, max(salary)
from employee;    /*오류*/

select dno, max(salary), round(avg(salary))
from employee
group by dno; /*일반칼럼들은 group by 해줘야함*/

select dno, job, count(*), sum(salary)
from employee
group by dno, job
order by dno, job;

select dno, max(salary)
from employee
where dno <>20
group by dno
having max(salary) >=3000;


--manager를 제외하고/ 급여 총액이 5천이상인/ 직무별급여 총액/ 구하기
select job, sum(salary)
from employee
where job <> 'MANAGER'
group by job
having sum(salary) >=5000;

--부서별 평균급여 중에서 최고평균 급여
select max(round(avg(salary)))
from employee
group by dno;

