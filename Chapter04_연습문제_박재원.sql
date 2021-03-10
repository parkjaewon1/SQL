/* Q1. 사원들의 사원이름, 사원직무를 소문자로 검색하라. */
select LOWER(ename), LOWER(job)
from employee;

/* Q2. 사원들의 사원이름, 사원직무를 대문자로 검색하라. */
select UPPER(ename), UPPER(job)
from employee;

/* Q3. 사원들의 사원이름, 사원직무를 첫 자만 대문자로 검색하라. */
select INITCAP(ename),INITCAP(job)
from employee;

/* Q4. 사원들의 사원이름과 사원이름의 두 글자를 검색하라. */
select ename, substr(ename,1,2)
from employee;

/* Q5. 사원들의 사원이름과 사원이름의 길이를 검색하라. */
select ename, length(ename)
from employee;

/* Q6. 사원들의 사원이름에 'A'가 몇 번째 위치에 있는지 검색하라. */
select ename, instr(ename,'A')
from employee;

/* Q7. 사원이름을 15자리로 하고, 뒤에 '*'를 채워 검색하라. */
select RPAD(ename,15,'*')
from employee;

/* Q8. 사원의 사원번호, 사원이름, 급여를 검색하라(급여는 두 번째 자리에서 반올림함). */
select eno, ename, round(salary, -2)"급여"
from employee;

/* Q9. 사원의 사원번호, 사원이름, 급여를 검색하라(급여는 두 번째 자리에서 절삭함). */
select eno, ename, trunc(salary, -2)"급여"
from employee;

/* Q10. 사원의 사원번호, 사원이름, 입사 후 100일의 날짜를 검색하라. */
select eno, ename,hiredate, hiredate+100"100일"
from employee;

/* Q11. 사원의 사원번호, 사원이름, 입사일, 근무 일자를 계산하여 검색하라. */
select eno, ename, hiredate, round(sysdate - hiredate)"근무일자"
from employee;

/* Q12. 사원들의 입사일에서 3달째 되는 날짜를 검색하라. */
select eno, ename, hiredate, add_months(hiredate,3)
from employee;

/* Q13. 사원들의 입사일 다음 토요일의 날짜를 검색하라. */
select eno, ename, hiredate, next_day(hiredate,'토')
from employee;

/* Q14. 사원들의 입사월의 마지막 날짜를 검색하라. */
select hiredate, last_day(hiredate)
from employee;

/* Q15. 상급자사원번호가 없는 사원의 경우 '상급자 없음'을 나타내도록 하는 질의문을 작성하라. */
select ename,
nvl(to_char(MANAGER),'상급자 없음') "상급자여부"
from employee;

/* Q16. 커미션을 포함한 급여를 사원번호, 사원이름과 함께 검색하라. */
select eno, ename,
salary * 12 + nvl(commission,0) 급여
from employee;
        
/* Q17. 상급자사원번호가 NULL인 경우 'CEO'로 바꾸어 사원번호, 사원이름, 상급자사원번호를 검색하라. */
select eno, ename,
nvl(to_char(MANAGER),'CEO') "상급자사원번호"
from employee;

/* Q18. DECODE 함수로 직급에 따라 인상된급여를 구하시오. 직급이 'SALESMAN'인 사원은 10%, 'MANAGER'인 사원은 30%, 'CLERK'인 사원은 20%을 인상하시오. */
  select ename, job, 
        decode(JOB, 'SALESMAN', to_char(salary*1.1),
        'MANAGER', to_char(salary*1.3), 
        'CLERK', to_char(salary*1.2), 'DEFAULT')
        as 인상된급여
        from employee;
        
/* Q19. CASE 함수로 직급에 따라 인상된급여를 구하시오. 직급이 'SALESMAN'인 사원은 10%, 'MANAGER'인 사원은 30%, 'CLERK'인 사원은 20%을 인상하시오. */
   select ename, job,
                case job when 'SALESMAN' then to_char(salary*1.1)
                     when 'MANAGER' then to_char(salary*1.3)
                     when 'CLERK' then to_char(salary*1.2)
                       else 'DEFAULT'
                       end as 인상된급여
                       from employee;