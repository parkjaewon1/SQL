grant select on employee to usertest02 with grant option;

grant select on department to public;

grant select on employee to roletest02;

select * from system.sampletbl;

create synonym priv_sampletbl for system.sampletbl; /*전용 동의어 생성*/

select * from priv_sampletbl;  /*전용 동의어 사용*/

select * from pub_sampletbl;  /*공용 동의어 사용*/

drop synonym priv_sampletbl; /*전용 동의어 삭제*/


/*트리거*/
create table dept_original
as
select * from department where 0=1;

create table dept_log
as
select * from department where 0=1;

create or replace trigger trigger_sample1
    after insert 
    on dept_original
    for each row
begin 
    if inserting then
        DBMS_OUTPUT.PUT_LINE('Insert Trigger 발생');
        insert into dept_log
            values (:new.dno, :new.dname, :new.loc);
    end if;
end;
/
insert into dept_original
    values (10, 'IT', 'SEOUL');
    
    select * from dept_original;
    select * from dept_log;
    
    create or replace trigger trigger_sample2
        after delete
        on dept_original
        for each row
    begin
         DBMS_OUTPUT.PUT_LINE('Delete Trigger 발생');
        delete from dept_log
            where dept_log.dno = :old.dno;
end;
/

delete from dept_original where dno= 10;

select * from dept_original;
select * from dept_log;

drop table 상품;

create table 상품(
    상품코드 char(6) primary key,
    상품명 varchar2(12) not null,
    제조사 varchar(12),
    소비자가격 number(8) default 0,
    재고수량 number default 0
);
create table 입고(
    입고번호 char(6) primary key,
    상품코드 char(6) references 상품(상품코드),
    입고일자 date default sysdate,
    입고수량 number(6),
    입고단가 number(8),
    입고금액 number(8)
);

insert into 상품(상품코드, 상품명, 제조사, 소비자가격)
values('A00001','세탁기','LG','500');

insert into 상품(상품코드, 상품명, 제조사, 소비자가격)
values('A00002','컴퓨터','LG','700');

insert into 상품(상품코드, 상품명, 제조사, 소비자가격)
values('A00003','냉장고','삼성','600');

--입고 트리거
CREATE OR REPLACE TRIGGER TRG_03
    AFTER INSERT ON 입고
    FOR EACH ROW
BEGIN
    UPDATE 상품
    SET 재고수량 = 재고수량 + :NEW.입고수량
    WHERE 상품코드 = :NEW.상품코드;
END;
    /
    
insert into 입고 values (1, 'A00001', sysdate, 5 , 320, 1600);
insert into 입고 values (2, 'A00002', sysdate, 10 , 680, 6800);
insert into 입고 values (3, 'A00003', sysdate, 5 , 220, 1100);
insert into 입고 values (4, 'A00003', sysdate, 5 , 220, 1100);

select * from 입고;
select * from 상품;

--갱신트리거
CREATE OR REPLACE TRIGGER TRG_04
    AFTER UPDATE ON 입고
    FOR EACH ROW
BEGIN
    UPDATE 상품
    SET 재고수량 = 재고수량 + (-:old.입고수량+:new.입고수량)
    WHERE 상품코드 = :new.상품코드;
END;
    /

update 입고 set 입고수량 =10, 입고금액 =2200
where 입고번호 =3;
select * from 입고 order by 입고번호;
select * from 상품;



--삭제트리거
CREATE OR REPLACE TRIGGER TRG_05
    AFTER DELETE ON 입고
    FOR EACH ROW
BEGIN
    UPDATE 상품
    SET 재고수량 = 재고수량 - :old.입고수량
    WHERE 상품코드 = :old.상품코드;
END;
    /

delete 입고 where 입고번호=3;
select * from 입고;
select * from 상품;