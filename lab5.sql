===============================================================
						REAL CODE
===============================================================
1
CREATE VIEW LAB5_Credit AS 
SELECT student.stdid,stdfname,stdlname,
       SUM(credit) TotalCredit
FROM student,subject,register
WHERE student.stdid = register.stdid
	AND subject.subjcode = register.subjcode
GROUP BY student.stdid,stdfname,stdlname
ORDER BY stdid;

2
CREATE VIEW LAB5_RegFee AS 
SELECT student.stdid,stdfname,stdlname,year,semester,
       SUM(credit) TotalCredit,
	   SUM(credit*1000) RegFee 
FROM student,subject,register
WHERE student.stdid = register.stdid
	AND subject.subjcode = register.subjcode
GROUP BY student.stdid,stdfname,stdlname,year,semester
ORDER BY stdid;

3
CREATE VIEW LAB5_GPA AS 
SELECT student.stdid,stdfname,stdlname,
       SUM(grade*credit)/SUM(credit) GPA 
FROM student,subject,register
WHERE student.stdid = register.stdid
	AND subject.subjcode = register.subjcode
GROUP BY student.stdid,stdfname,stdlname
ORDER BY GPA;

4
INSERT INTO Student(StdID,StdFName,StdLname,StdAddress,FCode,DCode,TCode) Values ('563020197-5','กฤษดา ','โสมายัง','123 จ.ขอนแก่น','F01','D03','T01');
INSERT INTO Student(StdID,StdFName,StdLname,StdAddress,FCode,DCode) Values ('563020200-2','ขวัญข้าว  ','เสียงเลิศ','11 จ.ขอนแก่น','F01','D03');
INSERT INTO Student(StdID,StdFName,StdLname,StdAddress,FCode,DCode) Values ('563020205-2','ชนนิกา  ','ปัญจันทร์สิงห์','15 จ.ขอนแก่น','F01','D03');
INSERT INTO Student(StdID,StdFName,StdLname,StdAddress,FCode,DCode) Values ('563020206-0','ชนัญชิดา  ','อินทะสร้อย','16 จ.ขอนแก่น','F01','D03');

5
CREATE VIEW LAB5_GPA_Outer AS 
SELECT student.stdid,stdfname,stdlname,
       SUM(grade*credit)/SUM(credit) GPA 
FROM student,subject,register
WHERE student.stdid = register.stdid (+)
	AND subject.subjcode = register.subjcode (+)
GROUP BY student.stdid,stdfname,stdlname
ORDER BY GPA;

6
CREATE VIEW LAB5_Teacher_Outer AS 
SELECT stdid,stdfname,stdlname,teacher.tcode,tfname,tlname
FROM student,teacher
WHERE student.tcode = teacher.tcode (+)
GROUP BY stdid,stdfname,stdlname,teacher.tcode,tfname,tlname
ORDER BY tcode;




===============================================================
						REAL CODE
===============================================================
CREATE VIEW prodVal AS 
SELECT product.lid,lname,
       SUM(price*amount)totalPrice,
	   MAX(price) MaxPrice,
	   MIN(price) MinPrice,
	   AVG(price) AvgPrie
FROM product,location
WHERE product.lid = location.lid (+)
GROUP BY product.lid,lname
ORDER BY lid;

SELECT product.lid,lname,SUM(price*amount),
	   MAX(price),MIN(price),
	   AVG(price)
FROM product,location
WHERE product.lid = location.lid (+)
GROUP BY product.lid,lname
ORDER BY lid;

SELECT lid,tid,SUM(price*amount),
	   MAX(price),MIN(price),
	   AVG(price)
FROM product
GROUP BY lid,tid;

SELECT lid,SUM(price*amount),
	   MAX(price),MIN(price),
	   AVG(price)
FROM product
GROUP BY lid;

SELECT SUM(price*amount),
	   MAX(price),MIN(price),
	   AVG(price)
FROM product;

SELECT SUM(price*amount) FROM product;

SUM AVG MAX MIN COUNT 

SELECT SUM(col),MAX(col),MIn(col) FROM tabName;

//มีสินค้าใหม่แล้วเพิ่มผ่าน view 
INSERT INTO prodNew5(pid,pname,price) 
	   VALUES('P99','PhoneCase',100);

//สร้างวิว
CREATE VIEW prodNew5 AS 
SELECT pid,pname,price,
	   price*0.05 inc5,price+price*0.05 Newprice5
FROM   Product;

//ค่าราคาใหม่
SELECT pid,pname,price,
	   price*0.05 inc5,price+price*0.05 Newprice5
FROM   Product;

//ปรับราคาสินค้า
SELECT pid,pname,price,price*0.05
FROM   Product;

SELECT pid,pname,price,
	   product.lid,lname,
	   product.tid,tname
FROM   product,location,product_type
WHERE  product.lid = location.lid (+)
AND    product.tid = product_type.tid (+)
AND    product.lid is NULL;

SELECT pid,pname,price,
	   product.lid,lname,
	   product.tid,tname
FROM   product,location,product_type
WHERE  product.lid = location.lid (+)
AND    product.tid = product_type.tid (+);

SELECT pid,pname,price,product.tid,tname
FROM   product,product_type 
WHERE  product.tid = product_type.tid (+);

//outer join 
SELECT pid,pname,price,product.lid,lname
FROM   product,location 
WHERE  product.lid = location.lid (+);

//join TABLE
SELECT pid,pname,price,product.lid,lname
FROM   product,location 
WHERE  product.lid = location.lid;

//ดึงเฉพาะ L01
SELECT pid,pname,price,
	   P.lid,lname,
	   P.tid,tname
FROM   product P,location L,product_type Pt
WHERE  P.lid = L.lid
AND    P.tid = Pt.tid
AND    P.lid='L01';

//equal join 
SELECT pid,pname,price,
	   P.lid,lname,
	   P.tid,tname
FROM   product P,location L,product_type Pt
WHERE  P.lid = L.lid
AND    P.tid = Pt.tid;

//3 table
SELECT pid,pname,price,
	   product.lid,lname,
	   product.tid,tname
FROM   product,location,product_type
WHERE  product.lid = location.lid
AND    product.tid = product_type.tid;


SELECT pid,pname,price,product.tid,tname
FROM   product,product_type 
WHERE  product.tid = product_type.tid;

======================SCRIPT==============================
DROP TABLE product PURGE;
DROP TABLE location PURGE;
DROP TABLE product_type PURGE;

CREATE TABLE location
(
	LID	CHAR(3),
	LName	VARCHAR2(30),
	CONSTRAINT loc_pk PRIMARY KEY(LID)
);

CREATE TABLE product_type
(
	TID	CHAR(3),
	TName	VARCHAR2(30),
	CONSTRAINT ptype_pk PRIMARY KEY(TID)
);

CREATE TABLE product
(
	PID	 CHAR(3),
	PName	VARCHAR2(30),
	Price	NUMBER(6,2),
	Amount   NUMBER(3),
	TID	CHAR(3),
	LID	CHAR(3),
	CONSTRAINT prod_pk PRIMARY KEY(PID),
	CONSTRAINT prod_fk_ptype FOREIGN KEY(TID)
		REFERENCES product_type(TID),
	CONSTRAINT prod_fk_location FOREIGN KEY(LID)
		REFERENCES location(LID)
);

insert into product_type VALUES ('T01','เครื่องเขียน');
insert into product_type VALUES ('T02','อุปกรณ์สำนักงาน');
insert into product_type VALUES ('T03','เครื่องใช้ไฟฟ้า');
insert into product_type VALUES ('T04','อื่นๆ');


insert into location VALUES ('L01','Building 1');
insert into location VALUES ('L02','SC.06');
insert into location VALUES ('L03','Bio');
insert into location VALUES ('L04','Building5');

INSERT INTO product VALUES ('P01','Table','1000',10,'T02','L01');   
INSERT INTO product VALUES ('P02','ปากกา','10',50,'T01','L01');   
INSERT INTO product VALUES ('P03','เก้าอี้','500',10,'T02','L02');   
INSERT INTO product VALUES ('P04','หลอดทดลอง','1000',80,'T02','L03');   
INSERT INTO product VALUES ('P05','ลำโพง','2000',4,'T03','L01');   
INSERT INTO product VALUES ('P06','พัดลม','1000',12,'T03','L03'); 
INSERT INTO product VALUES ('P07','เตารีด','500',10,'T03','L02');   
INSERT INTO product VALUES ('P08','รองเท้าบูท',8,'250','','');
INSERT INTO product VALUES ('P09','กรรไกรตัดหญ้า',15,'500','','');
INSERT INTO product VALUES ('P10','ตู้เย็น','5000',4,'T03','');
INSERT INTO product VALUES ('P11','เตาไฟฟ้า','700',5,'T03','');
INSERT INTO product VALUES ('P12','บัวรถน้ำ','100',0,'','L04');
INSERT INTO product VALUES ('P13','เลื่อยไฟฟ้า','1000',5,'','L04');



===============================================================
						REAL CODE
===============================================================