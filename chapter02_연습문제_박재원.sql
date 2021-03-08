/* Q1. ��� ���̺��� ������ �˻��϶�. */
DESC EMPLOYEE;
/* Q2. ������� �����ȣ, ����̸�, ��������� �˻��϶�. */
select ENO, ENAME, job from EMPLOYEE;
/* Q3. ������� ����ڻ����ȣ(manager) �ߺ��� �����ϰ� �˻��϶�. */
SELECT DISTINCT MANAGER FROM EMPLOYEE;
/* Q4. ������� �μ���ȣ �ߺ��� �����ϰ� �˻��϶�. */
SELECT DISTINCT DNO FROM EMPLOYEE;
/* Q5. ������� 6���� �޿��� ���� �˻��϶�. */
SELECT SUM(SALARY*6) FROM EMPLOYEE;
/* Q6. �μ���ȣ, �μ��̸�, ������ �ѱ� �������� �˻��϶�. */
SELECT DNO "�μ���ȣ",DNAME "�μ��̸�", LOC "����" FROM DEPARTMENT;
/* Q7. �Ի���, ����̸��� '80/12/17'�� �Ի��� SMITH�Դϴ�.' ������ �˻��϶�. */
SELECT HIREDATE ||'�� �Ի���'|| ENAME ||'�Դϴ�.' FROM EMPLOYEE;
/* Q8. �μ���ȣ 30 �̿��� �μ��̸��� ������ �˻��϶�. */
SELECT DNAME,LOC FROM DEPARTMENT WHERE DNO <> 30;
/* Q9. 10�� �μ��� �ٹ��ϴ� MANAGER�� ����̸��� �˻��϶�. */
SELECT ENAME FROM EMPLOYEE WHERE JOB = 'MANAGER';
/* Q10. ��������� "CLERK"�̸�, 81�� ���Ŀ� �Ի��� ������� �����ȣ�� ����̸��� �˻��϶�. */
SELECT ENO, ENAME FROM EMPLOYEE WHERE JOB='CLERK' AND HIREDATE >='1981.01.01' ;
/* Q11. 20 �μ� �ܿ� �ٹ��ϴ� MANAGER�� ����̸��� �˻��϶�. */
SELECT ENAME FROM EMPLOYEE WHERE DNO<>20 AND JOB = 'MANAGER';
/* Q12. SALESMAN�̸�, �޿��� 1500 �̻��� ����̸��� �˻��϶�. */
SELECT ENAME FROM EMPLOYEE WHERE JOB = 'SALESMAN' AND SALARY>=1500;
/* Q13. �޿��� 1000 �̻��̸�, 2500 ������ ����� �����ȣ, ����̸�, �޿��� �˻��϶�. */
SELECT ENO, ENAME, SALARY FROM EMPLOYEE WHERE SALARY<=2500 AND SALARY>=1000;
/* Q14. �����ȣ�� 75XX�� ����� �����ȣ, ����̸�, �μ���ȣ�� �˻��϶�. */
SELECT ENO, ENAME, DNO FROM EMPLOYEE WHERE ENO LIKE '75%';
/* Q15. �μ���ȣ�� 10 �Ǵ� 30�� �ٹ��ϴ� ������� ����̸��� �޿��� �˻��϶�. */
SELECT ENAME, SALARY FROM EMPLOYEE WHERE DNO = 10 OR DNO = 30;
/* Q16. �����ȣ�� 79�� �����ϴ� ������� ����̸�, �޿�, Ŀ�̼��� �˻��϶�. */
SELECT ENAME, SALARY, COMMISSION FROM EMPLOYEE WHERE ENO LIKE '79%';
/* Q17. 1981�� 2���� �Ի��� ����� �����ȣ, ����̸�, �μ���ȣ�� �˻��϶�. */
SELECT ENO, ENAME, DNO FROM EMPLOYEE WHERE HIREDATE >='1981.02.01' AND HIREDATE<'1981.03.01';
/* Q18. ����̸� �߰��� 'A'�� ����ִ� ����� �����ȣ�� ����̸��� �˻��϶�. */
SELECT ENO, ENAME FROM EMPLOYEE WHERE ENAME LIKE '%A%';
/* Q19. ����ڻ����ȣ�� NULL�� ����� �����ȣ�� ����̸��� �˻��϶�. */
SELECT ENO, ENAME FROM EMPLOYEE WHERE MANAGER IS NULL;
/* Q20. ����ڻ����ȣ�� NULL�� �ƴ� ����� �����ȣ, ����̸�, ����ڻ����ȣ�� �˻��϶�. */
SELECT ENO, ENAME FROM EMPLOYEE WHERE MANAGER IS NOT NULL;
/* Q21. ��������� 'MANAGER'�� 'SALESMAN'�� �ƴ� ����� �����ȣ, ����̸�, �μ���ȣ�� �˻��϶�. */
SELECT ENO, ENAME FROM EMPLOYEE WHERE JOB NOT IN ('MANAGER','SALESMAN');
/* Q22. ������� �����ȣ�� ����̸��� �μ���ȣ�� �̸������� �˻��϶�. */
SELECT DNO,ENO, ENAME FROM EMPLOYEE ORDER BY DNO ASC,ENAME ASC;
/* Q23. ������� ������ �μ��� �޿��� ���� ������ �˻��϶�. */
SELECT * FROM EMPLOYEE ORDER BY SALARY DESC;
/* Q24. ������� ������ �μ���ȣ��, ���������, �޿� ������ �˻��϶�. */
SELECT * FROM EMPLOYEE ORDER BY DNO ASC, JOB ASC,SALARY ASC;


