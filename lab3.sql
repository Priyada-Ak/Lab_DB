==============ฉันรันโค้ดนี้ไม่ได้ โว้ยยยยยยยยยยยยยยยยยยยยยยยยย==============
DROP TABLE product;
DROP TABLE location;
DROP TABLE product_type;

CREATE TABLE location
(
	LID		CHAR(3),
	LName		VARCHAR2(30),
	CONSTRAINTS loc_pk PRIMARY KEY(LID)
);

CREATE TABLE product_type
(
	TID		CHAR(3),
	TName		VARCHAR2(30),
	CONSTRAINTS ptype_pk PRIMARY KEY(TID)
);
CREATE TABLE product
(
	PID	 	CHAR(3),
	PName		VARCHAR2(30),
	Price		NUMBER(6,2),
	TID		CHAR(3),
	CONSTRAINTS prod_pk PRIMARY KEY(PID),
	CONSTRAINTS prod_fk_ptype FOREIGN KEY(TID)
		REFERENCES product_type(TID)
);


INSERT INTO product_type VALUES('T02','เครื่องใช้ไฟฟ้า');
INSERT INTO product_type VALUES('T01','เครื่องเขียน');
INSERT INTO product VALUES('P01','Table',2000,'T01');
commit;

==================คืออะไร=====================

===== update ================================================
commit; //ก่อน

rollback; //ย้อนกลับ

DROP TABLE Location PURGE; //ลบทั้งหมดให้สิ้นซาก ไม่เหลือขยะ
DROP TAB:E product_type;

UPDATE product set LID = 'L01'
WHERE TID is NULL OR LID is NULL;

UPDATE product set LID = 'L01'
WHERE TID is NULL AND LID is NULL;

INSERT INTO Location VALUES('L01','Sc.01');
INSERT INTO Location VALUES('L02','Sc.03');
INSERT INTO Location VALUES('L03','Sc.03');



UPDATE product SER TID = 'T01'
WHERE TID is NULL; //เทสจ้า ทำแล้ว roll back

//update เฉพาะบางรายการ
UPDATE product SET price = 5000
WHERE PID = 'P03'; //ใส่ให้ถูกด้วยจ้า ไม่งั้นไม่ทำงานนะไอ้ P03 อะ

UPDATE product SER price = 4500
WHERE pname LIKE 'Prin%'; //ขึ้นต้นด้วย Prin เปลี่ยนให้หมด

//เปลี่ยนทั้งหมด
UPDATE product SET TIP = 'T01';

UPDATE <tab_name>
SET col_name = new_val;


//เปลี่ยนแค่บางรายการ
UPDATE <tab_name>
WHERE condition;

UPDATE <tab_name>
SET col_name = new_val;
	col_name2 = new_val2
WHERE column_name_1 op val/col_name;

//มากกว่าหนึ่งเงื่อนไข
UPDATE <tab_name>
SET col_name = new_val;
	col_name2 = new_val2
WHERE (column_name_1 op val/col_name) AND/OR
	  ()




=====insert==================================================
INSERT INTO product(PID,PNAME,PRICE,TID)
	VALUES ('P04','Printer',500,T03);

INSERT INTO product(PID,PNAME,PRICE,TID)
	VALUES ('P03','Monitor',500,T02);

NSERT INTO product(PID,PNAME,PRICE,TID)
	VALUES ('P02','Chair',500,NULL);



SELECT CONSTRAINT_NAME, CONTRAINT_TYPE
FROM USER_CONSTRAINTS;


desc USER_CONSTRAINTS

ALTER TABLE product
	ADD(
		LID		CHAR(3),
		CONSTRAINTS prod_fk_Loc FOREIGN KEY(LID)
				REFERENCES location(LID)
	);

ALTER TABLE product
	ADD(AMOUNT	NUMBER(3));

ALTER TABLE <tab_name>
ADD(
	col_name data_type constraint,
	col_name data_type constraint
);

ALTER TABLE <tab_name>
ADD(
	CONSTRAINTS constraint_name PRIMARY KEY(col_name),
	CONSTRAINTS constraint_name2 FOREIGN KEY(col_name2)
				REFERENCES tabe-name(col_name2)
);


=============== SEC 1 ================
UPDATE product
SET LID = 'L01'
WHERE TID is NULL AND LID is NULL;

INSERT INTO Location VALUES('L01','Sc.01');
INSERT INTO Location VALUES('L02','Sc.02');
INSERT INTO Location VALUES('L03','Sc.03');

UPDATE product
SET price = 3500
WHERE PNAME LIKE 'Pri%';

UPDATE product
SET price = 4000
WHERE PID = 'P03';

UPDATE <tab_name> SET 
	col_name1 = new_data1,
	col_name2 = 'new_data2';
WHERE (col_name op val/col_name)
	AND/OR (col_name2 op val/col_name);

UPDATE <tab_name> SET 
	col_name1 = new_data1,
	col_name2 = 'new_data2';
WHERE colname operation val/col_name;

อัพบางตัว
UPDATE <tab_name> 
SET col_name1 = new_data1,
	col_name2 = 'new_data2'
WHERE conditon;



อัพทัั้งหมด
UPDATE product SET 
	TID = 'T01',
	AMOUNT = 10;
	
UPDATE <tab_name> SET 
	col_name1 = new_data1,
	col_name2 = 'new_data2';

INSERT INTO product(PID,PNAME,PRICE,TID)
	   VALUES ('P02','Chair',500,NULL);
	   
INSERT INTO product(PID,PNAME,PRICE,TID)
VALUES ('P04','Printer',500,NULL);

SELECT CONSTRAINT_NAME,        
	   CONSTRAINT_TYPE,
	   TABLE_NAME     
FROM USER_CONSTRAINTS;	   

DESC USER_CONSTRAINTS 

ALTER TABLE product
ADD (
	LID		CHAR(3),
	CONSTRAINTS product_fk_Loc FOREIGN KEY(LID)
			REFERENCES location (LID)
);

ALTER TABLE product
ADD AMOUNT NUMBER(3);

//ปรับโครงสร้าง

ALTER TABLE <table-name> 
ADD (
	col_name data_type constraint,
	col_name data_type constraint,
); 

ALTER TABLE <table-name> 
ADD (
	CONSTRAINTS  contraint_name PRIMARY KEY(col_name)
); 

ALTER TABLE <table-name> 
ADD (
	col_name data_type constraint,
	CONSTRAINTS  contraint_name PRIMARY KEY(col_name),
	CONSTRAINTS constraint_name2 FOREIGN KEY(col_name0)
			REFERENCES table-name(col_name)
); 


===============================================================
						REAL CODE
===============================================================
CREATE TABLE Subject
(
	SubjCode		CHAR(6),
	Name_Tha		VARCHAR2(80),
	Name_Eng		VARCHAR2(80),
	Credit			NUMBER(2),
	Desc_Tha		VARCHAR2(80),
	Desc_Eng		VARCHAR2(80),
	CONSTRAINTS Subjcode_pk PRIMARY KEY(Subjcode)
);

CREATE TABLE Register(
	StdID ,
	SubjCode ,
	Year NUMBER(4),
	Semester	NUMBER(1),
	Grade	NUMBER(4,2),
	CONSTRAINTS Register_pk PRIMARY KEY(StdID,SubjCode,Year),
	CONSTRAINTS Register_fk_Std FOREIGN KEY(StdID) REFERENCES Student(StdID),
	CONSTRAINTS Register_fk_Subj FOREIGN KEY(SubjCode) REFERENCES Subject(SubjCode)
);

CREATE TABLE Teacher(
	TCode	CHAR(3),
	TFName	VARCHAR2(80),
	TLName	VARCHAR2(80),
	FCode	,
	DCode	,
	CONSTRAINTS Teacher_pk PRIMARY KEY(TCode),
	CONSTRAINTS Teacher_fk_Fact FOREIGN KEY(FCode) REFERENCES Fact(FCode),
	CONSTRAINTS Teacher_fk_Dept FOREIGN KEY(FCode,DCode) REFERENCES Dept(FCode,DCode)
);

INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode)
VALUES ('T01','พุธษดี','ศิริแสงตระกูล','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode)
VALUES ('T02','สมจิตร','อาจอินทร์','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode)
VALUES ('T03','สันติ','ทินตะนัย','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode)
VALUES ('T04','อภิศักดิ์','พัฒนจักร','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode)
VALUES ('T05','สมชัย','อัษฎายุทธ','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode)
VALUES ('T06','บุญส่ง','วัฒนกิจ','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode)
VALUES ('T07','งามนิจ','อาจอินทร์','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode)
VALUES ('T08','ไกรสร','วงษ์พราวมาศ','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode)
VALUES ('T09','อุรฉัตร','โคแก้ว','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode)
VALUES ('T10','ปัญญาพล','หอระตะ','F01','D03');

-------------------------------------------------------
INSERT INTO Subject(SubjCode,Name_Tha,Name_Eng,Credit,Desc_Tha,Desc_Eng)
VALUES ('000103','ภาษาอังกฤษทางวิชาการ 2','English II',3,'ภาษาอังกฤษทางวิชาการ 2','English II');

INSERT INTO Subject(SubjCode,Name_Tha,Name_Eng,Credit,Desc_Tha,Desc_Eng)
VALUES ('000171','ชีวิตสุขภาพ','Healthy life II',3,'ชีวิตสุขภาพ','Healthy life');

INSERT INTO Subject(SubjCode,Name_Tha,Name_Eng,Credit,Desc_Tha,Desc_Eng)
VALUES ('314125','แคลคูลัส','Calculus',3,'แคลคูลัส','Calculus');

INSERT INTO Subject(SubjCode,Name_Tha,Name_Eng,Credit,Desc_Tha,Desc_Eng)
VALUES ('316201','สถิติขั้นต้น','Intro to statistics',3,'สถิติขั้นต้น','Intro to statistics');

INSERT INTO Subject(SubjCode,Name_Tha,Name_Eng,Credit,Desc_Tha,Desc_Eng)
VALUES ('322212','โครงสร้างข้อมูล','Data structures',3,'โครงสร้างข้อมูล','Data structures');

INSERT INTO Subject(SubjCode,Name_Tha,Name_Eng,Credit,Desc_Tha,Desc_Eng)
VALUES ('322336','ระบบฐานข้อมูลและการออกแบบ','Database systems ',3,'ระบบฐานข้อมูลและการออกแบบ','Database systems ');


-------------------------------------------------------
ALTER TABLE Student
ADD (
	TCode	CHAR(3),
	CONSTRAINTS Student_fk_Teacher FOREIGN KEY(TCode)
			REFERENCES Teacher (TCode)
);

-------------------------------------------------------
UPDATE Student
SET TCode = 'T01'
WHERE StdID = '633021010-9';

UPDATE Student
SET TCode = 'T02'
WHERE StdID = '633020429-7';

UPDATE Student
SET TCode = 'T03'
WHERE StdID = '633020569-1';

UPDATE Student
SET TCode = 'T04'
WHERE StdID = '633020388-5';

---------------------------------------------------------
CREATE TABLE Register(
	StdID ,
	SubjCode ,
	Year NUMBER(4),
	Semester	NUMBER(1),
	Grade	NUMBER(4,2),
	CONSTRAINTS Register_pk PRIMARY KEY(StdID,SubjCode,Year),
	CONSTRAINTS Register_fk_Std FOREIGN KEY(StdID) REFERENCES Student(StdID),
	CONSTRAINTS Register_fk_Subj FOREIGN KEY(SubjCode) REFERENCES Subject(SubjCode)
);

INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade)
VALUES ('633020568-3','000103',2564,1,3.50);

INSERT INTO Register VALUES ('633021010-9','000103',2564,1,3.50);
INSERT INTO Register VALUES ('633021010-9','000171',2564,1,3.60);
INSERT INTO Register VALUES ('633021010-9','314125',2564,1,3.70);
INSERT INTO Register VALUES ('633021010-9','316201',2564,2,2.50);
INSERT INTO Register VALUES ('633021010-9','322212',2564,2,2.60);
INSERT INTO Register VALUES ('633021010-9','322336',2564,2,2.70);

INSERT INTO Register VALUES ('633020569-1','000103',2564,1,3.51);
INSERT INTO Register VALUES ('633020569-1','000171',2564,1,3.61);
INSERT INTO Register VALUES ('633020569-1','314125',2564,1,3.71);
INSERT INTO Register VALUES ('633020569-1','316201',2564,2,2.51);
INSERT INTO Register VALUES ('633020569-1','322212',2564,2,2.61);
INSERT INTO Register VALUES ('633020569-1','322336',2564,2,2.71);

INSERT INTO Register VALUES ('633020388-5','000103',2564,1,3.52);
INSERT INTO Register VALUES ('633020388-5','000171',2564,1,3.62);
INSERT INTO Register VALUES ('633020388-5','314125',2564,1,3.72);
INSERT INTO Register VALUES ('633020388-5','316201',2564,2,2.52);
INSERT INTO Register VALUES ('633020388-5','322212',2564,2,2.62);
INSERT INTO Register VALUES ('633020388-5','322336',2564,2,2.72);

INSERT INTO Register VALUES ('633020429-7','000103',2564,1,3.53);
INSERT INTO Register VALUES ('633020429-7','000171',2564,1,3.63);
INSERT INTO Register VALUES ('633020429-7','314125',2564,1,3.73);
INSERT INTO Register VALUES ('633020429-7','316201',2564,2,2.53);
INSERT INTO Register VALUES ('633020429-7','322212',2564,2,2.63);
INSERT INTO Register VALUES ('633020429-7','322336',2564,2,2.73);

