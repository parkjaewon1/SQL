/* Q1. 사원 테이블의 구조를 검색하라. */
DESC EMPLOYEE;
/* Q2. 사원들의 사원번호, 사원이름, 사원직무를 검색하라. */
select ENO, ENAME, job from EMPLOYEE;
/* Q3. 사원들의 상급자사원번호(manager) 중복을 제거하고 검색하라. */
SELECT DISTINCT MANAGER FROM EMPLOYEE;
/* Q4. 사원들의 부서번호 중복을 제거하고 검색하라. */
SELECT DISTINCT DNO FROM EMPLOYEE;
/* Q5. 사원들의 6개월 급여의 합을 검색하라. */
SELECT SUM(SALARY*6) FROM EMPLOYEE;
/* Q6. 부서번호, 부서이름, 지역을 한글 제목으로 검색하라. */
SELECT DNO "부서번호",DNAME "부서이름", LOC "지역" FROM DEPARTMENT;
/* Q7. 입사일, 사원이름을 '80/12/17'에 입사한 SMITH입니다.' 식으로 검색하라. */
SELECT HIREDATE ||'에 입사한'|| ENAME ||'입니다.' FROM EMPLOYEE;
/* Q8. 부서번호 30 이외의 부서이름과 지역을 검색하라. */
SELECT DNAME,LOC FROM DEPARTMENT WHERE DNO <> 30;
/* Q9. 10번 부서에 근무하는 MANAGER의 사원이름을 검색하라. */
SELECT ENAME FROM EMPLOYEE WHERE JOB = 'MANAGER';
/* Q10. 사원직무가 "CLERK"이며, 81년 이후에 입사한 사원들의 사원번호와 사원이름을 검색하라. */
SELECT ENO, ENAME FROM EMPLOYEE WHERE JOB='CLERK' AND HIREDATE >='1981.01.01' ;
/* Q11. 20 부서 외에 근무하는 MANAGER의 사원이름을 검색하라. */
SELECT ENAME FROM EMPLOYEE WHERE DNO<>20 AND JOB = 'MANAGER';
/* Q12. SALESMAN이며, 급여가 1500 이상인 사원이름을 검색하라. */
SELECT ENAME FROM EMPLOYEE WHERE JOB = 'SALESMAN' AND SALARY>=1500;
/* Q13. 급여가 1000 이상이며, 2500 이하인 사원의 사원번호, 사원이름, 급여를 검색하라. */
SELECT ENO, ENAME, SALARY FROM EMPLOYEE WHERE SALARY<=2500 AND SALARY>=1000;
/* Q14. 사원번호가 75XX인 사원의 사원번호, 사원이름, 부서번호를 검색하라. */
SELECT ENO, ENAME, DNO FROM EMPLOYEE WHERE ENO LIKE '75%';
/* Q15. 부서번호가 10 또는 30에 근무하는 사원들의 사원이름과 급여를 검색하라. */
SELECT ENAME, SALARY FROM EMPLOYEE WHERE DNO = 10 OR DNO = 30;
/* Q16. 사원번호가 79로 시작하는 사원들의 사원이름, 급여, 커미션을 검색하라. */
SELECT ENAME, SALARY, COMMISSION FROM EMPLOYEE WHERE ENO LIKE '79%';
/* Q17. 1981년 2월에 입사한 사원의 사원번호, 사원이름, 부서번호를 검색하라. */
SELECT ENO, ENAME, DNO FROM EMPLOYEE WHERE HIREDATE >='1981.02.01' AND HIREDATE<'1981.03.01';
/* Q18. 사원이름 중간에 'A'가 들어있는 사원의 사원번호와 사원이름을 검색하라. */
SELECT ENO, ENAME FROM EMPLOYEE WHERE ENAME LIKE '%A%';
/* Q19. 상급자사원번호가 NULL인 사원의 사원번호와 사원이름을 검색하라. */
SELECT ENO, ENAME FROM EMPLOYEE WHERE MANAGER IS NULL;
/* Q20. 상급자사원번호가 NULL이 아닌 사원의 사원번호, 사원이름, 상급자사원번호를 검색하라. */
SELECT ENO, ENAME FROM EMPLOYEE WHERE MANAGER IS NOT NULL;
/* Q21. 사원직무가 'MANAGER'나 'SALESMAN'이 아닌 사원의 사원번호, 사원이름, 부서번호를 검색하라. */
SELECT ENO, ENAME FROM EMPLOYEE WHERE JOB NOT IN ('MANAGER','SALESMAN');
/* Q22. 사원들의 사원번호와 사원이름을 부서번호별 이름순으로 검색하라. */
SELECT DNO,ENO, ENAME FROM EMPLOYEE ORDER BY DNO ASC,ENAME ASC;
/* Q23. 사원들의 정보를 부서별 급여가 많은 순으로 검색하라. */
SELECT * FROM EMPLOYEE ORDER BY SALARY DESC;
/* Q24. 사원들의 정보를 부서번호별, 사원직무별, 급여 순으로 검색하라. */
SELECT * FROM EMPLOYEE ORDER BY DNO ASC, JOB ASC,SALARY ASC;


