/*�����Լ�*/
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
        
        select substr('����Ŭ�ŴϾ�',3,4),
               substrb('����Ŭ�ŴϾ�',3,4)
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
        from dual;                 /* ���� ����*/
        
        select INSTR('Oracle mania','a', 5, 2)
        from dual;
        
        select *
        from employee
        where ename like '__A%';
        
        select *
        from employee
        where INSTR(ename,'A', 3, 1) = 3;
        
        select LPAD(salary,10,'*')
        from employee;               /* salary�� ��ü�ڸ� 10�� ä��� �������� *�� ä���� */
        
        select RPAD(salary,10,'*')
        from employee;
        
        select TRIM('O' from 'Oracle mania')
        from dual;    /*  �Ǿ��̳� �ڿ� �빮�� O�� ���� */
        
        select TRIM(' ' from 'Oracle mania ')
        from dual;    /*  �Ǿ��̳� �ڿ� ���� ���ڸ� ���� */
        
        select TRIM(' Oracle mania ')
        from dual;    /*  �Ǿ��̳� �ڿ� ���鹮�ڸ� ����(��κ� �̷��� ���̻����.) */
        
        select LTRIM(' Oracle mania ')
        from dual;    /*  �Ǿտ� ���� ���� */
        
        select RTRIM(' Oracle mania ')
        from dual;    /*  �ǵڿ� ���� ���� */
        
        
        
/* �����Լ� */
select 98.7654,
       ROUND(98.7654),
       ROUND(98.7654,2),
       ROUND(98.7654,-1), /*-1 �� 1����, -2�� 10����, -3�� 100���� �ݿø�*/
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

/*��¥ �Լ�*/

select SYSDATE-1 ����, SYSDATE ����, SYSDATE+1 ����, SYSDATE+2 ��
from dual;       /*��¥�� ������ ����*/

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

select SYSDATE, next_day(SYSDATE,'�����')
from dual;
select SYSDATE, next_day(SYSDATE,'��')
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
from employee;    /*�⺻������ 12�ڸ��� 24�� ���� ���� ���� �ǹ̰�����.
                    12�� ������� ����, ���ĸ� �����ϱ� ���� AM, PM �� ����.*/

/*
<���� ��� ����>
0: �ڸ� ���� ��Ÿ����, �ڸ� ���� ���� ���� ��� 0���� ä���.
9: �ڸ� ���� ��Ÿ����, �ڸ� ���� ���� �ʾƵ� ä���� �ʴ´�.
L: �� ������ ��ȭ ��ȣ
.: �Ҽ��� ǥ��
,: õ ���� �ڸ�
*/
select ename, salary, To_char(salary, 'L000,000'),To_char(salary,'L999,999')
from employee;

--�޿� ���� ���
select ename, salary, 
        to_char(last_day(sysdate),'DD')"���ϼ�",
        round(salary/to_char(last_day(sysdate),'DD'))"�ϴ�",
        To_char(sysdate,'DD') - To_char(trunc(sysdate,'MONTH'),'DD') + 1 "�ٹ� �ϼ�",
        round(salary/to_char(last_day(sysdate),'DD')) * 
        To_char(sysdate,'DD') - To_char(trunc(sysdate,'MONTH'),'DD') + 1 "�޿����Ұ��"
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
               salary * 12 + nvl(commission,0) ����
        from employee
        order by ���� desc;
        
        select ename, salary, commission,
               nvl2(commission, salary * 12 + commission, salary*12) ����
        from employee
        order by ���� desc;
        
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
                       
                       