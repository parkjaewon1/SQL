?/*Q1. ���(employee) ���̺�� ���� ������ t_emp ���̺��� �����Ͻÿ�
(eno�� primary key, dno�� �ܷ�Ű(department), salary�� NOT NULL ������������ �Ѵ�).*/
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

/*Q2. t_emp ���̺� ���� ���������� �˻��Ͻÿ�.*/
select *
from user_constraints
where table_name = 'T_EMP';

/*Q3. t_emp ���̺� �ܷ� Ű ���������� ��Ȱ��ȭ ��Ű�ÿ�. */
alter table t_emp
disable constraint t_emp_fk;

/*Q4. t_emp ���̺� �ܷ� Ű ���������� �ٽ� Ȱ��ȭ ��Ű�ÿ�. */
alter table t_emp
enable constraint t_emp_fk;

/*Q5. t_emp ���̺� �ܷ� Ű ���������� �����Ͻÿ�. */
alter table t_emp
drop constraint t_emp_fk;

/*Q6. t_emp ���̺��� �����Ͻÿ�. */
drop table t_emp;