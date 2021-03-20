--�ֹ��� ���� �÷� �߰�
alter table ord_dtl
    add(ord_dc number(5,2) default 0);
    
desc ord_dtl;

--��� ���� �ﱹ�� 20%���� ����
select bk_no from book
where bk_nm = '��� ���� �ﱹ��';

select * from book
where bk_nm like '%���� �ﱹ��%';

select * from ord_dtl
where bk_no = '1002000002';

update ord_dtl
set ord_dc = 20,
    ord_amt = (ord_cnt * ord_uprc) - (ord_cnt * ord_uprc * 0.2)
where bk_no = (select bk_no
                from book
                where bk_nm = '��� ���� �ﱹ��');
                

--������ ����Ʈ
select cust_nm, cust_no, rdnm_addr
from cust
order by cust_nm;

--���ǻ� ����Ʈ
select pbcm_cd, pbcm_nm, chpr_nm, chpr_telno
from pbcm
order by pbcm_nm;

--���ǻ纰 ��������Ʈ  ( Ʋ��, ������ �Ҷ� pbcm p, book b�� ���� ��Ī�� �� �ٿ�����,
--to_char(b.bk_uprc, '999,999') �޸��� ���̱� ���� char��)
select p.pbcm_cd , p.pbcm_nm, p.chpr_nm, p.chpr_telno, b.bk_nm,
b.bk_no, to_char(b.bk_uprc, '999,999')
from pbcm p, book b
where p.pbcm_cd = b.pbcm_cd
order by p.pbcm_nm, b.bk_nm;

--�ֹ� ����Ʈ    (����)
select m.ord_dt, c.cust_nm, c.cust_no, m.ord_no, 
       b.bk_nm||'('||p.pbcm_nm||')', d.ord_cnt, to_char(d.ord_uprc,'999,999'),to_char( d.ord_amt,'999,999')
from cust c,ord_mst m, ord_dtl d, book b, pbcm p
where c.cust_no = m.cust_no 
and m.ord_no = d.ord_no
and d.bk_no= b.bk_no 
and b.pbcm_cd= p.pbcm_cd
and ord_dt between '20191101' and '20191130'
order by m.ord_dt, c.cust_nm, m.ord_no;


--���ǻ纰 �ֹ� ��Ȳ
select p.pbcm_nm, b.bk_nm, sum(d.ord_cnt), to_char(sum(d.ord_amt),'999,999')
from pbcm p, book b, ord_dtl d
where p.pbcm_cd =b.pbcm_cd
and b.bk_no = d.bk_no
group by p.pbcm_nm, b.bk_nm
order by p.pbcm_nm, b.bk_nm;


--���� �ֹ�����  (top 5 ���)
select bk_no, bk_nm, cnt
from (
select b.bk_no, b.bk_nm, sum(d.ord_cnt) cnt
from book b, ord_dtl d, ord_mst m
where b.bk_no = d.bk_no
and   d.ord_no = m.ord_no
and  substr(m.ord_dt,1,4) = '2019'
group by b.bk_no, b.bk_nm
order by cnt desc
)
where rownum <=3;


--�Ϲݱ� ���� ���� �ֹ���Ȳ
select cust_nm, sum(m07),sum(m08),sum(m09),sum(m10),sum(m11),sum(m12)
from(
        select c.cust_nm, 
                decode(substr(m.ord_dt,5,2),'07', sum(m.tot_cnt), 0) m07,
                decode(substr(m.ord_dt,5,2),'08', sum(m.tot_cnt), 0) m08,
                decode(substr(m.ord_dt,5,2),'09', sum(m.tot_cnt), 0) m09,
                decode(substr(m.ord_dt,5,2),'10', sum(m.tot_cnt), 0) m10,
                decode(substr(m.ord_dt,5,2),'11', sum(m.tot_cnt), 0) m11,
                decode(substr(m.ord_dt,5,2),'12', sum(m.tot_cnt), 0) m12
        from cust c, ord_mst m
        where c.cust_no = m.cust_no
        and substr(m.ord_dt,1,6) between '201907' and '201912'
        group by c.cust_nm, substr(m.ord_dt,5,2)
)
group by cust_nm;





