===============================================================
						REAL CODE
===============================================================
1
CREATE TABLE Book(
	BookID	   CHAR(3),
	BookName   VARCHAR2(60),
	BookPrice   NUMBER(6,2),
	BookAmount	NUMBER(3),
	CONSTRAINTS Book_pk_BookID PRIMARY KEY(BookID)
);

2
CREATE TABLE Borrow(
	BorrowID	NUMBER(4),
	STDID 	   CHAR(11),
	BookID 		CHAR(3),
	BorrowDate DATE,
	ReturnDate DATE,
	CONSTRAINTS Borrow_pk_BorrowID PRIMARY KEY(BorrowID),
	CONSTRAINTS Borrow_fk_STDID FOREIGN KEY(STDID) REFERENCES Student(STDID),
	CONSTRAINTS Borrow_fk_BookID FOREIGN KEY(BookID) REFERENCES Book(BookID)
);

3
INSERT INTO Book(BookID,BookName,BookPrice,BookAmount) VALUES ('B01','คู่มือเรียนการวิเคราะห์ระบบ',250,10);
INSERT INTO Book(BookID,BookName,BookPrice,BookAmount) VALUES ('B02','คู่มือใช้งาน PowerPoint',200,5);
INSERT INTO Book(BookID,BookName,BookPrice,BookAmount) VALUES ('B03','คู่มือใช้งาน Mac OS X',150,6);
INSERT INTO Book(BookID,BookName,BookPrice,BookAmount) VALUES ('B04','Basic iOS App Development',233,5);
INSERT INTO Book(BookID,BookName,BookPrice,BookAmount) VALUES ('B05','Professional ASP.NET Programming',200,4);
INSERT INTO Book(BookID,BookName,BookPrice,BookAmount) VALUES ('B06','เรียน Database อย่างไรให้ไร้ F',99,5);

4
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (1 ,'633021010-9','B01', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (2 ,'633021010-9','B02', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (3 ,'633021010-9','B03', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (4 ,'633021010-9','B04', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (5 ,'633021010-9','B05', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
======================================================
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (6 ,'633020569-1','B02', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (7 ,'633020569-1','B03', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (8 ,'633020569-1','B04', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (9 ,'633020569-1','B05', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
======================================================
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (10 ,'633020388-5','B03', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (11 ,'633020388-5','B04', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (12 ,'633020388-5','B05', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
======================================================
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (13 ,'633020429-7','B04', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,STDID,BookID,BorrowDate,ReturnDate) 
VALUES (14 ,'633020429-7','B05', 
TO_DATE('22/2/2022', 'DD/MM/YYYY'),
TO_DATE('25/2/2022', 'DD/MM/YYYY'));
======================================================

5
CREATE VIEW LAB6_BookPrice AS 
SELECT bookid,bookname,bookamount,bookprice,
       SUM(bookprice*bookamount) TotalPrice
FROM book
GROUP BY bookid,bookname,bookamount,bookprice;

6
CREATE VIEW LAB6_BorrowDetail AS 
SELECT student.stdid,stdfname,stdlname,bookname,borrowdate,returndate  
FROM student,borrow,book
WHERE student.stdid = borrow.stdid
	AND book.bookid = borrow.bookid
GROUP BY student.stdid,stdfname,stdlname,bookname,borrowdate,returndate
ORDER BY stdid,borrowdate;

7
CREATE VIEW LAB6_StudentBorrow AS 
SELECT student.stdid,stdfname,stdlname,
		COUNT(borrowid) Amount
FROM student,borrow
WHERE student.stdid = borrow.stdid
GROUP BY student.stdid,stdfname,stdlname
ORDER BY stdfname,stdlname;

8
CREATE VIEW LAB6_BOOKBORROW AS 
SELECT book.bookid,bookname,
		COUNT(borrowid) Amount
FROM borrow,book
WHERE book.bookid = borrow.bookid (+)
GROUP BY book.bookid,bookname
ORDER BY bookid;


===============================================================
						REAL CODE
===============================================================
//another condition 
SELECT PID,Pname,Price,Lid  
	from product
WHERE price > (SELECT AVG(price) from product);

//Subquery
SELECT PID,Pname,Price,Lid  from product
WHERE price = (SELECT MAX(price) from product);

SELECT MAX(price) from product;
SELECT PID,Pname,Price,Lid 
	FROM product
WHERE price = 5000
;

//searching 2 condition
SELECT product.lid,lname,
       SUM(price*amount)totalPrice,
	   MAX(price) MaxPrice,
	   MIN(price) MinPrice,
	   AVG(price) AvgPrie,
	   COUNT(Amount) Amt
FROM product,location
WHERE product.lid = location.lid (+)
GROUP BY product.lid,lname
HAVING SUM(price*amount) > 15000
	AND COUNT(amount) BETWEEN 3 AND 4
ORDER BY product.lid;

//just 20000 up++ ใช้ HAVING
SELECT product.lid,lname,
       SUM(price*amount)totalPrice,
	   MAX(price) MaxPrice,
	   MIN(price) MinPrice,
	   AVG(price) AvgPrie,
	   COUNT(Amount) Amt
FROM product,location
WHERE product.lid = location.lid (+)
GROUP BY product.lid,lname
HAVING SUM(price*amount) > 20000
ORDER BY product.lid;


SELECT product.lid,lname,
       SUM(price*amount)totalPrice,
	   MAX(price) MaxPrice,
	   MIN(price) MinPrice,
	   AVG(price) AvgPrie,
	   COUNT(Amount) Amt
FROM product,location
WHERE product.lid = location.lid (+)
GROUP BY product.lid,lname
ORDER BY product.lid;