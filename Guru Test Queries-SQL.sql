CREATE DATABASE Guru_Sample;
USE Guru_Sample;

CREATE TABLE Student
(
	Roll	VARCHAR(6),
	Name	VARCHAR(20),
	Gender	CHAR(1),
	CGPA	FLOAT(4)
);

SELECT * FROM Student;

INSERT INTO Student
VALUES ( 100 , 'Guru Bala Vignesh', 'M'	, 80.12);

DELETE Student;

INSERT INTO Student
VALUES 
( 100 , 'Guru Bala Vignesh', 'M'	, 80.12),
( 101 ,	'Santhoshiya' , 'F' , 83);

CREATE TABLE College_Student
(
	Roll_number	VARCHAR(6),
	Name		VARCHAR(20),
	City		VARCHAR(20),
	Age			CHAR(6),
	CGPA		FLOAT(4),
);

INSERT INTO College_Student
VALUES
(101, 'Ram' , 'Bhuvaneshwar' , 19 , 9.0),
(102, 'Hari' , 'Bhuvaneshwar' , NULL , 6.7),
(103, 'Uday' , 'Jharkhand' , 20 , 8.97),
(104, 'Vikas' , 'Uttar Pradesh' , 19 , 8.5),
(105, 'Sweta' , 'Ranchi' , 19 , 9.2),
(106, 'Yogesh' , 'Rajasthan' , 18 , 7.9),
(210, 'Smriti' , 'Delhi' , 20 , 8.99),
(211, 'Sudam' , 'Cuttack' , 21 , 8.6),
(212, 'Vikas' , 'Kolkata' , 23 , 5.98),
(165, 'Manish' , NULL , 19 , 9.15);


SELECT * FROM College_Student;

SELECT Name , CGPA AS New_CGPA FROM College_Student;

SELECT CONCAT(Name , ' & ', City) FROM College_Student;

SELECT CONCAT(Name , ' From City- ', City) FROM College_Student;



SELECT * FROM College_Student WHERE City= 'Bhuvaneshwar';

SELECT * FROM College_Student WHERE CGPA>8;


SELECT * FROM College_Student WHERE CGPA>8 AND Age>19;

SELECT * FROM College_Student WHERE CGPA>8 AND Age>=19;

SELECT * FROM College_Student WHERE CGPA>8 OR Age>19;

SELECT * FROM College_Student WHERE CGPA>8 AND Age !=19;

SELECT * FROM College_Student WHERE Name LIKE 'S%'; /* Returns with starting letter as 's' and one or more characters */


SELECT * FROM College_Student WHERE Name LIKE '%S'; /* Returns ending letter as 's' with one or more characters at the beginning */




INSERT INTO College_Student
VALUES
(306, 'S' , 'Bhuvaneshwar' , 19 , 9.0);

SELECT * FROM College_Student;

INSERT INTO College_Student
VALUES
(307, 'SA' , 'Bhuvaneshwar' , 20 , 8.0);

SELECT * FROM College_Student WHERE Name LIKE 'S_'; /* Returns with starting letter as 's' and followed by only one character */

SELECT * FROM College_Student WHERE Name LIKE '%_S_'; /* Returns one or more characters with last before character as letter 's' */

SELECT * FROM College_Student WHERE City IN ('Rajasthan', 'Bhuvaneshwar');

SELECT * FROM College_Student WHERE AGE BETWEEN 19 AND 21 ; /* returns age from 19 to 21 */


SELECT * FROM College_Student WHERE AGE BETWEEN 19 OR 21 ; /* returns error since in between only and operator works*/

SELECT * FROM College_Student WHERE AGE is NULL ;



SELECT * FROM College_Student ORDER BY Age ;

SELECT * FROM College_Student ORDER BY Age ,CGPA DESC;

SELECT * FROM College_Student ORDER BY Age DESC ,CGPA DESC; /* returns 1st age in desc and CGPA DESC */



ALTER TABLE College_Student ADD Remarks TEXT; /* returns adding a column with name as Remarks and with datatype */

SELECT * FROM College_Student;

ALTER TABLE College_Student ALTER Column Remarks varchar(20); 

ALTER TABLE College_Student DROP Column Remarks;

EXEC sp_rename 'College_Student.Roll_number' , 'Roll_No' ;

EXEC sp_rename 'College_Student' , 'CollegeStudent_Detail' ;

EXEC sp_rename 'CollegeStudent_Detail' , 'College_Student';

UPDATE College_Student SET Age=24 WHERE AGE IS NULL;

DROP TABLE dbo.Student;  /* Delete the entire table including schema */

TRUNCATE TABLE dbo.Student; /* Delete entire values of the table without disturbing schema and table wont be deleted */

DELETE FROM dbo.Student WHERE Roll=100;

DELETE FROM dbo.Student;


/* CONSTRAINTS*/

CREATE TABLE ITEM_MASTER
(
	Item_no			INT,
	Name			VARCHAR(20),
	Qty_on_hand		INT,
	Category		CHAR(1),
	Unit_measure	CHAR(4),
	Reorder_Lvl		INT,
	Reorder_qty		INT,
	Rate			INT,
)

DROP TABLE ITEM_MASTER;

USE Guru_Sample;

SELECT * FROM ITEM_MASTER;

DROP TABLE ITEM_MASTER;

CREATE TABLE ITEM_MASTER
(
	Item_no			INT NOT NULL,
	Name			VARCHAR(20),
	Qty_on_hand		INT,
	Category		CHAR(1),
	Unit_measure	CHAR(4),
	Reorder_Lvl		INT NOT NULL,
	Reorder_qty		INT NOT NULL,
	Rate			INT NOT NULL,
)

CREATE TABLE ITEM_MASTER
(
	Item_no			INT NOT NULL,
	Name			VARCHAR(20) CONSTRAINT c2 UNIQUE,
	Qty_on_hand		INT NOT NULL,
	Category		CHAR(1),
	Unit_measure	CHAR(4),
	Reorder_Lvl		INT NOT NULL,
	Reorder_qty		INT NOT NULL,
	Rate			INT NOT NULL,
);

ALTER TABLE ITEM_MASTER 
ALTER COLUMN Qty_on_hand INT;    /* NOT NULL Constraint can't be dropped rather can be alter the column type from NOT NULL to NULL */

INSERT INTO ITEM_MASTER
VALUES
(100, 'AMUL' , 23, 'M' , 'KG' , 33, 21, 250 );

INSERT INTO ITEM_MASTER
VALUES
(101, 'CHOCOLATE', 13, 'F', 'qty', 60, 10, 50);

INSERT INTO ITEM_MASTER
VALUES
(103, 'CHOCOLATE', 15, 'F', 'qty', 60, 10, 50); /* Returns error since violation of Unique key constraint */

SELECT * FROM ITEM_MASTER;

ALTER TABLE ITEM_MASTER 
DROP CONSTRAINT c2 ;

CREATE TABLE ITEM_MASTER
(
	Item_no			INT NOT NULL,
	Item_Name		VARCHAR(20) ,
	Qty_on_hand		INT NOT NULL,
	Category		CHAR(1),
	Unit_measure	CHAR(4),
	Reorder_Lvl		INT NOT NULL,
	Reorder_qty		INT NOT NULL,
	Rate			INT NOT NULL,

);

ALTER TABLE ITEM_MASTER 
ADD CONSTRAINT ce2 UNIQUE(Item_Name,Item_no);

ALTER TABLE ITEM_MASTER
DROP CONSTRAINT ce2;

DROP TABLE ITEM_MASTER;

/* Primary Key--> only 1 primary key per table, combination of NOT NULL & UNIQUE Constraint */

CREATE TABLE ITEM_MASTER
(
	Item_no			INT ,
	Item_Name		VARCHAR(20) UNIQUE,
	Qty_on_hand		INT,
	Category		CHAR(1),
	Unit_measure	CHAR(4),
	Reorder_Lvl		INT NOT NULL,
	Reorder_qty		INT NOT NULL,
	Rate			INT NOT NULL,
	CONSTRAINT C4 PRIMARY KEY (Item_no)
	);


SELECT * FROM ITEM_MASTER;



ALTER TABLE ITEM_MASTER DROP CONSTRAINT C4;

CREATE TABLE ITEM_MASTER
(
	Item_no			INT ,
	Item_Name		VARCHAR(20) UNIQUE,
	Qty_on_hand		INT,
	Category		CHAR(1),
	Unit_measure	CHAR(4),
	Reorder_Lvl		INT NOT NULL,
	Reorder_qty		INT NOT NULL,
	Rate			INT NOT NULL,
	CONSTRAINT C4 PRIMARY KEY (Item_no)
	);


/* Foreign Key--> Establishes a relationship between primary key in same table or the other. 
					Should contain same DataType, size and domain.*/

CREATE TABLE ITEM_TRANS
(
	It_no		INT,
	trans_date	DATE,
	qty			INT,
);

SELECT * FROM ITEM_TRANS;

ALTER TABLE ITEM_TRANS ADD CONSTRAINT C5 FOREIGN KEY(It_no)
REFERENCES ITEM_MASTER(Item_no);

ALTER TABLE ITEM_TRANS DROP CONSTRAINT C5;

/* CHECK CONSTRAINTS --> Used to check the values of particular column only if it satisfied will insert the value in the table (as like constraint)*/

DROP TABLE ITEM_MASTER;  /* before dropping a table link between primary and foreign key constraint to be dropped */

CREATE TABLE ITEM_MASTER
(
	Item_no			INT PRIMARY KEY,
	Item_Name		VARCHAR(20) UNIQUE,
	Qty_on_hand		INT,
	Category		CHAR(1) NOT NULL,
	Unit_measure	CHAR(4),
	Reorder_Lvl		INT NOT NULL,
	Reorder_qty		INT NOT NULL,
	Rate			INT NOT NULL,
	CHECK((Category='A' AND Rate<=1000) OR (Category='B' AND Rate<=4500) OR (Category='C' AND Rate>=4500))
	
);

SELECT * FROM ITEM_MASTER;

ALTER TABLE ITEM_MASTER 
ADD CONSTRAINT df_Qty DEFAULT 100 FOR Qty_on_hand;         /* Error in CHECK Constraint */

SELECT TABLE_NAME , CONSTRAINT_TYPE, CONSTRAINT_NAME FROM information_Schema.table_constraints WHERE table_name= 'ITEM_MASTER';

CREATE TABLE EMP
(
	EMP_NO		INT,
	ENAME		VARCHAR(20),
	JOB			VARCHAR(20),
	MGR			INT,
	HIREDATE	DATE,
	SAL			INT,
	COMM		INT,
	DEPT_NO		INT,
	
);

INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902 , '17-DEC-80', 800 , NULL ,20);
INSERT INTO EMP VALUES (7499, 'ALLEN', 'Salesman',7698, '20-FEB-81',1600,300,30);
INSERT INTO EMP VALUES (7521, 'WARD', 'Salesman',7698, '22-FEB-81',1250,500,30);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER',7839, '02-APR-81',2975,null,20);
INSERT INTO EMP VALUES (7654, 'MARTIN', 'Salesman',7698, '28-SEP-81',1250,1400,20);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'Manager',7839, '01-MAY-81',2850,null,30);
INSERT INTO EMP VALUES (7782, 'CLARK', 'Manager',7839, '09-JUN-81',2450,null,10);
INSERT INTO EMP VALUES (7788, 'SCOTT', 'Analyst',7566, '09-NOV-81',3000,null,20);
INSERT INTO EMP VALUES (7839, 'KING', 'President', NULL , '17-NOV-81', 5000, null,10);
INSERT INTO EMP VALUES (7844, 'TURNER', 'Salesman',7698, '08-SEP-81',1500, 0 ,30);
INSERT INTO EMP VALUES (7876, 'ADAMS' , 'Clerk',7788, '23-SEP-81',1100, null,20);
INSERT INTO EMP VALUES (7900, 'JAMES', 'Clerk',7698, '03-DEC-81',950, null,30);
INSERT INTO EMP VALUES (7902, 'FORD', 'Analyst',7566, '03-DEC-81', 3000,  null,20);
INSERT INTO EMP VALUES (7934, 'MILLER', 'Clerk',7782, '23-JAN-82',1300,null,10);

SELECT * FROM EMP;

/* FUNCTIONS- 
	# Built-in functions
		--> Single row/ Scalar function
		--> Group function
	# Group functions 
	*/

SELECT SUM(SAL) FROM EMP;

SELECT AVG(SAL) FROM EMP;

SELECT MAX(SAL) AS MAX_SALARY, MIN(SAL) AS MIN_SALARY FROM EMP;

SELECT COUNT(*) FROM EMP; /* returns the count of total rows in a table */

SELECT COUNT(MGR) FROM EMP;

SELECT COUNT(DISTINCT MGR) FROM EMP;

SELECT DISTINCT MGR FROM EMP ORDER BY MGR DESC;

SELECT ABS(-100), ABS(5);

SELECT FLOOR (5.2)  , FLOOR (-5.2) , CEILING(5.2) , CEILING (-5.2); /* Floor - Moves towards left  while ceiling moves towards right */

SELECT EXP(5) , EXP(-5);

SELECT LOG (4,10) ;

SELECT POWER (5,3); /* 5 to the power 3 */

SELECT SQRT(25);

SELECT ROUND (15.98645, 2) , ROUND (15.986, 2);

SELECT SIN(60), SIN(1.047167) , COS(90) , COS(2.047167) , TAN(90) , TAN(2.047167) ;

SELECT CONCAT ('JOHN' ,' ',  'SMITH');

SELECT LOWER ('HELLO');

SELECT LTRIM(ENAME,'S') FROM EMP; /* it will cut the letter s in left 1st letter and print remaining item from Right */

SELECT * FROM EMP;

SELECT RTRIM(ENAME, 'H') FROM EMP;

SELECT REPLACE ('ORACLE' , 'RAC' , 'V');

CREATE TABLE  AGENTS
   (	
    AGENT_CODE			CHAR(6) NOT NULL PRIMARY KEY, 
	AGENT_NAME			CHAR(40), 
	WORKING_AREA		CHAR(35), 
	COMMISSION			NUMERIC(10,2), 
	PHONE_NO			CHAR(15), 
	COUNTRY				VARCHAR(25), 
	 );
 
INSERT INTO AGENTS VALUES ('A007', 'Ramasundar', 'Bangalore', '0.15', '077-25814763', '');
INSERT INTO AGENTS VALUES ('A003', 'Alex ', 'London', '0.13', '075-12458969', '');
INSERT INTO AGENTS VALUES ('A008', 'Alford', 'New York', '0.12', '044-25874365', '');
INSERT INTO AGENTS VALUES ('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874', '');
INSERT INTO AGENTS VALUES ('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644', '');
INSERT INTO AGENTS VALUES ('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', '');
INSERT INTO AGENTS VALUES ('A005', 'Anderson', 'Brisban', '0.13', '045-21447739', '');
INSERT INTO AGENTS VALUES ('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674', '');
INSERT INTO AGENTS VALUES ('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964', '');
INSERT INTO AGENTS VALUES ('A006', 'McDen', 'London', '0.15', '078-22255588', '');
INSERT INTO AGENTS VALUES ('A004', 'Ivan', 'Torento', '0.15', '008-22544166', '');
INSERT INTO AGENTS VALUES ('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178', '');

SELECT * FROM AGENTS;

CREATE TABLE  CUSTOMER 
   (	
		CUST_CODE		VARCHAR(6) NOT NULL PRIMARY KEY, 
		CUST_NAME		VARCHAR(40) NOT NULL, 
		CUST_CITY		CHAR(35), 
		WORKING_AREA	VARCHAR(35) NOT NULL, 
		CUST_COUNTRY	VARCHAR(20) NOT NULL, 
		GRADE			NUMERIC, 
		OPENING_AMT		NUMERIC(12,2) NOT NULL, 
		RECEIVE_AMT		NUMERIC(12,2) NOT NULL, 
		PAYMENT_AMT		NUMERIC(12,2) NOT NULL, 
		OUTSTANDING_AMT NUMERIC(12,2) NOT NULL, 
		PHONE_NO		VARCHAR(17) NOT NULL, 
		AGENT_CODE		CHAR(6) NOT NULL REFERENCES AGENTS
);   

INSERT INTO CUSTOMER VALUES ('C00013', 'Holmes', 'London', 'London', 'UK', '2', '6000.00', '5000.00', '7000.00', '4000.00', 'BBBBBBB', 'A003');
INSERT INTO CUSTOMER VALUES ('C00001', 'Micheal', 'New York', 'New York', 'USA', '2', '3000.00', '5000.00', '2000.00', '6000.00', 'CCCCCCC', 'A008');
INSERT INTO CUSTOMER VALUES ('C00020', 'Albert', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '6000.00', '6000.00', 'BBBBSBB', 'A008');
INSERT INTO CUSTOMER VALUES ('C00025', 'Ravindran', 'Bangalore', 'Bangalore', 'India', '2', '5000.00', '7000.00', '4000.00', '8000.00', 'AVAVAVA', 'A011');
INSERT INTO CUSTOMER VALUES ('C00024', 'Cook', 'London', 'London', 'UK', '2', '4000.00', '9000.00', '7000.00', '6000.00', 'FSDDSDF', 'A006');
INSERT INTO CUSTOMER VALUES ('C00015', 'Stuart', 'London', 'London', 'UK', '1', '6000.00', '8000.00', '3000.00', '11000.00', 'GFSGERS', 'A003');
INSERT INTO CUSTOMER VALUES ('C00002', 'Bolt', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '9000.00', '3000.00', 'DDNRDRH', 'A008');
INSERT INTO CUSTOMER VALUES ('C00018', 'Fleming', 'Brisban', 'Brisban', 'Australia', '2', '7000.00', '7000.00', '9000.00', '5000.00', 'NHBGVFC', 'A005');
INSERT INTO CUSTOMER VALUES ('C00021', 'Jacks', 'Brisban', 'Brisban', 'Australia', '1', '7000.00', '7000.00', '7000.00', '7000.00', 'WERTGDF', 'A005');
INSERT INTO CUSTOMER VALUES ('C00019', 'Yearannaidu', 'Chennai', 'Chennai', 'India', '1', '8000.00', '7000.00', '7000.00', '8000.00', 'ZZZZBFV', 'A010');
INSERT INTO CUSTOMER VALUES ('C00005', 'Sasikant', 'Mumbai', 'Mumbai', 'India', '1', '7000.00', '11000.00', '7000.00', '11000.00', '147-25896312', 'A002');
INSERT INTO CUSTOMER VALUES ('C00007', 'Ramanathan', 'Chennai', 'Chennai', 'India', '1', '7000.00', '11000.00', '9000.00', '9000.00', 'GHRDWSD', 'A010');
INSERT INTO CUSTOMER VALUES ('C00022', 'Avinash', 'Mumbai', 'Mumbai', 'India', '2', '7000.00', '11000.00', '9000.00', '9000.00', '113-12345678','A002');
INSERT INTO CUSTOMER VALUES ('C00004', 'Winston', 'Brisban', 'Brisban', 'Australia', '1', '5000.00', '8000.00', '7000.00', '6000.00', 'AAAAAAA', 'A005');
INSERT INTO CUSTOMER VALUES ('C00023', 'Karl', 'London', 'London', 'UK', '0', '4000.00', '6000.00', '7000.00', '3000.00', 'AAAABAA', 'A006');
INSERT INTO CUSTOMER VALUES ('C00006', 'Shilton', 'Torento', 'Torento', 'Canada', '1', '10000.00', '7000.00', '6000.00', '11000.00', 'DDDDDDD', 'A004');
INSERT INTO CUSTOMER VALUES ('C00010', 'Charles', 'Hampshair', 'Hampshair', 'UK', '3', '6000.00', '4000.00', '5000.00', '5000.00', 'MMMMMMM', 'A009');
INSERT INTO CUSTOMER VALUES ('C00017', 'Srinivas', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '4000.00', '3000.00', '9000.00', 'AAAAAAB', 'A007');
INSERT INTO CUSTOMER VALUES ('C00012', 'Steven', 'San Jose', 'San Jose', 'USA', '1', '5000.00', '7000.00', '9000.00', '3000.00', 'KRFYGJK', 'A012');
INSERT INTO CUSTOMER VALUES ('C00008', 'Karolina', 'Torento', 'Torento', 'Canada', '1', '7000.00', '7000.00', '9000.00', '5000.00', 'HJKORED', 'A004');
INSERT INTO CUSTOMER VALUES ('C00003', 'Martin', 'Torento', 'Torento', 'Canada', '2', '8000.00', '7000.00', '7000.00', '8000.00', 'MJYURFD', 'A004');
INSERT INTO CUSTOMER VALUES ('C00009', 'Ramesh', 'Mumbai', 'Mumbai', 'India', '3', '8000.00', '7000.00', '3000.00', '12000.00', 'Phone No', 'A002');
INSERT INTO CUSTOMER VALUES ('C00014', 'Rangarappa', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'AAAATGF', 'A001');
INSERT INTO CUSTOMER VALUES ('C00016', 'Venkatpati', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'JRTVFDD', 'A007');
INSERT INTO CUSTOMER VALUES ('C00011', 'Sundariya', 'Chennai', 'Chennai', 'India', '3', '7000.00', '11000.00', '7000.00', '11000.00', 'PPHGRTS', 'A010');


CREATE TABLE  ORDERS 
   (
     ORD_NUM			NUMERIC(6,0) NOT NULL PRIMARY KEY, 
	 ORD_AMOUNT			NUMERIC(12,2) NOT NULL, 
	 ADVANCE_AMOUNT		NUMERIC(12,2) NOT NULL, 
	 ORD_DATE			DATE NOT NULL, 
	 CUST_CODE			VARCHAR(6) NOT NULL REFERENCES CUSTOMER, 
	 AGENT_CODE			CHAR(6) NOT NULL REFERENCES AGENTS, 
	 ORD_DESCRIPTION	VARCHAR(60) NOT NULL
   );

INSERT INTO ORDERS VALUES('200100', '1000.00', '600.00', '08/01/2008', 'C00013', 'A003', 'SOD');
INSERT INTO ORDERS VALUES('200110', '3000.00', '500.00', '04/15/2008', 'C00019', 'A010', 'SOD');
INSERT INTO ORDERS VALUES('200107', '4500.00', '900.00', '08/30/2008', 'C00007', 'A010', 'SOD');
INSERT INTO ORDERS VALUES('200112', '2000.00', '400.00', '05/30/2008', 'C00016', 'A007', 'SOD'); 
INSERT INTO ORDERS VALUES('200113', '4000.00', '600.00', '06/10/2008', 'C00022', 'A002', 'SOD');
INSERT INTO ORDERS VALUES('200102', '2000.00', '300.00', '05/25/2008', 'C00012', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200114', '3500.00', '2000.00', '08/15/2008', 'C00002', 'A008', 'SOD');
INSERT INTO ORDERS VALUES('200122', '2500.00', '400.00', '09/16/2008', 'C00003', 'A004', 'SOD');
INSERT INTO ORDERS VALUES('200118', '500.00', '100.00', '07/20/2008', 'C00023', 'A006', 'SOD');
INSERT INTO ORDERS VALUES('200119', '4000.00', '700.00', '09/16/2008', 'C00007', 'A010', 'SOD');
INSERT INTO ORDERS VALUES('200121', '1500.00', '600.00', '09/23/2008', 'C00008', 'A004', 'SOD');
INSERT INTO ORDERS VALUES('200130', '2500.00', '400.00', '07/30/2008', 'C00025', 'A011', 'SOD');
INSERT INTO ORDERS VALUES('200134', '4200.00', '1800.00', '09/25/2008', 'C00004', 'A005', 'SOD');
INSERT INTO ORDERS VALUES('200108', '4000.00', '600.00', '02/15/2008', 'C00008', 'A004', 'SOD');
INSERT INTO ORDERS VALUES('200103', '1500.00', '700.00', '05/15/2008', 'C00021', 'A005', 'SOD');
INSERT INTO ORDERS VALUES('200105', '2500.00', '500.00', '07/18/2008', 'C00025', 'A011', 'SOD');
INSERT INTO ORDERS VALUES('200109', '3500.00', '800.00', '07/30/2008', 'C00011', 'A010', 'SOD');
INSERT INTO ORDERS VALUES('200101', '3000.00', '1000.00', '07/15/2008', 'C00001', 'A008', 'SOD');
INSERT INTO ORDERS VALUES('200111', '1000.00', '300.00', '07/10/2008', 'C00020', 'A008', 'SOD');
INSERT INTO ORDERS VALUES('200104', '1500.00', '500.00', '03/13/2008', 'C00006', 'A004', 'SOD');
INSERT INTO ORDERS VALUES('200106', '2500.00', '700.00', '04/20/2008', 'C00005', 'A002', 'SOD');
INSERT INTO ORDERS VALUES('200125', '2000.00', '600.00', '10/10/2008', 'C00018', 'A005', 'SOD');
INSERT INTO ORDERS VALUES('200117', '800.00', '200.00', '10/20/2008', 'C00014', 'A001', 'SOD');
INSERT INTO ORDERS VALUES('200123', '500.00', '100.00', '09/16/2008', 'C00022', 'A002', 'SOD');
INSERT INTO ORDERS VALUES('200120', '500.00', '100.00', '07/20/2008', 'C00009', 'A002', 'SOD');
INSERT INTO ORDERS VALUES('200116', '500.00', '100.00', '07/13/2008', 'C00010', 'A009', 'SOD');
INSERT INTO ORDERS VALUES('200124', '500.00', '100.00', '06/20/2008', 'C00017', 'A007', 'SOD'); 
INSERT INTO ORDERS VALUES('200126', '500.00', '100.00', '06/24/2008', 'C00022', 'A002', 'SOD');
INSERT INTO ORDERS VALUES('200129', '2500.00', '500.00', '07/20/2008', 'C00024', 'A006', 'SOD');
INSERT INTO ORDERS VALUES('200127', '2500.00', '400.00', '07/20/2008', 'C00015', 'A003', 'SOD');
INSERT INTO ORDERS VALUES('200128', '3500.00', '1500.00', '07/20/2008', 'C00009', 'A002', 'SOD');
INSERT INTO ORDERS VALUES('200135', '2000.00', '800.00', '09/16/2008', 'C00007', 'A010', 'SOD');
INSERT INTO ORDERS VALUES('200131', '900.00', '150.00', '08/26/2008', 'C00012', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200133', '1200.00', '400.00', '06/29/2008', 'C00009', 'A002', 'SOD');

SELECT * FROM EMP;

SELECT DEPT_NO , AVG(SAL) AS Average_Salary FROM EMP GROUP BY DEPT_NO;

SELECT DEPT_NO , AVG(SAL) AS Average_Salary FROM EMP GROUP BY DEPT_NO HAVING AVG(SAL)> 2000;

SELECT DEPT_NO , AVG(SAL) AS Average_Salary FROM EMP WHERE SAL>1000 GROUP BY DEPT_NO HAVING AVG(SAL)>2000;

CREATE TABLE Department
	(
		DeptId		INT,
		DeptName	VARCHAR(20),
		FacultyId	INT,
		CONSTRAINT department_deptid_pk1 PRIMARY KEY (DeptId),
	);

INSERT INTO Department VALUES (10, 'Computer Science', 111);
INSERT INTO Department VALUES (20, 'Telecommunications', 222);
INSERT INTO Department VALUES (30, 'Accounting', 333);
INSERT INTO Department VALUES (40, 'Math and Science', 444);
INSERT INTO Department VALUES (50, 'Liberal Arts', 555);

SELECT * FROM Department;

CREATE TABLE Salgrades
(
	EMP_ID INT,
	BONUS INT,
	GRADE VARCHAR(20),
);

INSERT INTO Salgrades VALUES (7369, 500, 'A');
INSERT INTO Salgrades VALUES (7499, 600, 'A');
INSERT INTO Salgrades VALUES (7521, 400,'B');
INSERT INTO Salgrades VALUES (7566, 350, 'B');
INSERT INTO Salgrades VALUES (7654, 200, 'C');
INSERT INTO Salgrades VALUES (7698, 450,'A');
INSERT INTO Salgrades VALUES (7782, 550,'A');
INSERT INTO Salgrades VALUES (7788, 550,'E');
INSERT INTO Salgrades VALUES (7839, 600, 'E');
INSERT INTO Salgrades VALUES (7844, 200,'C');
INSERT INTO Salgrades VALUES (7876, 100, 'D');
INSERT INTO Salgrades VALUES (7900, 150, 'D');
INSERT INTO Salgrades VALUES (7902, NULL, 'F');
INSERT INTO Salgrades VALUES (7934, 600, 'E');

SELECT * FROM Salgrades;

SELECT * FROM EMP;

CREATE TABLE Employee
(
	EMPLOYEE_ID		INT,
	LNAME			VARCHAR(20),
	FNAME			VARCHAR(20),
	POSITION_ID		INT,
	SUPERVISOR		INT,
	SALARY			INT,
	COMMISSION		INT,
	DEPT_ID			INT,
	QUAL_ID			INT,

);

INSERT INTO Employee VALUES ( 111 , 'Smith' , 'John' , 1 , NULL , 265000 , 35000 , 10 , 1 );
INSERT INTO Employee VALUES ( 123 , 'Roberta' , 'Sandi' , 2 , 111 , 75000 , NULL , 10 , 1 );
INSERT INTO Employee VALUES ( 135 , 'Gamer' , 'Stanley' , 2 , 111 , 45000 , 5000 , 30 , 5 );
INSERT INTO Employee VALUES ( 200 , 'Shaw' , 'Jinku' , 5 , 135 , 24500 , 3000 , 30 , NULL );
INSERT INTO Employee VALUES ( 222 , 'Chen' , 'Sunny' , 4 , 123 , 35000 , NULL , 10 , 3 );
INSERT INTO Employee VALUES ( 246 , 'Houston' , 'Larry' , 2 , 111 , 150000 , 10000 , 40 , 2 );
INSERT INTO Employee VALUES ( 433 , 'McCall' , 'Alex' , 3 , 543 , 65500 , NULL , 20 , 4 );
INSERT INTO Employee VALUES ( 543 , 'Dev' , 'John' , 2 , 111 , 80000 , 20000 , 20 , 1 );


/* JOINS */

/* Theta Join  Inner Join */

SELECT e.EMP_NO , e.ENAME , e.SAL , s.BONUS FROM EMP e , Salgrades s WHERE e.comm > s.BONUS;

/* EQUI JOINS */

SELECT * FROM EMP;

SELECT * FROM Department;

SELECT * FROM Employee;

SELECT e.EMPLOYEE_ID, e.LNAME, e.DEPT_ID , d.DeptName FROM Employee e , Department d
WHERE e.DEPT_ID = d.DeptId;

/* Inner Join */

CREATE TABLE Customer_details 
(  
    ID				INT ,  
    Customer_name	VARCHAR(55),  
    Account			INT,  
    Email			VARCHAR(55)  
);    

INSERT INTO Customer_details VALUES
	(1,'Stephen', 1030, 'stephen@javatpoint.com'),  
    (2,'Jenifer', 2035, 'jenifer@javatpoint.com'),  
    (3,'Mathew', 5564, 'mathew@javatpoint.com'),  
    (4,'Smith', 4534, 'smith@javatpoint.com'),  
    (5,'David', 7648, 'david@javatpoint.com'); 

CREATE TABLE Balance
(  
    ID			INT ,   
    Account		INT,  
    Balance		FLOAT, 
);    


INSERT INTO Balance (ID,Account,Balance)  
VALUES
	(1,1030, 50000.00),   
	(2,2035, 230000.00),   
    (3,5564, 125000.00),   
    (4,4534, 80000.00),   
    (5,7648, 45000.00); 

SELECT * FROM Customer_details ;

SELECT * FROM Balance;

SELECT C. Customer_name , B. Balance FROM Customer_details AS C INNER JOIN Balance AS B ON C.ID = B.ID;

SELECT e.EMPLOYEE_ID, e.LNAME, e.DEPT_ID , d.DeptName FROM Employee e INNER JOIN Department d
ON e.DEPT_ID = d.DeptId; 

SELECT e.EMPLOYEE_ID, e.LNAME, e.DEPT_ID , d.DeptName FROM Employee e , Department d
WHERE e.DEPT_ID = d.DeptId;   /* in this case Table both Equi Join and Inner join are same. */

SELECT * FROM Department;

SELECT * FROM Employee;

/* OUTER JOINS */

SELECT * FROM Employee e LEFT OUTER JOIN Department d ON e.DEPT_ID = d.DeptId;

SELECT * FROM Employee e RIGHT OUTER JOIN Department d ON e.DEPT_ID = d.DeptId; /* In this case both Left and right will be same but order will be in Table B */

SELECT * FROM Employee e FULL OUTER JOIN Department d ON e.DEPT_ID = d.DeptId; /* In this case all rows will be displayed inspite of not matching values . Order will be Table A additional row will be not matching values and default it will be NULL values*/

/* SELF JOINS */

CREATE TABLE Employees
(
	ID			INT,
	Full_Name	VARCHAR(50),
	Salary		INT,
	Manager_ID	INT,
);

INSERT INTO Employees VALUES
(1, 'John Smith' , 10000 , 3 ),
(2, 'Jane Anderson' , 12000 ,3),
(3, 'Tom Lanon' , 15000, 4),
(4, 'Anne Connor' , 20000 ,NULL),
(5, 'Jeremy York' , 9000 , 1);

SELECT * FROM Employees;

SELECT	Employee.ID , 
		Employee.Full_Name , 
		Employee.Manager_ID ,
		Manager.Full_Name AS ManagerName 
FROM	Employees Employee
JOIN	Employees Manager
ON		Employee.Manager_ID = Manager.ID; /* Last prefix of new table name -Manager to be added as identifier to get avoid the error */


/* UNION - Joins the unique value from two tables which has same data type 
	UNION ALL - Joins all the values from two tables with same data type */

SELECT * FROM Customer_details;

SELECT * FROM CUSTOMER;

SELECT * FROM AGENTS;

CREATE TABLE Customers
(
	Customer_ID		INT,
	Customer_Name	VARCHAR(50),
	Contact_Name	VARCHAR(50),
	Address			TEXT,
	City			VARCHAR(50),
	PostalCode		INT,
	Country			VARCHAR(20),
);

INSERT INTO Customers 
VALUES
	( 1 , 'Alfreds Futterkiste' , 'Maria Anders' , 'Obere Str. 57' , 'Berlin' , 12209 , 'Germany' );
INSERT INTO Customers 
VALUES 
	( 2 ,'Ana Trujillo Emparedados y helados' , 'Ana Trujillo' , ' Avda.de la Constitución 2222' , 'México D.F.' , 05021 , 'Mexico' );
INSERT INTO Customers 
VALUES
	( 3 , 'Antonio Moreno Taquería' , 'Antonio Moreno' , 'Mataderos 2312' , 'México D.F.' , 05023 , 'Mexico' );

DROP TABLE Customers;

SELECT * FROM Customers;		

CREATE TABLE Suppliers
(
	Supplier_ID		INT,
	Supplier_Name	VARCHAR(50),
	Contact_Name	VARCHAR(50),
	Address			TEXT,
	City			VARCHAR(50),
	PostalCode		VARCHAR(20),
	Country			VARCHAR(20),
);

DROP TABLE Suppliers;

INSERT INTO Suppliers 
VALUES
	( 1 , 'Exotic Liquid' , 'Charlotte Cooper' , '49 Gilbert St.' , 'London' , 'EC1 4SD' , 'UK' );
INSERT INTO Suppliers
VALUES 
	( 2 ,'New Orleans Cajun Delights' , 'Shelley Burke' , ' P.O. Box 78934' , 'New Orleans' , 70117 , 'USA' );
INSERT INTO Suppliers 
VALUES
	( 3 , 'Grandma Kellys Homestead' , 'Regina Murphy' , '707 Oxford Rd.' , 'Ann Arbor' , 48104 , 'USA' );


SELECT * FROM Suppliers;

SELECT * FROM Customers;

SELECT City FROM Customers 
	UNION
SELECT City FROM Suppliers 
	ORDER BY City;

SELECT ENAME, JOB FROM EMP 
WHERE DEPT_NO=20 
UNION 
SELECT ENAME, JOB FROM EMP WHERE DEPT_NO=30;

SELECT * FROM EMP;
	
/* UNION ALL */ --> will show duplicates also

SELECT City FROM Customers 
	UNION ALL
SELECT City FROM Suppliers 
	ORDER BY City;

	/* INTERSECT*/ --> shows only common datas

INSERT INTO Suppliers 
VALUES
	( 3 , 'Antonio Moreno Taquería' , 'Antonio Moreno' , 'Mataderos 2312' , 'México D.F.' , 05023 , 'Mexico' );


SELECT City FROM Customers 
	INTERSECT
SELECT City FROM Suppliers 
	ORDER BY City;

SELECT JOB FROM EMP 
WHERE DEPT_NO=10 
INTERSECT 
SELECT JOB FROM EMP WHERE DEPT_NO=30;

SELECT * FROM EMP;

/* SUB-QUERY */ --> Single row sub-query

SELECT * FROM Department;

SELECT * FROM College_Student;

ALTER TABLE College_Student ADD Dept_ID INT;

UPDATE College_Student SET Dept_ID = 10 WHERE City = 'Bhuvaneshwar';
UPDATE College_Student SET Dept_ID = 20 WHERE City = 'Jharkhand';
UPDATE College_Student SET Dept_ID = 30 WHERE City = 'Uttar Pradesh';
UPDATE College_Student SET Dept_ID = 40 WHERE City = 'Ranchi';
UPDATE College_Student SET Dept_ID = 50 WHERE City = 'Rajasthan';
UPDATE College_Student SET Dept_ID = 10 WHERE City = 'Delhi';
UPDATE College_Student SET Dept_ID = 20 WHERE City = 'Cuttack';

/*--> Q. Let, Student (roll,name,age, deptno) and Department (deptno,dname, campus) be two schemas.
If the user wants to find the roll and name of students belongs to ’CSE’ department, the query is: */

SELECT DeptId FROM Department WHERE DeptName='Computer Science' ;

SELECT Roll_No , Name, Age, Dept_ID FROM College_Student WHERE Dept_ID= (SELECT DeptId FROM Department WHERE DeptName='Computer Science' );

SELECT * FROM Department;

SELECT * FROM College_Student;



/*SELECT Col.Roll_No , Col.Name, Col.Age, Col.Dept_ID , De.DeptName FROM College_Student Col , Department De WHERE Dept_ID= (SELECT DeptId FROM Department WHERE DeptName='Computer Science' );

--> Need to get clarity to add Dept_Name */

SELECT Roll_No , Name, Age, Dept_ID FROM College_Student WHERE Dept_ID= (SELECT DeptId FROM Department WHERE DeptName='Computer Science' );


SELECT C.Roll_No , C.Name, C.Age, C.Dept_ID, D.DeptName FROM College_Student C INNER JOIN Department D ON D.DeptName='Computer Science' AND C.Dept_ID= 10;



/* MULTIPLE-ROW SUBQUERY */

SELECT * FROM Student;

ALTER TABLE Student ADD AGE INT;

UPDATE Student SET Age= 33 WHERE Name='Guru Bala Vignesh';

UPDATE Student SET Age= 29 WHERE Name='Santhoshiya';

INSERT INTO Student
VALUES 
( 102 , 'Sai Vishwath', 'M'	, 80.12, 5),
( 103 ,	'Vedha Krishnaa' , 'M' , 83, 1),
( 104 , 'Rudhran', 'M' , 85 , 19);

SELECT Roll_No, Name, Age FROM College_Student WHERE Age<ANY(SELECT Age FROM Student); 

SELECT Roll_No, Name, Age FROM College_Student WHERE Age<ALL(SELECT Age FROM Student); 

/* Co-related Sub-query */

-->Q:Display the id, name and age of all the students who are older than the average age of their department.


SELECT AVG(Age) FROM College_Student ;

--> Msg 8117, Level 16, State 1, Line 835
		-->Operand data type char is invalid for avg operator.

ALTER TABLE College_Student ALTER COLUMN Age INT;

SELECT AVG(Age) FROM College_Student ;


SELECT Roll_No, Name , Age ,Dept_ID FROM College_Student S1 WHERE Age>(SELECT AVG(Age) FROM College_Student S2 WHERE S1.Dept_ID = S2.Dept_ID);

/* NESTED SUBQUERY */
--> Show details of all employee who work under the of manager - BLAKE 


SELECT * FROM EMP;

SELECT EMP_NO FROM EMP WHERE ENAME= 'BLAKE';

SELECT EMP_NO FROM EMP WHERE MGR=(SELECT EMP_NO FROM EMP WHERE ENAME= 'BLAKE');

SELECT EMP_NO, ENAME, SAL, HIREDATE FROM EMP WHERE EMP_NO IN (SELECT EMP_NO FROM EMP WHERE MGR=(SELECT EMP_NO FROM EMP WHERE ENAME= 'BLAKE'));


/* Using Joins*/

SELECT EMP2.EMP_NO , EMP2.ENAME, EMP2.SAL, EMP2.HIREDATE, EMP1.MGR AS Manager_ID, EMP1.ENAME AS Manager_Name FROM EMP EMP1 JOIN EMP EMP2 ON EMP1.EMP_NO= EMP2.MGR AND EMP1.ENAME='BLAKE'; 

/* BACK UP DATABASE */

BACKUP DATABASE Guru_Sample 
TO DISK = 'D:\SQL Queries.bak';

BACKUP DATABASE Guru_Sample 
TO DISK = 'D:\SQL Queries.bak'
WITH DIFFERENTIAL;

/* RESTORE BACK-UP */ 

/*RESTORE DATABASE Guru_Sample
FROM DISK = 'D:\SQL Queries.bak';*/

