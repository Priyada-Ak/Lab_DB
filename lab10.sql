===============================================================
						REAL CODE
===============================================================

CREATE OR REPLACE PROCEDURE LAB9_StudentGrade
IS
	vID		StudentScore.ID%type;
    vName   StudentScore.Name%type;
    vMid    StudentScore.Mid%type;
    vFinal  StudentScore.Final%type;
	vWork   StudentScore.Work%type;
    Score	NUMBER(3);
	Grade	CHAR(2);
	cursor calGrade is select ID,Name,Mid,Final,Work from StudentScore;
begin
	open calGrade;
	loop
		fetch calGrade into vID,vName,vMid,vFinal,vWork;
	exit when calGrade%notfound;
	Score := vMid+vFinal+vWork;
		if Score >= 80 THEN
			Grade := 'A';
		elsif Score >= 75 THEN
			Grade := 'B+';
		elsif Score >= 70 THEN
			Grade := 'B';
		elsif Score >= 65 THEN
			Grade := 'C+';
		elsif Score >= 60 THEN
			Grade := 'C';
		elsif Score >= 55 THEN
			Grade := 'D+';
		elsif Score >= 50 THEN
			Grade := 'D';
		else
			Grade := 'F';
		end if; 
		DBMS_OUTPUT.PUT_LINE('*************** Row. ' ||calGrade%rowcount|| ' ***************');
		DBMS_OUTPUT.PUT_LINE('Student ID : '||vID);
		DBMS_OUTPUT.PUT_LINE('Name : '||vName);
		DBMS_OUTPUT.PUT_LINE('Work score : '||vWork);
		DBMS_OUTPUT.PUT_LINE('Midterm score : '||vMid);
		DBMS_OUTPUT.PUT_LINE('Final score : '||vFinal);
		DBMS_OUTPUT.PUT_LINE('Total score : '||Score);
		DBMS_OUTPUT.PUT_LINE('Getting grade is '||Grade);
	end loop;
	close calGrade;
end;
/
-------------------------------------------------------------------------
//ข้อ1
CREATE or REPLACE PROCEDURE LAB8_DBGrade  
IS
--DECLARE
	vID 	CHAR(11);
	vName 	VARCHAR2(80);
	vMid 	Number(2);
	vFinal 	Number(2);
	vWork	Number(2);
	ttScore number(3);
BEGIN
	SELECT id,name,mid,final,work,mid+final+work TotalScore
	INTO vID,vName,vMid,vFinal,vWork,ttScore
	FROM StudentScore
	WHERE ID = '633021010-9'
	GROUP BY id,name,work,mid,final,ttScore;
	dbms_output.put_line ('Student ID : '||vID);
	dbms_output.put_line ('Name : '||vName);
	dbms_output.put_line ('Work score : '||vWork);
	dbms_output.put_line ('Midterm score : '||vMid);
	dbms_output.put_line ('Final score : '||vFinal);
	dbms_output.put_line ('Total score : '||ttScore);
	
	if ttScore >= 80 then
		dbms_output.put_line ('Getting grade is A' );
	elsif ttScore >= 70 AND ttScore <= 79 then
		dbms_output.put_line ('Getting grade is B' );
	elsif ttScore >= 60 AND ttScore <= 69 then
		dbms_output.put_line ('Getting grade is C' );
	elsif ttScore >= 50 AND ttScore <= 59 then
	dbms_output.put_line ('Getting grade is D' );
	else
		dbms_output.put_line ('Getting grade is F' );
	end if;
END;
/
===============================================================
						REAL CODE
===============================================================


========================================================
set linesize 150
set serveroutput ON
show USER


DECLARE
	vPID	Product.pid%TYPE;
	vPNAME	Product.pname%TYPE;
	vPRICE	Product.price%TYPE;
	vAMOUNT	Product.amount%TYPE;
CURSOR	p1 IS SELECT pid,pname,price,amount FROM Product;
--ORDER by...
BEGIN
	OPEN p1;
	LOOP
		FETCH p1 INTO vPID, vPNAME, vPRICE, vAMOUNT;
		EXIT WHEN p1%rowcount > 30 OR p1%notfound;
		DBMS_OUTPUT.PUT_LINE(vPID||' '||vPNAME||' '||vPRICE||' '||vAMOUNT);
	END LOOP;
	CLOSE p1;
END;
/
-----------------------------------------------
DECLARE
TYPE NumType IS TABLE OF NUMBER(5)
		INDEX BY binary_integer;
vNUM NumType;
BEGIN
	for x in 1..5 LOOP
		vNUM(x) := x*10;
	END LOOP;
	for y in 1..5 LOOP
		DBMS_OUTPUT.PUT_LINE(vNUM(y));
	END LOOP;
END;
/
-----------------------------------------------
DECLARE
TYPE AnimalTabType is TABLE OF VARCHAR2(10)
			INDEX BY binary_integer;
AnimalTabVar	AnimalTabType;
BEGIN
	AnimalTabVar(1) := 'RAT';
	AnimalTabVar(2) := 'PIG';
	AnimalTabVar(4) := 'HEN';
	AnimalTabVar(5) := 'ANT';
	AnimalTabVar(6) := 'DOG';
	DBMS_OUTPUT.PUT_LINE(AnimalTabVar(1));
	DBMS_OUTPUT.PUT_LINE(AnimalTabVar(2));
	DBMS_OUTPUT.PUT_LINE(AnimalTabVar(4));
	DBMS_OUTPUT.PUT_LINE(AnimalTabVar(5));
	DBMS_OUTPUT.PUT_LINE(AnimalTabVar(6));
END;
/
----------------------------------------------
DECLARE
LocVar	LOCATION%ROWTYPE;
BEGIN
	SELECT * INTO LocVar 
	FROM Location 
	WHERE LID = 'L04';
	dbms_output.put_line('Location: '||LocVar.LID||' '||LocVar.LNAME);
END;
/
----------------------------------------------
DECLARE
TYPE LocType is RECORD
(			
	vLID	Location.lid%TYPE,
	vLNAME	Location.lname%TYPE
);
LocVar	LocType;
BEGIN
	SELECT * INTO LocVar 
	FROM Location 
	WHERE LID = 'L04';
	dbms_output.put_line('Location: '||LocVar.vLID||' '||LocVar.vLNAME);
END;
/