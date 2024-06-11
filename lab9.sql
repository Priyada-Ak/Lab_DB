===============================================================
						REAL CODE
===============================================================

DROP PROCEDURE LAB8_Power2 ;
//ข้อ1
CREATE or REPLACE PROCEDURE LAB8_Power2 
IS
--DECLARE
	x number := 0;
	y constant number := 2;
BEGIN
	LOOP
	x:= x+1;
	DBMS_OUTPUT.PUT_LINE (Y||'^'||X||' = '||POWER(Y,X));
	exit when x >= 10;
	END LOOP;
END;
/

//ข้อ2
CREATE TABLE StudentScore(
	ID 		CHAR(11),
	Name 	VARCHAR2(80),
	Mid 	Number(2),
	Final 	Number(2),
	Work	Number(2)	
);

//ข้อ3
INSERT INTO StudentScore(ID,Name,Mid,Final,Work) VALUES ('553020621-7','สิทธิชัย สมทรัพย์',29,38,28);
INSERT INTO StudentScore(ID,Name,Mid,Final,Work) VALUES ('555020270-4','พงษ์ศธร จันทร์ยอย',15,20,10);
INSERT INTO StudentScore(ID,Name,Mid,Final,Work) VALUES ('633021010-9','อัษฎาวุธ หอมดี',30,40,30);

//ข้อ4
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
set linesize 150
set serveroutput ON
show USER

=======================

DECLARE
	n_sales NUMBER := &n_sales;
	n_com NUMBER;
BEGIN
	--n_sales := 150000;
	CASE
		WHEN n_sales > 200000 THEN n_com := 20;
		WHEN n_sales >= 100000 AND n_sales < 200000 THEN n_com := 15;
		WHEN n_sales >= 50000 AND n_sales < 100000 THEN n_com := 10;
		WHEN n_sales > 30000 THEN n_com := 5;
		ELSE n_com := 0;
	END CASE;
	DBMS_OUTPUT.PUT_LINE( 'Commission is ' || n_com || '%' );
END;
/

//REVERSE ปริ้นท์ถอยหลัง
DECLARE
	B NUMBER := &B;
	E NUMBER := &E;
BEGIN
	FOR i in REVERSE B .. E LOOP 
			DBMS_OUTPUT.PUT_LINE('i = '||i);
	END LOOP;
END;
/

declare
	X number := 1;
	M constant number := &M;
BEGIN
	WHILE (x<=12)
	LOOP
		DBMS_OUTPUT.PUT_LINE (M||'x'||X||' = '||M*X);
		X := X+1;
	END LOOP;
END;
/

//สูตรคูณ
declare
	x number := 0;
	y constant number := 12;
BEGIN
	LOOP
	x:= x+1;
	DBMS_OUTPUT.PUT_LINE (Y||'x'||X||' = '||Y*X);
	exit when x >= 12;
	END LOOP;
END;
/

//เงื่อนไข
Declare
	Score number(3) := &S;
	v_status char(1) := 'A' ;
	v_status2 char(1) := 'B' ;
Begin
	if score > 80 then
		dbms_output.put_line ('Grade = A' );
	elsif score > 75 then
		dbms_output.put_line ('Grade = B ' );
	else
		dbms_output.put_line ('Grade less than B ' );
	end if;
end;
/

//เงื่อนไข
Declare
	Score number(3) := &Score;
	v_status char(1) := 'A' ;
	v_status2 char(1) := 'B' ;
Begin
	if score >= 80 then
		dbms_output.put_line ('Grade = '||v_status);
	else
		dbms_output.put_line ('Grade = '||v_status2);
	end if;
end;
/

//แบบเติมเปอร์เซ็นแล้วคำนวณ
DECLARE
	perInc		NUMBER(2) := &perInc;
	vPID		product.PID%TYPE;
	vPname		product.PNAME%TYPE;
	vPrice		product.PRICE%TYPE;
	vNewPrice	product.PRICE%TYPE;
BEGIN
	SELECT pid,pname,price
		INTO vPID,vPname,vPrice
		FROM product
		WHERE PID = 'P01';
	vNewPrice := vPrice + perInc*vPrice/100;
	Dbms_OUTPUT.PUT_LINE('Row : '||sql%rowcount);
	DBMS_OUTPUT.PUT_LINE('PID : '||vPID);
	DBMS_OUTPUT.PUT_LINE('PName : '||vPName);
	DBMS_OUTPUT.PUT_LINE('Price : '||vPrice);
	DBMS_OUTPUT.PUT_LINE('New Price : '||vNewPrice);
END;
/

//คำนวณค่าใหม่
DECLARE
	perInc		NUMBER(2) := 5;
	vPID		product.PID%TYPE;
	vPname		product.PNAME%TYPE;
	vPrice		product.PRICE%TYPE;
	vNewPrice	product.PRICE%TYPE;
BEGIN
	SELECT pid,pname,price
		INTO vPID,vPname,vPrice
		FROM product
		WHERE PID = 'P01';
	vNewPrice := vPrice + perInc*vPrice/100;
	Dbms_OUTPUT.PUT_LINE('Row : '||sql%rowcount);
	DBMS_OUTPUT.PUT_LINE('PID : '||vPID);
	DBMS_OUTPUT.PUT_LINE('PName : '||vPName);
	DBMS_OUTPUT.PUT_LINE('Price : '||vPrice);
	DBMS_OUTPUT.PUT_LINE('New Price : '||vNewPrice);
END;
/