desc employee;


select *
from employee;

select eno, ename, salary, salary *12
from employee;

select ename 이름, salary, job "직업", dno, commission,nvl(commission,0),
        salary*12, salary*12+nvl(commission,0) as 연봉
        from employee;
        
select job || ',' ||ename|| ',' ||salary 
from employee;

select distinct job
from employee;

select distinct job, dno
from employee;

select *
from employee 
where ename ='SCOTT';   --"SCOTT" (큰따옴표) 사용 시 오류--

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
where salary not between 1000 and 1500; -- 이 방법을 많이씀 --

select *
from employee
where salary < 1000 or salary > 1500;

select *
from employee
where dno in (10,20); --or와 같은개념 여러가지 일때 사용하면 유용--

select *
from employee
where dno not in (10,20);


select *
from employee
where ename like '%N';  --%n% n이 포함된 모든 것. %n n으로 끝나는 모든 것. n% n으로 시작하는 모든 것.

select *
from employee
where ename not like '%N%';

select *
from employee
where ename like '__A%'; --세번 째 글자가 A인 모든 것.

select *
from employee
where commission is null; -- = null 은 의미상 맞지 않기 때문에 is null 사용.

select *
from employee
where commission is not null;

select *
from employee
order by ename;  --정렬 (기본적으로 오름차순 설정)

select *
from employee
order by hiredate desc;

select *
from employee
order by ename desc; --내림차순

select *
from employee
order by ename asc; --오름차순

select *
from employee
order by salary desc, ename asc; --급여를 내림차순으로 할때, 같은 값이 존재하면 이름 오름차순으로 정렬




