/*문자함수*/
SELECT 'Oracle mania',
        UPPER('Oracle mania'),
        LOWER('Oracle mania'),
        INITCAP('Oracle mania')
        FROM DUAL;
        
        SELECT ENAME, LOWER(ENAME), UPPER(ENAME), INITCAP(JOB)
        FROM EMPLOYEE;
        
        SELECT ENO, ENAME, DNO
        FROM EMPLOYEE
        WHERE LOWER(ENAME)='scott';
        
        
        select concat('Oracle', 'mania')
from dual;
        
        select 'Oracle'||' '|| 'mania'
from dual;

        select substr('Oracle mania',4,3),
               substrb('Oracle mania',-4,3)
        from dual;
        
        select substr('오라클매니아',3,4),
               substrb('오라클매니아',3,4)
        from dual;
        
        select *
        from employee 
        where substr(ename,-1,1) ='N';
        
         select *
        from employee 
        where ename like '%N';
        
         select *
        from employee 
        where substr(hiredate, 1, 2) >= '81';
        
        select INSTR('Oracle mania','a')
        from dual;
        
           select INSTR('Oracle mania','a', 5)
        from dual;                 /* 공백 포함*/
        
        select INSTR('Oracle mania','a', 5, 2)
        from dual;
        
        select *
        from employee
        where ename like '__A%';
        
        select *
        from employee
        where INSTR(ename,'A', 3, 1) = 3;
        
        select LPAD(salary,10,'*')
        from employee;               /* salary를 전체자리 10에 채우고 나머지를 *로 채워라 */
        
        select RPAD(salary,10,'*')
        from employee;
        
        select TRIM('O' from 'Oracle mania')
        from dual;    /*  맨앞이나 뒤에 대문자 O를 제거 */
        
        select TRIM(' ' from 'Oracle mania ')
        from dual;    /*  맨앞이나 뒤에 공백 문자를 제거 */
        
        select TRIM(' Oracle mania ')
        from dual;    /*  맨앞이나 뒤에 공백문자를 제거(대부분 이렇게 많이사용함.) */
        
        select LTRIM(' Oracle mania ')
        from dual;    /*  맨앞에 공백 제거 */
        
        select RTRIM(' Oracle mania ')
        from dual;    /*  맨뒤에 공백 제거 */
        
        
        
/* 숫자함수 */
select 98.7654,
       ROUND(98.7654),
       ROUND(98.7654,2),
       ROUND(98.7654,-1), /*-1 은 1단위, -2는 10단위, -3은 100단위 반올림*/
       ROUND(988.7654,-2)
from dual;

select TRUNC(7654.7654, -1), 
       TRUNC(7654.7654, -2),
       TRUNC(7654.7654, -3),
       TRUNC(7654.7654, 1)
       from dual;
       
select mod(31,2), mod(31,5), mod(31,8)
from dual;

select ename, salary, mod(salary,500)
from employee;

/*날짜 함수*/

select SYSDATE-1 어제, SYSDATE 오늘, SYSDATE+1 내일, SYSDATE+2 모레
from dual;       /*날짜도 연산이 가능*/

select SYSDATE, ROUND(sysdate, 'CC')
from dual;
select SYSDATE, TRUNC(sysdate, 'CC')
from dual;
select SYSDATE, ROUND(to_date('2021/08/09'), 'YYYY')
from dual;
select SYSDATE, TRUNC(to_date('2021/08/09'), 'YYYY')
from dual;
select SYSDATE, ROUND(sysdate, 'MM')
from dual;
select SYSDATE, TRUNC(sysdate, 'MM')
from dual;

select ename, SYSDATE, ROUND(SYSDATE-hiredate)
from employee;
select ename, SYSDATE, TRUNC(SYSDATE-hiredate)
from employee;

select ename, hiredate, TRUNC(hiredate,'MONTH')
from employee;

select ename, SYSDATE, hiredate, months_between(SYSDATE,hiredate)
from employee;

select ename, hiredate, add_months(hiredate,6)
from employee;

select SYSDATE, next_day(SYSDATE,'토요일')
from dual;
select SYSDATE, next_day(SYSDATE,'토')
from dual;

select SYSDATE, last_day(SYSDATE)
from dual;

select To_char(hiredate), To_char(hiredate,'YYYY/MM/DD'),
To_char(hiredate), To_char(hiredate,'YY/MM/DD'),
To_char(hiredate), To_char(hiredate,'MM/DD'),
To_char(hiredate), To_char(hiredate,'YYYY/MM'),
To_char(hiredate), To_char(hiredate,'YYYY/MM/DY')  /*MON,DY*/
from employee;

select ename, To_char(SYSDATE,'YYYY/MM/DD PM HH12:MI:SS')
from employee;    /*기본적으로 12자리에 24를 쓰면 오전 오후 의미가없음.
                    12를 썼을경우 오전, 오후를 구분하기 위해 AM, PM 을 쓴다.*/

/*
<숫자 출력 형식>
0: 자릿 수를 나타내며, 자리 수가 맞지 않을 경우 0으로 채운다.
9: 자릿 수를 나타내며, 자리 수가 맞지 않아도 채우지 않는다.
L: 각 지역별 통화 기호
.: 소수점 표시
,: 천 단위 자리
*/
select ename, salary, To_char(salary, 'L000,000'),To_char(salary,'L999,999')
from employee;

--급여 일할 계산
select ename, salary, 
        to_char(last_day(sysdate),'DD')"월일수",
        round(salary/to_char(last_day(sysdate),'DD'))"일당",
        To_char(sysdate,'DD') - To_char(trunc(sysdate,'MONTH'),'DD') + 1 "근무 일수",
        round(salary/to_char(last_day(sysdate),'DD')) * 
        To_char(sysdate,'DD') - To_char(trunc(sysdate,'MONTH'),'DD') + 1 "급여일할계산"
        from employee;
        
        select ename, hiredate 
        from employee
        where hiredate = to_date('19810220', 'YYYYMMDD');
        
         select ename, hiredate 
        from employee
        where hiredate = '19810220';
        
        select to_number('100,000','999,999') - to_number('50,000','999,999')
        from dual;
        
        select ename, salary, commission,
               salary * 12 + nvl(commission,0) 연봉
        from employee
        order by 연봉 desc;
        
        select ename, salary, commission,
               nvl2(commission, salary * 12 + commission, salary*12) 연봉
        from employee
        order by 연봉 desc;
        
        select nullif('A','A'), nullif('A','B')
        from dual;
        
        select eno, ename, salary, commission,
        coalesce(commission,salary,0)
        from employee
        order by job;
        
        select ename, dno, 
        decode(dno, 10, 'ACCOUTING',20, 'RESEARCH', 30, 'SALES', 40, 'OPERATION','DEFAULT')
        as dname
        from employee
        order by dno;
        
        select ename, dno,
                case dno when 10 then 'ACCOUTING'
                     when 20 then 'RESEARCH'
                     when 30 then 'SALES'
                     when 40 then 'OPERATION'
                       else 'DEFAULT'
                       end as dname
                       from employee
                       order by dno;
                       
                       