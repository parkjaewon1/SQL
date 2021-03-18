grant select on employee to usertest02 with grant option;

grant select on department to public;

grant select on employee to roletest02;

select * from system.sampletbl;

create synonym priv_sampletbl for system.sampletbl; /*���� ���Ǿ� ����*/

select * from priv_sampletbl;  /*���� ���Ǿ� ���*/

select * from pub_sampletbl;  /*���� ���Ǿ� ���*/

drop synonym priv_sampletbl; /*���� ���Ǿ� ����*/


/*Ʈ����*/
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
        DBMS_OUTPUT.PUT_LINE('Insert Trigger �߻�');
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
         DBMS_OUTPUT.PUT_LINE('Delete Trigger �߻�');
        delete from dept_log
            where dept_log.dno = :old.dno;
end;
/

delete from dept_original where dno= 10;

select * from dept_original;
select * from dept_log;

drop table ��ǰ;

create table ��ǰ(
    ��ǰ�ڵ� char(6) primary key,
    ��ǰ�� varchar2(12) not null,
    ������ varchar(12),
    �Һ��ڰ��� number(8) default 0,
    ������ number default 0
);
create table �԰�(
    �԰��ȣ char(6) primary key,
    ��ǰ�ڵ� char(6) references ��ǰ(��ǰ�ڵ�),
    �԰����� date default sysdate,
    �԰���� number(6),
    �԰�ܰ� number(8),
    �԰�ݾ� number(8)
);

insert into ��ǰ(��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���)
values('A00001','��Ź��','LG','500');

insert into ��ǰ(��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���)
values('A00002','��ǻ��','LG','700');

insert into ��ǰ(��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���)
values('A00003','�����','�Ｚ','600');

--�԰� Ʈ����
CREATE OR REPLACE TRIGGER TRG_03
    AFTER INSERT ON �԰�
    FOR EACH ROW
BEGIN
    UPDATE ��ǰ
    SET ������ = ������ + :NEW.�԰����
    WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
END;
    /
    
insert into �԰� values (1, 'A00001', sysdate, 5 , 320, 1600);
insert into �԰� values (2, 'A00002', sysdate, 10 , 680, 6800);
insert into �԰� values (3, 'A00003', sysdate, 5 , 220, 1100);
insert into �԰� values (4, 'A00003', sysdate, 5 , 220, 1100);

select * from �԰�;
select * from ��ǰ;

--����Ʈ����
CREATE OR REPLACE TRIGGER TRG_04
    AFTER UPDATE ON �԰�
    FOR EACH ROW
BEGIN
    UPDATE ��ǰ
    SET ������ = ������ + (-:old.�԰����+:new.�԰����)
    WHERE ��ǰ�ڵ� = :new.��ǰ�ڵ�;
END;
    /

update �԰� set �԰���� =10, �԰�ݾ� =2200
where �԰��ȣ =3;
select * from �԰� order by �԰��ȣ;
select * from ��ǰ;



--����Ʈ����
CREATE OR REPLACE TRIGGER TRG_05
    AFTER DELETE ON �԰�
    FOR EACH ROW
BEGIN
    UPDATE ��ǰ
    SET ������ = ������ - :old.�԰����
    WHERE ��ǰ�ڵ� = :old.��ǰ�ڵ�;
END;
    /

delete �԰� where �԰��ȣ=3;
select * from �԰�;
select * from ��ǰ;