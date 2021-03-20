--주문상세 할인 컬럼 추가
alter table ord_dtl
    add(ord_dc number(5,2) default 0);
    
desc ord_dtl;

--어린이 정통 삼국지 20%할인 적용
select bk_no from book
where bk_nm = '어린이 정통 삼국지';

select * from book
where bk_nm like '%정통 삼국지%';

select * from ord_dtl
where bk_no = '1002000002';

update ord_dtl
set ord_dc = 20,
    ord_amt = (ord_cnt * ord_uprc) - (ord_cnt * ord_uprc * 0.2)
where bk_no = (select bk_no
                from book
                where bk_nm = '어린이 정통 삼국지');
                

--고객정보 리스트
select cust_nm, cust_no, rdnm_addr
from cust
order by cust_nm;

--출판사 리스트
select pbcm_cd, pbcm_nm, chpr_nm, chpr_telno
from pbcm
order by pbcm_nm;

--출판사별 도서리스트  ( 틀림, 조인을 할때 pbcm p, book b와 같이 별칭을 꼭 붙여야함,
--to_char(b.bk_uprc, '999,999') 콤마를 붙이기 위한 char문)
select p.pbcm_cd , p.pbcm_nm, p.chpr_nm, p.chpr_telno, b.bk_nm,
b.bk_no, to_char(b.bk_uprc, '999,999')
from pbcm p, book b
where p.pbcm_cd = b.pbcm_cd
order by p.pbcm_nm, b.bk_nm;

--주문 리스트    (복습)
select m.ord_dt, c.cust_nm, c.cust_no, m.ord_no, 
       b.bk_nm||'('||p.pbcm_nm||')', d.ord_cnt, to_char(d.ord_uprc,'999,999'),to_char( d.ord_amt,'999,999')
from cust c,ord_mst m, ord_dtl d, book b, pbcm p
where c.cust_no = m.cust_no 
and m.ord_no = d.ord_no
and d.bk_no= b.bk_no 
and b.pbcm_cd= p.pbcm_cd
and ord_dt between '20191101' and '20191130'
order by m.ord_dt, c.cust_nm, m.ord_no;


--출판사별 주문 현황
select p.pbcm_nm, b.bk_nm, sum(d.ord_cnt), to_char(sum(d.ord_amt),'999,999')
from pbcm p, book b, ord_dtl d
where p.pbcm_cd =b.pbcm_cd
and b.bk_no = d.bk_no
group by p.pbcm_nm, b.bk_nm
order by p.pbcm_nm, b.bk_nm;


--도서 주문순위  (top 5 출력)
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


--하반기 고객별 월별 주문현황
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





