/* Q1. ������� ����̸�, ��������� �ҹ��ڷ� �˻��϶�. */
select LOWER(ename), LOWER(job)
from employee;

/* Q2. ������� ����̸�, ��������� �빮�ڷ� �˻��϶�. */
select UPPER(ename), UPPER(job)
from employee;

/* Q3. ������� ����̸�, ��������� ù �ڸ� �빮�ڷ� �˻��϶�. */
select INITCAP(ename),INITCAP(job)
from employee;

/* Q4. ������� ����̸��� ����̸��� �� ���ڸ� �˻��϶�. */
select ename, substr(ename,1,2)
from employee;

/* Q5. ������� ����̸��� ����̸��� ���̸� �˻��϶�. */
select ename, length(ename)
from employee;

/* Q6. ������� ����̸��� 'A'�� �� ��° ��ġ�� �ִ��� �˻��϶�. */
select ename, instr(ename,'A')
from employee;

/* Q7. ����̸��� 15�ڸ��� �ϰ�, �ڿ� '*'�� ä�� �˻��϶�. */
select RPAD(ename,15,'*')
from employee;

/* Q8. ����� �����ȣ, ����̸�, �޿��� �˻��϶�(�޿��� �� ��° �ڸ����� �ݿø���). */
select eno, ename, round(salary, -2)"�޿�"
from employee;

/* Q9. ����� �����ȣ, ����̸�, �޿��� �˻��϶�(�޿��� �� ��° �ڸ����� ������). */
select eno, ename, trunc(salary, -2)"�޿�"
from employee;

/* Q10. ����� �����ȣ, ����̸�, �Ի� �� 100���� ��¥�� �˻��϶�. */
select eno, ename,hiredate, hiredate+100"100��"
from employee;

/* Q11. ����� �����ȣ, ����̸�, �Ի���, �ٹ� ���ڸ� ����Ͽ� �˻��϶�. */
select eno, ename, hiredate, round(sysdate - hiredate)"�ٹ�����"
from employee;

/* Q12. ������� �Ի��Ͽ��� 3��° �Ǵ� ��¥�� �˻��϶�. */
select eno, ename, hiredate, add_months(hiredate,3)
from employee;

/* Q13. ������� �Ի��� ���� ������� ��¥�� �˻��϶�. */
select eno, ename, hiredate, next_day(hiredate,'��')
from employee;

/* Q14. ������� �Ի���� ������ ��¥�� �˻��϶�. */
select hiredate, last_day(hiredate)
from employee;

/* Q15. ����ڻ����ȣ�� ���� ����� ��� '����� ����'�� ��Ÿ������ �ϴ� ���ǹ��� �ۼ��϶�. */
select ename,
nvl(to_char(MANAGER),'����� ����') "����ڿ���"
from employee;

/* Q16. Ŀ�̼��� ������ �޿��� �����ȣ, ����̸��� �Բ� �˻��϶�. */
select eno, ename,
salary * 12 + nvl(commission,0) �޿�
from employee;
        
/* Q17. ����ڻ����ȣ�� NULL�� ��� 'CEO'�� �ٲپ� �����ȣ, ����̸�, ����ڻ����ȣ�� �˻��϶�. */
select eno, ename,
nvl(to_char(MANAGER),'CEO') "����ڻ����ȣ"
from employee;

/* Q18. DECODE �Լ��� ���޿� ���� �λ�ȱ޿��� ���Ͻÿ�. ������ 'SALESMAN'�� ����� 10%, 'MANAGER'�� ����� 30%, 'CLERK'�� ����� 20%�� �λ��Ͻÿ�. */
  select ename, job, 
        decode(JOB, 'SALESMAN', to_char(salary*1.1),
        'MANAGER', to_char(salary*1.3), 
        'CLERK', to_char(salary*1.2), 'DEFAULT')
        as �λ�ȱ޿�
        from employee;
        
/* Q19. CASE �Լ��� ���޿� ���� �λ�ȱ޿��� ���Ͻÿ�. ������ 'SALESMAN'�� ����� 10%, 'MANAGER'�� ����� 30%, 'CLERK'�� ����� 20%�� �λ��Ͻÿ�. */
   select ename, job,
                case job when 'SALESMAN' then to_char(salary*1.1)
                     when 'MANAGER' then to_char(salary*1.3)
                     when 'CLERK' then to_char(salary*1.2)
                       else 'DEFAULT'
                       end as �λ�ȱ޿�
                       from employee;