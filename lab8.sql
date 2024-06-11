===============================================================
						REAL CODE
===============================================================
SELECT Text FROM User_Source WHERE Name = 'LAB7_STUDENT' ORDER BY Line;

//ข้อ1
CREATE or REPLACE PROCEDURE LAB7_Student 
IS
	vStdid		CHAR(11);
	vStdfname	VARCHAR2(40);
	vStdlname	VARCHAR2(40);
	vStdaddress	VARCHAR2(80);
	vFcode		CHAR(3);
	vDcode		CHAR(3);
	vTcode		CHAR(3);
BEGIN
	SELECT 	 STDID,STDFNAME,STDLNAME,STDADDRESS,FCODE,DCODE,TCODE          
	INTO 	 vStdid,vStdfname,vStdlname,vStdaddress,vFcode,vDcode,vTcode
	FROM student
	WHERE Stdid = '633021010-9';
	dbms_output.put_line('Student ID : '||vStdid);
	dbms_output.put_line('FirstName : '||vStdfname);
	dbms_output.put_line('LastName : '||vStdlname);
	dbms_output.put_line('Address : '||vStdaddress);
	dbms_output.put_line('FCODE : '||vFcode);
	dbms_output.put_line('DCODE : '||vDcode);
	dbms_output.put_line('TCODE: '||vTcode);
EXCEPTION
	WHEN no_data_found THEN
		dbms_output.put_line('NO DATA MATCH CONDITION');
END;
/


DROP PROCEDURE LAB7_StudentDept;
//ข้อ2
CREATE or REPLACE PROCEDURE LAB7_StudentDept 
IS
	vStdid		CHAR(11);
	vStdfname	VARCHAR2(40);
	vStdlname	VARCHAR2(40);
	vStdaddress	VARCHAR2(80);
	vFname_tha	VARCHAR2(80);
	vDname_tha	VARCHAR2(80);
BEGIN
	SELECT 	 STDID,STDFNAME,STDLNAME,STDADDRESS,Fname_Tha,Dname_Tha          
	INTO 	 vStdid,vStdfname,vStdlname,vStdaddress,vFname_tha,vDname_tha
	FROM student,fact,dept
	WHERE 	Stdid = '633021010-9'
		AND student.fcode = fact.fcode
		AND student.dcode = dept.dcode; 
	dbms_output.put_line('Student ID : '||vStdid);
	dbms_output.put_line('FirstName : '||vStdfname);
	dbms_output.put_line('LastName : '||vStdlname);
	dbms_output.put_line('Address : '||vStdaddress);
	dbms_output.put_line('Faculty Name : '||vFname_tha);
	dbms_output.put_line('Department Name : '||vDname_tha);
EXCEPTION
	WHEN no_data_found THEN
		dbms_output.put_line('NO DATA MATCH CONDITION');
END;
/



DROP PROCEDURE LAB7_Register;
//ข้อ3

DROP PROCEDURE LAB7_Register;
CREATE or REPLACE PROCEDURE LAB7_Register 
IS
	vStdid		CHAR(11); 
	vStdfname	VARCHAR2(40);
	vStdlname	VARCHAR2(40);
	vCredit		NUMBER(2);
	vRegisterFee NUMBER(5);
BEGIN
	SELECT 	student.stdid,stdfname,stdlname,SUM(credit) totalcredit,SUM(credit*1000) regisFee
	INTO 	vStdid,vStdfname,vStdlname,vCredit,vRegisterFee
	FROM 	student,register,subject
	WHERE 	student.Stdid = '633021010-9'
		AND student.stdid = register.stdid
		AND subject.subjcode = register.subjcode
	GROUP BY student.stdid,stdfname,stdlname;
	dbms_output.put_line('Student ID : '||vStdid);
	dbms_output.put_line('FirstName : '||vStdfname);
	dbms_output.put_line('LastName : '||vStdlname);
	dbms_output.put_line('Credit : '||vCredit);
	dbms_output.put_line('Register Fee : '||vRegisterFee);
END;
/




===============================================================
						REAL CODE
===============================================================
=================================================
//JOIN 2 TABLE
CREATE or REPLACE PROCEDURE ProdLoc
IS
	vPid	CHAR(3);
	vPname	VARCHAR2(30);
	vPrice	NUMBER(6,2);
	vLid	CHAR(3);
	vLname	VARCHAR2(30);
BEGIN
	SELECT 	pid,pname,price,product.lid,lname
	INTO 	vPid,vPname,vPrice,vLid,vLname
	FROM 	product,location
	WHERE 	product.lid = location.lid
	AND		pid = 'P06';
	dbms_output.put_line('Pid   : '||vPid);
	dbms_output.put_line('Pname : '||vPname);
	dbms_output.put_line('Price : '||vPrice);
	dbms_output.put_line('Lid   : '||vLid);
	dbms_output.put_line('Lname : '||vLname);
END;
/

=============================
SELECT Text FROM User_Source WHERE Name = 'procedure_name' ORDER BY Line;
SELECT Text FROM User_Source WHERE Name = 'PRODUCTLIST' ORDER BY Line;


CREATE or REPLACE PROCEDURE productList
IS
	vPid	CHAR(3);
	vPname	VARCHAR2(30);
	vPrice	NUMBER(6,2);
BEGIN
	SELECT pid,pname,price
	INTO vPid,vPname,vPrice
	FROM product
	WHERE pid = 'P06';
	dbms_output.put_line('pid = '||vPid);
	dbms_output.put_line('pname = '||vPname  );
	dbms_output.put_line('price = '||vPrice );
	
EXCEPTION
	WHEN no_data_found THEN
		dbms_output.put_line('NO DATA MATCH CONDITION JAH TRY ANOTHER NAJAH');
END;
/

=============================
DECLARE
	vLid	CHAR(3);
	vLname	VARCHAR2(30);
BEGIN
	SELECT lid,lname
	INTO vLid,vLname
	FROM location
	WHERE lid = 'L01';
	dbms_output.put_line('lid = '||vLid);
	dbms_output.put_line('lname = '||vLname  );
EXCEPTION
	WHEN no_data_found THEN
		dbms_output.put_line('NO DATA MATCH CONDITION JAH TRY ANOTHER NAJAH');
END;
/

DECLARE
	vPid	CHAR(3);
	vPname	VARCHAR2(30);
	vPrice	NUMBER(6,2);
BEGIN
	SELECT pid,pname,price
	INTO vPid,vPname,vPrice
	FROM product
	WHERE pid = 'p06';
	dbms_output.put_line('pid = '||vPid);
	dbms_output.put_line('pname = '||vPname  );
	dbms_output.put_line('price = '||vPrice );
	
EXCEPTION
	WHEN no_data_found THEN
		dbms_output.put_line('NO DATA MATCH CONDITION JAH TRY ANOTHER NAJAH');
END;
/

// เทสการใช้งาน
DECLARE
	A NUMBER(5);
	B NUMBER(5);
	C NUMBER(5);
BEGIN
	A := 10;
	B := 20;
	C := A + B;
	dbms_output.put_line('C = '||A||'+'||B||'='||C);
END;
/
====================================
BEGIN
	DBMS_OUTPUT.PUT_LINE('My name is Atsadawut Homdee
	TEST LINE');
	DBMS_OUTPUT.PUT_LINE('I am 20 years old');
END;
/