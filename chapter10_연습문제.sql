?/*Q1. 사원(employee) 테이블과 같은 구조의 t_emp 테이블을 생성하시오
(eno는 primary key, dno는 외래키(department), salary는 NOT NULL 제약조건으로 한다).*/
create table t_emp (
	ENO		NUMBER(4,0),
	ENAME		VARCHAR2(10 BYTE),
	JOB		VARCHAR2(9 BYTE),
	MANAGER		NUMBER(4,0),
	HIREDATE	DATE,
	SALARY		NUMBER(7,2) not null,
	COMMISSION	NUMBER(7,2),
	DNO		NUMBER(2,0) constraint t_emp_fk references department(dno),
        constraint t_emp_pk primary key(eno));

desc t_emp;

/*Q2. t_emp 테이블에 대한 제약조건을 검색하시오.*/
select *
from user_constraints
where table_name = 'T_EMP';

/*Q3. t_emp 테이블에 외래 키 제약조건을 비활성화 시키시오. */
alter table t_emp
disable constraint t_emp_fk;

/*Q4. t_emp 테이블에 외래 키 제약조건을 다시 활성화 시키시오. */
alter table t_emp
enable constraint t_emp_fk;

/*Q5. t_emp 테이블에 외래 키 제약조건을 삭제하시오. */
alter table t_emp
drop constraint t_emp_fk;

/*Q6. t_emp 테이블을 삭제하시오. */
drop table t_emp;