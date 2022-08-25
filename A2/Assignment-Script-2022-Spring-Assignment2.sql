-- Script for Assignment 2

-- Creating database with full name

CREATE DATABASE dvgspring2022assignment2;


-- Connecting to database 
\c dvgspring2022assignment2

-- Relation schemas and instances for assignment 2


CREATE TABLE Student(sid integer,
                     sname text,
                     birthYear integer,
                     primary key (sid));

CREATE TABLE Book(bno integer,
                  title text,
                  price integer,
                  primary key (bno));

CREATE TABLE Major(major text,
                   primary key (major));


CREATE TABLE Buys(sid integer,
                  bno integer,
                  primary key (sid,bno),
                  foreign key (sid) references Student(sid),
                  foreign key (bno) references Book(bno));


CREATE TABLE hasMajor(sid integer,
                      major text,
                      primary key (sid, major),
                      foreign key (sid) references Student (sid),
                      foreign key (major) references Major (major));


CREATE TABLE Cites(bno1 integer,
                   bno2 integer,
                   primary key (bno1,bno2),
                   foreign key (bno1) references Book(bno),
                   foreign key (bno2) references Book(bno));



INSERT INTO Student VALUES
 (1001,'Jean',1999),
 (1002,'Vidya',1999),
 (1003,'Anna',2001),
 (1004,'Qin',2001),
 (1005,'Megan',1999),
 (1006,'Ryan',1995),
 (1007,'Danielle',1997),
 (1008,'Emma',2000),
 (1009,'Hasan',2000),
 (1010,'Linda',1995),
 (1011,'Nick',1999),
 (1012,'Eric',1999),
 (1013,'Lisa',1998),
 (1014,'Deepa',2000),
 (1015,'Chris',1998),
 (1016,'YinYue',1995),
 (1017,'Latha',1997),
 (1018,'Arif',2000),
 (1019,'John',2003),
 (1020,'Margaret',2000);


INSERT INTO Book VALUES
 (2001,'Databases',20),
 (2002,'AI',20),
 (2003,'DataScience',25),
 (2004,'Databases',25),
 (2005,'Programming',30),
 (2006,'Complexity',30),
 (2007,'AI',20),
 (2008,'Algorithms',40),
 (2009,'Networks',40),
 (2010,'AI',30),
 (2011,'Logic',25),
 (2012,'Physics',45),
 (2013,'Physics',30);



INSERT INTO Buys VALUES
 (1003,2001),
 (1010,2007),
 (1011,2010),
 (1014,2007),
 (1010,2005),
 (1011,2003),
 (1008,2006),
 (1009,2003),
 (1006,2003),
 (1007,2008),
 (1017,2004),
 (1017,2003),
 (1004,2001),
 (1007,2006),
 (1005,2007),
 (1005,2011),
 (1013,2004),
 (1002,2009),
 (1009,2011),
 (1018,2011),
 (1015,2004),
 (1001,2011),
 (1013,2006),
 (1015,2002),
 (1005,2002),
 (1008,2009),
 (1014,2009),
 (1002,2002),
 (1001,2002),
 (1009,2001),
 (1006,2006),
 (1015,2007),
 (1019,2008),
 (1006,2002),
 (1018,2008),
 (1003,2004),
 (1006,2011),
 (1013,2005),
 (1003,2010),
 (1008,2008),
 (1007,2009),
 (1016,2008),
 (1011,2002),
 (1004,2005),
 (1004,2009),
 (1006,2010),
 (1001,2010),
 (1001,2006),
 (1009,2010),
 (1019,2002),
 (1004,2010),
 (1018,2010),
 (1009,2006),
 (1008,2003),
 (1018,2005),
 (1004,2002),
 (1011,2004),
 (1007,2002),
 (1015,2005),
 (1012,2001),
 (1017,2010),
 (1002,2001),
 (1016,2010),
 (1010,2003),
 (1003,2008),
 (1017,2005),
 (1016,2006),
 (1011,2007),
 (1006,2009),
 (1001,2005),
 (1007,2005),
 (1005,2004),
 (1013,2008),
 (1005,2008),
 (1004,2011),
 (1009,2009),
 (1013,2001),
 (1015,2006),
 (1003,2002),
 (1016,2001),
 (1006,2007),
 (1016,2011),
 (1006,2008),
 (1007,2003),
 (1015,2003),
 (1011,2011),
 (1010,2006),
 (1012,2009),
 (1001,2001),
 (1011,2001),
 (1013,2002),
 (1012,2007),
 (1002,2010),
 (1012,2010),
 (1001,2007),
 (1005,2003),
 (1011,2005),
 (1014,2011),
 (1011,2006),
 (1009,2002),
 (1008,2001),
 (1002,2003),
 (1002,2005),
 (1009,2008),
 (1008,2002),
 (1006,2001),
 (1008,2007),
 (1012,2002),
 (1017,2008),
 (1019,2009),
 (1010,2010),
 (1003,2011),
 (1017,2006),
 (1013,2011),
 (1006,2004),
 (1016,2004),
 (1019,2001),
 (1002,2006),
 (1018,2006),
 (1010,2009),
 (1010,2008),
 (1003,2007),
 (1009,2007),
 (1002,2007),
 (1018,2009),
 (1004,2004),
 (1018,2001),
 (1007,2001),
 (1004,2003),
 (1010,2001),
 (1008,2010),
 (1008,2005),
 (1015,2001),
 (1012,2003),
 (1005,2006),
 (1007,2010),
 (1010,2004),
 (1015,2010),
 (1017,2002),
 (1013,2003),
 (1001,2008),
 (1016,2002),
 (1005,2005),
 (1016,2009),
 (1012,2004),
 (1009,2004),
 (1020,2012),
 (1020,2013);



INSERT INTO Major VALUES
   ('CS'),
   ('DataScience'),
   ('Math'),
   ('Physics'),
   ('Chemistry'),
   ('English');

INSERT INTO hasMajor VALUES
 (1001,'CS'),
 (1001,'DataScience'),
 (1002,'CS'),
 (1002,'DataScience'),
 (1004,'DataScience'),
 (1004,'CS'),
 (1005,'DataScience'),
 (1005,'CS'),
 (1005,'Math'),
 (1006,'CS'),
 (1006,'Physics'),
 (1007,'Physics'),
 (1007,'CS'),
 (1009,'Physics'),
 (1009,'Math'),
 (1010,'Math'),
 (1011,'Math'),
 (1011,'Physics'),
 (1011,'DataScience'),
 (1011,'CS'),
 (1012,'DataScience'),
 (1012,'Physics'),
 (1012,'CS'),
 (1013,'CS'),
 (1013,'Physics'),
 (1013,'Math'),
 (1014,'Physics'),
 (1014,'DataScience'),
 (1014,'Math'),
 (1015,'CS'),
 (1015,'DataScience'),
 (1016,'Physics'),
 (1016,'DataScience'),
 (1017,'Math'),
 (1017,'CS'),
 (1018,'DataScience'),
 (1019,'Math'),
 (1020,'Chemistry');


INSERT INTO Cites VALUES
 (2004,2003),
 (2006,2003),
 (2009,2003),
 (2009,2004),
 (2009,2006),
 (2008,2007),
 (2010,2008),
 (2010,2007),
 (2010,2003),
 (2002,2001),
 (2009,2001),
 (2011,2003),
 (2011,2005),
 (2001,2004),
 (2012,2013);


create table PC(parent integer,
                child integer);

insert into PC values
 (1,2),
 (1,3),
 (1,4),
 (2,5),
 (2,6),
 (3,7),
 (5,8),
 (8,9),
 (8,10),
 (8,11),
 (7,12),
 (7,13),
 (12,14),
 (14,15);

-- Collaborated with Akshat Arvind, Renuka Sristi

\qecho 'Problem 1'

-- Consider the query ``Find the sid and sname of each student who majors
-- in CS and who is (strictly) younger than some other student who also
-- majors in CS."

-- (a) Formulate this query in SQL by only using the EXISTS or NOT EXISTS set predicates.

SELECT cs.sid, cs.sname, cs.major FROM (SELECT s.sid, s.sname, s.birthyear, m.major FROM Student s, hasMajor m 
			  WHERE s.sid = m.sid AND m.major = 'CS') cs
			  
			  WHERE EXISTS (SELECT 1
							FROM Student s, hasMajor m 
			  				WHERE s.sid = m.sid AND m.major = 'CS'
							AND cs.birthyear > s.birthyear
						   );

-- (b) Formulate this query in SQL by only using the IN, NOT IN, SOME,
-- or ALL set membership predicates.

-- 1.b
SELECT cs.sid, cs.sname, cs.major FROM (SELECT s.sid, s.sname, s.birthyear, m.major FROM Student s, hasMajor m 
			  WHERE s.sid = m.sid AND m.major = 'CS') cs
			  
		WHERE cs.birthyear > SOME (SELECT s.birthyear FROM Student s, hasMajor m 
			  WHERE s.sid = m.sid AND m.major = 'CS');




-- (c) Formulate this query in SQL without using set predicates.
select s.sid, s.sname from student s, hasmajor h 
where s.sid = h.sid and h.major = 'CS'
intersect
select s.sid,s.sname from student s where 
s.birthyear > some(select s.birthyear from student s, hasmajor h
where s.sid = h.sid and h.major = 'CS') order by sid;


\qecho 'Problem 2'

-- Consider the query ``Find the sid and name of each student who does
-- not major in CS and who bought a book that has the next-to-lowest
-- price."

-- (a) Formulate this query in SQL by only using the EXISTS or NOT EXISTS
-- set predicates. You can not use the set operations INTERSECT, UNION,
-- and EXCEPT.


-- 2.b


		
-- 2.a
SELECT DISTINCT(ncs.sid), ncs.sname FROM (SELECT DISTINCT(s.sid), s.sname FROM Student s
			  WHERE NOT EXISTS (SELECT 1 FROM hasMajor h
								 WHERE h.major = 'CS' AND s.sid = h.sid)) ncs,
								Buys bys, Book bo
 		WHERE ncs.sid = bys.sid AND bys.bno = bo.bno
		AND EXISTS (SELECT 1 FROM (SELECT b2.price FROM 
						 			(SELECT DISTINCT(b.price) FROM book b ORDER BY b.price LIMIT 2) b2
									ORDER BY b2.price DESC LIMIT 1) low
									WHERE low.price = bo.price  );


-- (b) Formulate this query in SQL by only using the IN, NOT IN, SOME, or
-- ALL set membership predicates. You can not use the set oper- ations
-- INTERSECT, UNION, and EXCEPT.


SELECT DISTINCT(ncs.sid), ncs.sname FROM (SELECT DISTINCT(s.sid), s.sname FROM Student s
			  WHERE s.sid NOT IN (SELECT DISTINCT(h.sid) FROM hasMajor h
								 WHERE h.major = 'CS')) ncs,
								Buys bys, Book bo
 		WHERE ncs.sid = bys.sid AND bys.bno = bo.bno
		AND bo.price IN (SELECT b2.price FROM 
						 (SELECT DISTINCT(b.price) FROM book b ORDER BY b.price LIMIT 2) b2
		ORDER BY b2.price DESC LIMIT 1);
 

-- (c) Formulate this query in SQL without using set predicates.

WITH StudentNotCS AS
	(SELECT S.SID
		FROM STUDENT S
		EXCEPT SELECT HM.SID
		FROM HASMAJOR HM
		WHERE HM.MAJOR = 'CS'),
	Studentsnotleastprice AS
	(SELECT DISTINCT t.SID,
			B.BNO
		FROM BOOK B,
			BUYS t,
			BOOK B1
		WHERE t.BNO = B.BNO
			AND B.PRICE > B1.PRICE),
	Bookhigherthan2 AS
	(SELECT B3.BNO
		FROM BOOK B1,
			BOOK B2,
			BOOK B3
		WHERE B1.PRICE < B2.PRICE
			AND B2.PRICE < B3.PRICE
			AND B1.BNO <> B2.BNO
			AND B2.BNO <> B3.BNO),
	SIDS_BOUGHT_NEXT_TO_LOWEST AS
	(SELECT S.SID
		FROM StudentNotCS S INTERSECT
			(SELECT SID
				FROM
					(SELECT SID,
							BNO
						FROM Studentsnotleastprice B
						EXCEPT SELECT S.SID,
							B2.BNO
						FROM Bookhigherthan2 B2,
							STUDENT S) AB))
SELECT S.SID,
	S.SNAME
FROM STUDENT S,
	SIDS_BOUGHT_NEXT_TO_LOWEST S1
WHERE S.SID = S1.SID;



\qecho 'Problem 4'

-- Consider the query ``Find each major that is not a major of any person
-- who bought a book with title `Databases' or `Philosophy'."

-- (a) Formulate this query in SQL using subqueries and set predicates. 
-- You can not use the set operations INTERSECT, UNION, and EXCEPT.
select major from major where 
major not in (select major from hasmajor 
where sid in (select sid from Buys 
where bno in (select bno from Book where 
title in ('Databases','Philosophy'))));
					  

-- (b) Formulate this query in SQL without using set predicates.
select major from major
except
select m.major from major m, hasmajor h, Buys t, Book b 
where m.major = h.major and h.sid = t.sid 
and t.bno = b.bno and b.title = 'Databases' or b.title = 'Philosophy';

\qecho 'Problem 3'
-- Consider the query ``Find each $(s,b)$ pair where $s$ is the
-- sid of a student who bought book $b$ and such that
-- each other book bought by $s$ is a book cited by $b$."

-- (a) Formulate this query in SQL by only using the EXISTS or NOT EXISTS set predicates. 
-- You can not use the set operations INTERSECT, UNION, and EXCEPT.

select t.sid,t.bno FROM Buys t
where not exists (select 1 from Buys t1
where t1.sid = t.sid and t1.bno <> t.bno
and not exists (select 1 from Cites c
WHERE c.bno2 = t1.bno and C.bno1 = t.bno));

-- (b) Formulate this query in SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates. 
-- You can not use the set oper- ations INTERSECT, UNION, and EXCEPT.

select t.sid,t.bno FROM Buys t
where not exists (select 1 from Buys t1
where t1.sid = t.sid and t1.bno <> t.bno
and not exists (select 1 from Cites c
WHERE c.bno2 = t1.bno and C.bno1 = t.bno));

-- (c) Formulate this query in SQL without using set predicates.
select distinct a.sid, a.bno
from (select t.sid, t.bno
from buys t except (select b.sid,
b.bno from (select t.sid, t.bno,
t1.sid as sid2, t1.bno as bno2
from buys t, buys t1 where t1.bno <> t.bno
and t1.sid = t.sid except select t.sid,
t.bno, t1.sid as sid2, t1.bno as bno2
from buys t, buys t1, cites c
where c.bno2 = t1.bno and c.bno1 = t.bno ) b)) a;


\qecho 'Problem 5'

-- 5a
SELECT b.bno, b.title FROM Book b
where not exists(select 1 from hasmajor hm1, hasmajor hm2
where hm1.major = 'CS' and hm2.major = 'CS' and hm1.sid <> hm2.sid
and (hm1.sid, b.bno) not in	(select t.sid, t.bno from Buys t)
AND (hm2.sid, b.bno) not in	(select t.sid, t.bno from Buys t) )
and exists (select 1 from hasmajor hm where hm.major = 'CS'
and (hm.sid, b.bno) not in (select t.sid,t.bno from Buys t));
	      
--5b
SELECT X.BNO,
	X.TITLE
FROM
	(SELECT Y.BNO,
			Y.TITLE,
			Y.MAJOR,
			Y.SID
		FROM
			(SELECT B.BNO,
					B.TITLE,
					HM.MAJOR,
					HM.SID
				FROM BOOK B,
					HASMAJOR HM
				WHERE HM.MAJOR = 'CS'
				EXCEPT SELECT B.BNO,
					B.TITLE,
					HM.MAJOR,
					HM.SID
				FROM BOOK B,
					HASMAJOR HM,
					BUYS BS
				WHERE HM.SID = BS.SID
					AND B.BNO = BS.BNO ) Y
		EXCEPT SELECT Z.BNO,
			Z.TITLE,
			Z.MAJOR,
			Z.SID
		FROM
			(SELECT W.BNO,
					W.TITLE,
					W.MAJOR,
					W.SID,
					W.SID2,
					W.SID3
				FROM
					(SELECT B.BNO,
							B.TITLE,
							HM.MAJOR,
							HM.SID,
							HM1.SID AS SID2,
							HM2.SID AS SID3
						FROM BOOK B,
							HASMAJOR HM,
							HASMAJOR HM1,
							HASMAJOR HM2
						WHERE HM1.MAJOR = 'CS'
							AND HM2.MAJOR = 'CS'
							AND HM1.SID <> HM2.SID
						EXCEPT SELECT B.BNO,
							B.TITLE,
							HM.MAJOR,
							HM.SID,
							HM1.SID AS SID2,
							HM2.SID AS SID3
						FROM BOOK B,
							HASMAJOR HM,
							HASMAJOR HM1,
							HASMAJOR HM2,
							BUYS BS
						WHERE BS.SID = HM2.SID
							AND BS.BNO = B.BNO ) W
				EXCEPT SELECT B.BNO,
					B.TITLE,
					HM.MAJOR,
					HM.SID,
					HM1.SID AS SID2,
					HM2.SID AS SID3
				FROM BOOK B,
					HASMAJOR HM,
					HASMAJOR HM1,
					HASMAJOR HM2,
					BUYS BS
				WHERE HM1.SID = BS.SID
					AND B.BNO = BS.BNO ) Z) X;

-- alternatively
Select distinct a.SID, a.BNO
from (
	select BS.SID, BS.BNO
	from BUYS BS
	EXCEPT
	(
		select b.SID, b.BNO
		from (
			select BS.SID, BS.BNO, BS1.SID as sid2, BS1.BNO as bno2
			from BUYS BS, BUYS BS1
			where BS1.BNO <> BS.BNO and BS1.SID = BS.SID
			EXCEPT
			select BS.SID, BS.BNO, BS1.SID as sid2, BS1.BNO as bno2
			from BUYS BS, BUYS BS1, CITES C
			where
				C.BNO2 = BS1.BNO
				AND C.BNO1 = BS.BNO
			) b
	)
) a;



\qecho 'Problem 6'
-- Problem 1 in RA SQL2

-- 6.b
SELECT DISTINCT st1.sid, st1.sname FROM
	(SELECT DISTINCT s1.sid, s1.sname, s1.birthyear FROM  Student s1, hasMajor h1
		WHERE s1.sid = h1.sid AND h1.major='CS') st1
	CROSS JOIN
	(SELECT DISTINCT s1.sid, s1.sname, s1.birthyear FROM  Student s1, hasMajor h1
		WHERE s1.sid = h1.sid AND h1.major='CS') st2
	WHERE st1.birthyear > st2.birthyear;


\qecho 'Problem 7'
-- Problem 2 in RA SQL

CREATE VIEW antilow AS
SELECT DISTINCT  b.price FROM Book b
EXCEPT
(SELECT DISTINCT  b.price FROM Book b
EXCEPT 
SELECT DISTINCT b1.price FROM Book b1 CROSS JOIN Book b2
WHERE b1.price > b2.price);


CREATE VIEW low2 AS
SELECT DISTINCT l.price FROM antilow l
EXCEPT
SELECT DISTINCT l1.price FROM antilow l1 CROSS JOIN antilow l2
WHERE l1.price > l2.price;


SELECT stncs.sid AS sid, stncs.sname AS sname FROM (SELECT DISTINCT s.sid, s.sname FROM 
Student s
CROSS JOIN
Book bk
CROSS JOIN
Buys bys
CROSS JOIN
low2 
WHERE s.sid=bys.sid AND bys.bno = bk.bno AND bk.price = low2.price
													  
EXCEPT 
SELECT DISTINCT st1.sid, st1.sname FROM hasMajor h1, Student st1
				 WHERE   h1.major= 'CS' AND st1.sid = h1.sid) stncs
				 ORDER BY stncs.sid;


\qecho 'Problem 8'
-- Problem 3 in RA SQL

SELECT DISTINCT a1.SID, a1.BNO
from (
	select BS.SID, BS.BNO
	from BUYS BS
	EXCEPT
	(
		select b.SID, b.BNO
		from (
			select BS.SID, BS.BNO, BS1.SID as sid2, BS1.BNO as bno2
			from BUYS BS JOIN BUYS BS1 ON (BS1.BNO <> BS.BNO and BS1.SID = BS.SID)
			EXCEPT
			select BS.SID, BS.BNO, BS1.SID as sid2, BS1.BNO as bno2
			from BUYS BS JOIN CITES C ON (C.BNO1 = BS.BNO) JOIN BUYS BS1 ON (C.BNO2 = BS1.BNO)
			) b

	)
) a1;


\qecho 'Problem 9'
-- Problem 4 in RA SQL
SELECT mj.major FROM major mj
EXCEPT
SELECT mj1.major 
FROM major mj1 JOIN hasmajor hm ON mj1.major = hm.major 
JOIN Buys bys ON hm.sid = bys.sid
JOIN Book b ON bys.bno = b.bno AND b.title = 'Databases' OR b.title = 'Philosophy'; 


\qecho 'Problem 10'

-- Problem 5 in RA SQL


\qecho 'Problem 16'

-- Create a view studentTriangle that contains each triple (s1, s2, s3)
-- of sids of different students who have common major.

-- Then test your view.
-- 16
CREATE OR REPLACE VIEW strn AS
(SELECT st1.sid AS sid1, st2.sid AS sid2, st3.sid AS sid3 FROM Student st1, Student st2, Student st3
WHERE st1.sid <> st2.sid 
   AND st2.sid <> st3.sid 
   AND st1.sid <>st3.sid
   AND EXISTS (SELECT 1 FROM hasMajor h1, hasMajor h2, hasMajor h3
               WHERE st1.sid = h1.sid 
               AND st2.sid = h2.sid AND st3.sid = h3.sid
               AND h1.major = h2.major AND h2.major = h3.major 
               AND h1.major = h3.major));

SELECT COUNT(*) AS counts FROM strn;

\qecho 'Problem 17'


-- Define a parameterized view PurchasedBookAbovePrice(sid int, price integer) that
-- returns, for a given student identified by sid and a given price
-- value, the subrelation of Book of books that are bought by that
-- student and that cost strictly more than price.


CREATE OR REPLACE FUNCTION PurchasedBookAbovePrice(stsid int, stpr integer)
RETURNS TABLE(bno int, title text, price int) AS
$$
SELECT b.bno, b.title, b.price 
FROM Book b, Buys bys
WHERE b.bno = bys.bno AND bys.sid = stsid AND b.price > stpr
ORDER BY 1;
$$language sql;



-- Test your view for the parameter values (1001,15), (1001,20), (1001,50), and (1002,30).
SELECT * FROM PurchasedBookAbovePrice(1001,15);

SELECT * FROM PurchasedBookAbovePrice(1001,20);

SELECT * FROM PurchasedBookAbovePrice(1001,50);

SELECT * FROM PurchasedBookAbovePrice(1002,30);

\qecho 'Problem 18'

-- Define a parameterized view CitingBook(bno integer, sid integer) that
-- returns for a book with bno bno the subrelation of Book of books that
-- cite book bno and that are bought by the student with sid sid.

-- Test your view for the parameters (2003, 1001), (2003,1018), and
-- (2004,1003).

RETURNS TABLE(bno int, title text, price int) AS

$$
SELECT b.bno, b.title, b.price FROM Book b, Buys bys, Cites ct WHERE
bys.bno = b.bno AND bys.sid = stsid 
AND bys.bno = ct.bno1 and ct.bno2 = stbno;
$$language sql;


SELECT * FROM CitingBook(2003,1001);

SELECT * FROM CitingBook(2003,1018);

SELECT * FROM CitingBook(2004,1003);
\qecho 'Problem 19'


-- Define a parameterized view {\tt NotJointlyBoughtBook(sid1 integer,
-- sid2 integer)} that returns the subrelation of {\tt Book} of books
-- that are not bought by both the students with sids {\tt sid1} and {\tt
-- sid2}, respectively.
CREATE OR REPLACE FUNCTION NotJointlyBoughtBook(ssid1 integer, ssid2 integer)
RETURNS TABLE (bno int, title text, price int) AS
$$
SELECT DISTINCT b.bno, b.title , b.price FROM Book b 
except
(SELECT DISTINCT b.bno,b.title, b.price FROM Book b, Buys bys WHERE b.bno = bys.bno AND 
bys.sid IN (ssid1,ssid2));
$$ language sql;


-- Test your view for the parameters (1001, 1002), (1001,1003), and (1002,1003).
SELECT * FROM NotJointlyBoughtBook(1001,1002);

SELECT * FROM NotJointlyBoughtBook(1001,1003);

SELECT * FROM NotJointlyBoughtBook(1002,1003);

\qecho 'Problem 20'

-- Let PC(parent : integer, child : integer) be a rooted parent-child tree. 
-- So a pair (n,m) in PC indicates that node n is a parent of node m. 

-- The sameGeneration(n1, n2) binary relation is inductively defined using the following two rules:
--  If n is a node in T , then the pair (n, n) is in the sameGeneration relation. (Base rule)

--   If $n_1$ is the parent of $m_1$ in $PC$ and $n_2$ is the parent of
--   $m_2$ in $PC$ and $(n_1,n_2)$ is a pair in the {\tt sameGeneration}
--   relation then $(m_1,m_2)$ is a pair in the {\tt sameGeneration}
--   relation. ({\bf Inductive Rule})

-- Write a \blue{recursive view} for the {\tt sameGeneration} relation.
-- 
-- Test your view.
CREATE OR REPLACE RECURSIVE VIEW sameGeneration(stn1, stn2) AS
((SELECT p1.child, p1.child FROM PC p1 
	UNION  
SELECT p2.parent, p2.parent FROM PC p2) 
   UNION
SELECT p1.child, p2.child FROM PC p1, PC p2, sameGeneration samg
WHERE p1.child <> p2.child AND 
samg.stn1 = p1.parent AND samg.stn2 = p2.parent);

SELECT * FROM sameGeneration ORDER BY 1;

-- Connect to default database
\c postgres
--
--
-- Drop database created for this assignment
DROP DATABASE dvgspring2022assignment2;






