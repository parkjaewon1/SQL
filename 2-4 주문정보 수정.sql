--�ֹ��� �ֹ��ܰ� ����
update ord_dtl
set ord_uprc = (select bk_uprc from book where bk_no='1001000001')
where bk_no = '1001000001'; --�Ǻ� ����

update ord_dtl
set ord_uprc = (select bk_uprc 
                from book 
                where bk_no = ord_dtl.bk_no); --��ü ����
commit;


--�ֹ��� �ֹ��ݾ� ����
update ord_dtl
set ord_amt = ord_cnt * ord_uprc;
commit;


--�ֹ�����Ʈ �ѰǼ� ����
update ord_mst
set tot_cnt = (select sum(ord_cnt) from ord_dtl where ord_no='2020000001')
where ord_no = '2020000001'; --�Ǻ� ����

update ord_mst
set tot_cnt = (select sum(ord_cnt) 
               from ord_dtl 
               where ord_no = ord_mst.ord_no); --��ü ����
commit;
               
--�ֹ�����Ʈ �ѱݾ� ����
update ord_mst
set tot_amt = (select sum(ord_amt) from ord_dtl where ord_no='2020000001')
where ord_no = '2020000001'; --�Ǻ� ����

update ord_mst
set tot_amt = (select sum(ord_amt) 
               from ord_dtl 
               where ord_no = ord_mst.ord_no); --��ü ����
commit;


--�ֹ������� �� �ֹ��� ������ ���ռ� ����
select ord_no, tot_cnt, tot_amt 
from ord_mst 
order by 1;
select ord_no, sum(ord_cnt), sum(ord_amt) 
from ord_dtl 
group by ord_no 
order by 1;

select ord_no, sum(m_cnt) mst_cnt, sum(m_amt) mst_amt, 
       sum(d_cnt) dtl_cnt, sum(d_amt) dtl_amt,
       sum(m_cnt) - sum(d_cnt) diff_cnt,
       sum(m_amt) - sum(d_amt) diff_amt       
from (select ord_no, tot_cnt m_cnt, tot_amt m_amt, 0 d_cnt, 0 d_amt from ord_mst
      union
      select ord_no, 0, 0, sum(ord_cnt), sum(ord_amt) from ord_dtl group by ord_no)
group by ord_no; --�ֹ���ȣ�� ���ռ� ����

select sum(m_cnt) mst_cnt, sum(m_amt) mst_amt, 
       sum(d_cnt) dtl_cnt, sum(d_amt) dtl_amt,
       sum(m_cnt) - sum(d_cnt) diff_cnt,
       sum(m_amt) - sum(d_amt) diff_amt       
from (select ord_no, tot_cnt m_cnt, tot_amt m_amt, 0 d_cnt, 0 d_amt from ord_mst
      union
      select ord_no, 0, 0, sum(ord_cnt), sum(ord_amt) from ord_dtl group by ord_no); --��ü ���ռ� ����
