INSERT INTO Product(PID,PName,Amt) 
			VALUES('P02','โต๊ะ',4);

INSERT INTO Product(PID,PName,Amt) 
			VALUES('P01','Chair',4);

INSERT INTO <tabName>(colName2,colName1) 
			VALUES ('data2',data1)
			

INSERT INTO Location(Lname,LID) VALUES ('Sc. 08','L02');


INSERT INTO <tabName> VALUES (Data, 'data2');
INSERT INTO Location VALUES ('L01','SC. 01');


DROP TABLE <table_name> PURGE

CREATE TABLE Product(
	PID 	CHAR(3),
	PName	VARCHAR2(30),
	Price	NUMBER(5),
	Amt		NUMBER(3),
	LID		CHAR(3),
	PTCode	CHAR(3),
	CONSTRAINTS Prod_pk PRIMARY KEY(PID),
	CONSTRAINTS Product_fk_Loc FOREIGN KEY(LID) REFERENCES Location(LID),
	CONSTRAINTS Prod_fk_Ptype FOREIGN KEY(PTCode)REFERENCES PType(PTCode)
);


CREATE TABLE <tabName2>(
	colName4	DataType constraint,
	colName5	DataType constraint,
	colName1	DataType,
	ColName2	DataType,
	CONSTRAINTS <conName> PRIMARY KEY(ColName4)
	CONSTRAINTS <ConName2> FOREIGN KEY(ColName1,ColName2)
				REFERENCES TabName(ColName1,ColName2);
);

CREATE TABLE <tabName1>(
	colName1	DataType constraint,
	colName2	DataType constraint,
	colName3	DataType constraint,
	CONSTRAINTS <conName> PRIMARY KEY(ColName1,ColName2)
);


DROP TABLE PType0 PURGE;
DESC USER_CONSTRAINTS

CREATE TABLE Ptype(
	PTCode	CHAR(3),
	PTDesc	VARCHAR2(30),
	CONSTRAINTS	Ptype_pk PRIMARY KEY(PTCode)
);


CREATE TABLE Location(
	LID		Char(3),
	Lname	VARCHAR2(30),
	CONSTRAINTS Loc_Pk PRIMARY KEY(LID)
);

CREATE TABLE <tabName>(
	colName1	DataType constraint,
	colName2	DataType constraint,
	CONSTRAINTS <conName> PRIMARY KEY(ColName1)
);

CREATE TABLE Ptype(
	PTCode	CHAR(3),
	PTDesc	VARCHAR2(30),
	CONSTRAINTS	Ptype_pk PRIMARY KEY(PTCode)
);


CREATE TABLE <tabName>(
	colName1	DataType constraint,
	colName2	DataType constraint,
);

CREATE TABLE Ptype0(
	PTCode	CHAR(3),
	PTDesc	VARCHAR2(30) 
);

TABLE: Location
	LID		Char(3) PRIMARY KEY
	Lname	Char(30)
	
TABLE: Ptype
	PTCode	Char(3) PRIMARY KEY
	PTDesc	Char(30)
	
TABLE: Product
	PID		Char(3) PRIMARY KEY
	Pname	Char(39)
	Price	NUMBER(8.2)
	Amt		NUMBER
	LID		Char(3) (FK refer to LID of Location)
	PTCode	Char(3) (FK refer to PTCode of Ptype)
	
	


Product (PID (Pk), Pname,Price,Amt,LID (Fk), PTCode (Fk))
Location (LID (Pk), Lname)
Ptype(PTCode (Pk), PDesc)

===============================================================
						REAL CODE
===============================================================
CREATE TABLE Product(
	StdID	   CHAR(11),
	StdFName   VARCHAR2(40),
	StdLname   VARCHAR2(40),
	StdAddress VARCHAR2(80),
	FCode		
	DCode	
	
);

CREATE TABLE Fact(
	FCode	   CHAR(3),
	FName_Tha   VARCHAR2(80),
	FName_Eng   VARCHAR2(80),
	CONSTRAINTS Fact_pk_FCode PRIMARY KEY(FCode)
);

CREATE TABLE Dept(
	FCode	   ,
	DCode 	   CHAR(3),
	DName_Tha VARCHAR2(80),
	DName_Eng VARCHAR2(80),
	CONSTRAINTS Dept_pk_FDCode PRIMARY KEY(FCode,DCode),
	CONSTRAINTS Dept_fk_FCode FOREIGN KEY(FCode) REFERENCES Fact(FCode)
);

CREATE TABLE Student(
	StdID CHAR(11),
	StdFName VARCHAR2(40),
	StdLname VARCHAR2(40),
	StdAddress VARCHAR2(80),
	FCode	   ,
	DCode 	   ,
	CONSTRAINTS student_fk_fact PRIMARY KEY(StdID),
	CONSTRAINTS std_fk_dept FOREIGN KEY(FCode,DCode) REFERENCES Dept(FCode,DCode)
);

INSERT INTO Fact(FCode,FName_Tha,FName_Eng) VALUES ('F01','คณะวิทยาศาสตร์','Science');
INSERT INTO Fact(FCode,FName_Tha,FName_Eng) VALUES ('F02','คณะวิศวกรรมศาสตร์','Engineer');
INSERT INTO Fact(FCode,FName_Tha,FName_Eng) VALUES ('F03','คณะเทคโนโลยี','Technology');
INSERT INTO Fact(FCode,FName_Tha,FName_Eng) VALUES 
		('F04','คณะมนุษยศาสตร์และสังคมศาสตร์','Humanities and Social Sciences');
INSERT INTO Fact(FCode,FName_Tha,FName_Eng) VALUES ('F05','คณะศึกษาศาสตร์','Education');


INSERT INTO Dept(FCode,DCode,DName_Tha,DName_Eng) VALUES ('F01','D01','คณิตศาสตร์','Mathematics');
INSERT INTO Dept(FCode,DCode,DName_Tha,DName_Eng) VALUES ('F01','D02','สถิติ','Statistics'); 
INSERT INTO Dept(FCode,DCode,DName_Tha,DName_Eng) VALUES ('F01','D03','วิทยาการคอมพิวเตอร์','Computer Science'); 
INSERT INTO Dept(FCode,DCode,DName_Tha,DName_Eng) VALUES ('F02','D01','วิศวกรรมคอมพิวเตอร์','Computer Engineer'); 
INSERT INTO Dept(FCode,DCode,DName_Tha,DName_Eng) VALUES ('F03','D01','เทคโนโลยีการอาหาร','Food Technology');

INSERT INTO Student(StdID,StdFName,StdLname,FCode,DCode,StdAddress) VALUES ('633021010-9','อัษฎาวุธ','หอมดี','F01','D03','0001');

INSERT INTO Student(StdID,StdFName,StdLname,FCode,DCode,StdAddress) Values ('633020569-1','สิริวัฒก์','คณพิทักษ์ธนชัย','F01','D03','0002');

INSERT INTO Student(StdID,StdFName,StdLname,FCode,DCode,StdAddress) Values ('633020388-5','ช่อปทุม','อุดมชาติ','F02','D01','0003');

INSERT INTO Student(StdID,StdFName,StdLname,FCode,DCode,StdAddress) Values ('633020429-7','อภิชัย','ทัพภูตา','F03','D01','0004');










DELETE FROM Student WHERE StdID='633021010-9';

UPDATE Student SET StdLname = 'หอมดี'
WHERE StdId = '633021010-9';

UPDATE Student SET StdLname = 'อุดมชาติ'
WHERE StdId = '633020388-5';

UPDATE Student SET StdLname = 'ทัพภูตา'
WHERE StdId = '633020429-7';


