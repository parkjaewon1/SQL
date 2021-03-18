grant select on hr.employee to usertest01;

select * from hr.department; /* public 권한부여 */

select * from role_sys_privs;

insert into hr.department(SELECT * FROM hr.department AS OF TIMESTAMP (SYSTIMESTAMP-INTERVAL '10'MINUTE));

select * from user_role_privs;
select * from role_tab_privs;

