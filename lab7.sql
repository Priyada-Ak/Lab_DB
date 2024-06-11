desc emp;
EMp (EMPNO, EMPNAME, SALARY, DEPTCODE)

desc econtact;
eContact (EMPNO, EMPNAME, EMAIL)

SELECT projcode, projname FROM proj
WHERE projcode IN (SELECT projcode FROM proj MINUS SELECT) ///ยังไม่เสร็จ

SELECT projcode from proj;
minus
SELECT projcode from empproj;

INSERT INTO proj VALUES ('P5','TTS');

SELECT empno,empname from emp
	WHERE empno IN 
(
SELECT empno from emp
minus
SELECT empno from empproj
); 


SELECT empno from emp
minus
SELECT empno from empproj;

SELECT EMPNO, EMPNAME FROM econtact
MINUS
SELECT empno, empname from emp;

SELECT EMPNO, EMPNAME FROM emp
MINUS
SELECT empno, empname from econtact;

SELECT EMPNO, EMPNAME FROM emp
INTERSECT
SELECT empno, empname from econtact;

SELECT EMPNO, EMPNAME FROM emp
UNION ALL
SELECT EMPNO, EMPNAME FROM econtact;

SELECT EMPNO, EMPNAME, 'emp' FROM emp
UNION 
SELECT EMPNO, EMPNAME, 'econtact' FROM econtact;

=================ADD===================
insert into emp values('E7','Tong',20000,'02');
insert into emp values('E8','Suluk',20000,'02');
insert into emp values('E9','Ubon',20000,'03');



=================SCRIPT====================
drop table proj purge;
drop table emp purge;
drop table empproj purge;
drop table econtact purge;


create table proj( 
projcode char(2),
projname    varchar2(30)
);
insert into proj values('P1','speech');
insert into proj values('P2','corpus');
insert into proj values('P3','OCR');


create table emp( 
empNo char(3),
empname varchar2(20),
salary  number(7),
deptcode char(2)
);
insert into emp values('E1','somsak',20000,'01');
insert into emp values('E2','somsri',15000,'02');
insert into emp values('E3','somluck',25000,'01');
insert into emp values('E4','somnuk',20000,'02');
insert into emp values('E5','sompathana',20000,'03');
insert into emp values('E6','somparsong',18000,'03');


create table EContact(
	empNo   char(3),
	empname varchar2(20),
	email   varchar2(30)
);

insert into EContact values('E1','somsak','somsak@gmail.com');
insert into EContact values('E2','somsri','somsri@gmail.com');
insert into EContact values('E3','somluck','somluck@gmail.com');
insert into EContact values('E4','somnuk','somnuk@gmail.com');
insert into EContact values('E5','sompathana','sompathana@gmail.com');
insert into EContact values('E6','somparsong','somparsong@gmail.com');

create table empproj
( 
	empNo char(3),
	projcode char(2)
);
insert into empproj values ('E1','P1');
insert into empproj values ('E1','P2');
insert into empproj values ('E1','P3');
insert into empproj values ('E2','P1');
insert into empproj values ('E3','P2');
insert into empproj values ('E4','P3');
insert into empproj values ('E5','P1');
