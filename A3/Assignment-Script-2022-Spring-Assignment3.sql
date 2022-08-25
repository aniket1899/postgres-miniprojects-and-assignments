-- Script for Assignment 3

-- Creating database with full name

CREATE DATABASE dirkvg;

-- Connecting to database 
\c dirkvg

-- Relation schemas and instances for assignment 2

CREATE TABLE Student(sid integer,
                     sname text,
                     birthYear integer,
                     primary key (sid));

CREATE TABLE Book(bno integer,
                  title text,
                  primary key (bno));

CREATE TABLE Major(major text,
                   primary key (major));


CREATE TABLE Buys(sid integer,
                  bno integer,
                  price integer,
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
     (1002,'Vidya', 1999),
     (1003,'Anna', 2001),
     (1004,'Qin', 2001),
     (1005,'Megan', 1999),
     (1006,'Ryan', 1995),
     (1007,'Danielle',1997),
     (1008,'Emma', 2000),
     (1009,'Hasan', 2000),
     (1010,'Linda', 1995),
     (1011,'Nick', 1999),
     (1012,'Eric', 1999),
     (1013,'Lisa', 1998),
     (1014,'Deepa', 2000), 
     (1015,'Chris', 1998),
     (1016,'YinYue', 1995),
     (1017,'Latha', 1997),
     (1018,'Arif', 2000),
     (1019,'John', 2003);

INSERT INTO Book VALUES
     (2001,'Databases'),
     (2002,'AI'),
     (2003,'DataScience'),
     (2004,'Databases'),
     (2005,'Programming'),
     (2006,'Complexity'),
     (2007,'AI'),
     (2008,'Algorithms'),
     (2009,'Networks'),
     (2010,'AI'),
     (2011,'Logic');


INSERT INTO Buys VALUES
 (1019,2006,30),
 (1003,2001,30),
 (1010,2007,30),
 (1011,2010,30),
 (1014,2007,30),
 (1010,2005,30),
 (1011,2003,30),
 (1008,2006,30),
 (1009,2003,30),
 (1006,2003,30),
 (1007,2008,31),
 (1017,2004,31),
 (1017,2003,31),
 (1004,2001,31),
 (1007,2006,31),
 (1005,2007,31),
 (1005,2011,31),
 (1013,2004,31),
 (1002,2009,32),
 (1009,2011,32),
 (1018,2011,32),
 (1015,2004,32),
 (1001,2011,32),
 (1013,2006,32),
 (1015,2002,32),
 (1005,2002,32),
 (1008,2009,33),
 (1014,2009,33),
 (1002,2002,33),
 (1001,2002,33),
 (1009,2001,33),
 (1006,2006,33),
 (1019,2004,33),
 (1015,2007,34),
 (1019,2008,34),
 (1006,2002,34),
 (1018,2008,34),
 (1003,2004,35),
 (1006,2011,35),
 (1013,2005,35),
 (1003,2010,35),
 (1008,2008,35),
 (1007,2009,35),
 (1016,2008,36),
 (1011,2002,36),
 (1004,2005,36),
 (1004,2009,36),
 (1006,2010,36),
 (1001,2010,37),
 (1001,2006,37),
 (1009,2010,37),
 (1019,2002,37),
 (1004,2010,37),
 (1018,2010,38),
 (1009,2006,38),
 (1008,2003,38),
 (1018,2005,38),
 (1004,2002,38),
 (1011,2004,38),
 (1007,2002,39),
 (1015,2005,39),
 (1012,2001,39),
 (1017,2010,39),
 (1002,2001,39),
 (1016,2010,39),
 (1010,2003,39),
 (1003,2008,39),
 (1017,2005,39),
 (1016,2006,40),
 (1011,2007,40),
 (1006,2009,40),
 (1001,2005,40),
 (1007,2005,40),
 (1005,2004,40),
 (1013,2008,40),
 (1005,2008,40),
 (1004,2011,41),
 (1009,2009,41),
 (1013,2001,41),
 (1015,2006,42),
 (1003,2002,42),
 (1016,2001,42),
 (1006,2007,42),
 (1016,2011,42),
 (1006,2008,42),
 (1007,2003,43),
 (1015,2003,43),
 (1011,2011,43),
 (1010,2006,43),
 (1012,2009,43),
 (1001,2001,43),
 (1011,2001,43),
 (1013,2002,43),
 (1012,2007,43),
 (1002,2010,43),
 (1012,2010,43),
 (1001,2007,43),
 (1005,2003,43),
 (1011,2005,43),
 (1014,2011,44),
 (1011,2006,44),
 (1009,2002,44),
 (1008,2001,44),
 (1002,2003,44),
 (1002,2005,44),
 (1009,2008,45),
 (1008,2002,45),
 (1006,2001,45),
 (1008,2007,45),
 (1012,2002,45),
 (1017,2008,45),
 (1019,2009,45),
 (1010,2010,46),
 (1003,2011,46),
 (1017,2006,46),
 (1013,2011,46),
 (1019,2010,46),
 (1006,2004,47),
 (1016,2004,47),
 (1019,2001,47),
 (1002,2006,47),
 (1018,2006,47),
 (1010,2009,47),
 (1010,2008,47),
 (1003,2007,48),
 (1009,2007,48),
 (1002,2007,48),
 (1018,2009,48),
 (1004,2004,48),
 (1018,2001,48),
 (1007,2001,48),
 (1004,2003,48),
 (1010,2001,49),
 (1008,2010,49),
 (1008,2005,49),
 (1015,2001,49),
 (1012,2003,49),
 (1005,2006,49),
 (1007,2010,50),
 (1010,2004,50),
 (1019,2011,50),
 (1015,2010,50),
 (1017,2002,50),
 (1013,2003,50),
 (1001,2008,50),
 (1016,2002,51),
 (1005,2005,51),
 (1016,2009,51),
 (1012,2004,51),
 (1009,2004,51);



INSERT INTO Major VALUES
   ('CS'),
   ('DataScience'),
   ('Math'),
   ('Physics'),
   ('Chemistry');


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
 (1019,'Math');


INSERT INTO Cites VALUES
 (2004, 2003),
 (2006, 2003),
 (2009, 2003),
 (2009, 2004),
 (2009, 2006),
 (2008, 2007),
 (2010, 2008),
 (2010, 2007),
 (2010, 2003),
 (2002, 2001),
 (2009, 2001),
 (2011, 2003),
 (2011, 2005),
 (2001,2004);


\qecho 'Example 1'

-- Consider the query ``Find each $(s,b)$ pair where $s$ is the sid
-- of a student who majors in CS and such the price at which $s$ buys $b$
-- is among the lowest prices of all books bought by $s$." 

-- A possible formulation of this query in Pure SQL is

select t.sid, t.bno
from   buys t
where  t.sid in  (select hm.sid
                  from   hasMajor hm
                  where  hm.major = 'CS') and
       t.price <= ALL (select t1.price
                       from   buys t1
                       where  t1.sid = t.sid);

-- TRANSLATION
-- We will now translate this query to, eventually, obtain an
-- equivalent, but not necessarily optimized, RA SQL query


-- Step 1. Translation of `and' in the `where' clause.

select q.sid, q.bno
from   (select t.*
        from   buys t
        where  t.sid in (select hm.sid
                         from   hasMajor hm
                         where  hm.major = 'CS')
        intersect
        select t.*
        from   buys t
        where  t.price <= ALL (select t1.price
                               from   buys t1
                               where  t1.sid = t.sid)) q;
-- Step 2 Translation of  `in' and `<= ALL'.

select q.sid, q.bno
from   (select t.*
        from   buys t, hasMajor hm
        where  t.sid = hm.sid and hm.major = 'CS'
        intersect
        (select t.*
         from   buys t
         except
         select t.*
         from   buys t, buys t1
         where  t.price > t1.price and t1.sid = t.sid)) q;

-- Step 3 Move 'constant' condition to 'from' clause.

select q.sid, q.bno
from   (select t.*
        from   buys t, (select hm.* from hasMajor hm where hm.major = 'CS') hm
        where  t.sid = hm.sid
        intersect
        (select t.*
         from   buys t
         except
         select t.*
         from   buys t, buys t1
         where  t.price > t1.price and t1.sid = t.sid)) q;

-- Step 4 Introduction of natural join and join.

select q.sid, q.bno
from   (select t.*
        from   buys t
               natural join (select hm.* from hasMajor hm  where hm.major = 'CS') hm
               intersect
              (select t.*
               from   buys t
               except
               select t.*
               from   buys t join buys t1 on (t.price > t1.price and t1.sid = t.sid))) q;


-- OPTIMIZATION

-- To aid in describing the optimization, we will introduce some
-- temporary views and formulate the query in terms of these views.

with   E as (select t.*
             from   buys t
                    natural join (select hm.* from hasMajor hm  where hm.major = 'CS') hm),
       F as (select t.*
             from   buys t 
                    join buys t1 on (t.price > t1.price and t1.sid = t.sid))
select q.sid, q.bno
from   (select e.*
        from   E e
        intersect
        (select t.*
         from   buys t
         except
         select f.*
         from   F f)) q;


-- Step 1 Observe the query which corresonds to the expression 
-- 'E intersect (Buys except F)', which by a set-theoretic equality is
-- equal to '(E intersect Buys) except F'.  We then observe that, in
-- this case, E is a subset of Buys.  Therefore 'E intersect Buys = E',
-- and therefore we get the simplified expression 'E except F'.  So the
-- query becomes

with   E as (select t.*
             from   buys t
                    natural join (select hm.* from hasMajor hm  where hm.major = 'CS') hm),
       F as (select t.*
             from   buys t 
                    join buys t1 on (t.price > t1.price and t1.sid = t.sid))
select q.sid, q.bno
from  (select e.*
       from   E e
       except
       select f.*
       from   F f) q;

-- Step 2  We now concentrate on the expressions E and F
-- We can push the projections over the joins and get query

with   E as (select t.sid, t.bno
             from   (select t.sid, t.bno from buys t) t
                    natural join (select hm.sid from hasMajor hm  where hm.major = 'CS') hm),
       F as (select t.sid, t.bno
             from   buys t 
                    join buys t1 on (t.price > t1.price and t1.sid = t.sid))
select q.sid, q.bno
from  (select e.*
       from   E e
       except
       select f.*
       from   F f) q;

-- Step 3  We have an expression of the form project_L(project_L(E)-project_L(F))
-- This simplifies to the expression project_L(E)-project_L(F)
-- So we get the optimized RA SQL query


with   E as (select t.sid, t.bno
             from   buys t
                    natural join (select hm.sid from hasMajor hm  where hm.major = 'CS') hm),
       F as (select t.sid, t.bno
             from   buys t 
                    join (select t1.sid, t1.price 
                          from   buys t1) t1 on (t.price > t1.price and t1.sid = t.sid))
select e.sid, e.bno
from   E e
except
select f.sid, f.bno
from   F f;

-- After view expansion this becomes the RA SQL query

select t.sid, t.bno
from   (select t.sid, t.bno from buys t) t
        natural join (select hm.sid from hasMajor hm  where hm.major = 'CS') hm
except
select t.sid, t.bno
from   buys t 
       join (select t1.sid, t1.price 
             from   buys t1) t1 on (t.price > t1.price and t1.sid = t.sid);


\qecho 'Problem 6'

-- Consider the query ``Find the bno and title of each book whose
-- price is less than 32 and that is bought by a student who majors in
-- CS.''

-- A possible way to write this query in Pure SQL is 


select b.bno, b.title
from   book b
where  b.bno in (select t.bno
                 from   buys t
                 where  t.price < 32 and 
                        t.sid = SOME (select hm.sid
                                      from   hasMajor hm
                                      where  hm.major = 'CS'));


\qecho 'Problem 6.a'

-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.


select b.bno, b.title
from   book b
where  b.bno in (select t.bno
                 from   buys t
                 where  t.price < 32 and 
                        t.sid = SOME (select hm.sid
                                      from   hasMajor hm
                                      where  hm.major = 'CS'));

-- step 1 some to exists
SELECT B.BNO,B.TITLE 
FROM BOOK B
WHERE B.BNO IN (SELECT T.BNO FROM BUYS T
				WHERE T.PRICE < 32 
                            AND EXISTS
				(SELECT HM.SID FROM HASMAJOR HM
				WHERE HM.MAJOR = 'CS'
				AND T.SID = HM.SID));

									  
-- step 2: in - exists
SELECT B.BNO, B.TITLE 
FROM BOOK B
WHERE EXISTS (SELECT T.BNO
				FROM BUYS T WHERE T.PRICE < 32
				AND T.BNO = B.BNO 
			  AND EXISTS
				(SELECT HM.SID FROM HASMAJOR HM
				WHERE HM.MAJOR = 'CS' AND T.SID = HM.SID));

-- step 3: replace exisis
SELECT B.BNO, B.TITLE 
FROM BOOK B
WHERE EXISTS (SELECT T.BNO, HM.SID
				FROM BUYS T, HASMAJOR HM
				WHERE T.PRICE < 32 AND T.BNO = B.BNO
				AND HM.MAJOR = 'CS' AND T.SID = HM.SID);
SELECT DISTINCT B.BNO, B.TITLE 
FROM BOOK B,
BUYS T, HASMAJOR HM 
WHERE T.PRICE < 32
AND T.BNO = B.BNO AND HM.MAJOR = 'CS' AND T.SID = HM.SID;

--step 4 nat join
SELECT DISTINCT B.BNO, B.TITLE
FROM BOOK B
NATURAL JOIN BUYS T
NATURAL JOIN HASMAJOR HM
WHERE T.PRICE < 32
AND HM.MAJOR = 'CS';

\qecho 'Problem 6.b'

-- While staying in RA SQL, and starting from the RA SQL query obtained
-- in Problem 6.a, produce an equivalent optimized RA SQL.
-- Show the optimization steps you used to obtain your solutions.  In
-- particular, specify the rewrite rules that you used.

-- sel over query
SELECT DISTINCT B.BNO, B.TITLE 
FROM BOOK B
JOIN (SELECT T.* FROM BUYS T WHERE T.PRICE < 32) T ON (T.BNO = B.BNO)
JOIN (SELECT HM.* FROM HASMAJOR HM WHERE HM.MAJOR = 'CS') HM ON (HM.SID = T.SID);


-- elim proj

SELECT DISTINCT B.BNO, B.TITLE 
FROM BOOK B
JOIN (SELECT T.BNO, T.SID FROM BUYS T WHERE T.PRICE < 32) T  ON (T.BNO = B.BNO)
JOIN (SELECT HM.SID FROM HASMAJOR HM WHERE HM.MAJOR = 'CS') H ON (H.SID = T.SID);

-- semi join








\qecho 'Problem 7'

-- Consider the query ``Find the sid of each student who has all-but-one
-- major."

-- A possible way to write this query in Pure SQL is
select s.sid
from   student s
where  exists (select 1
               from   major m
               where  (s.sid, m.major) not in (select hm.sid, hm.major 
                                               from   hasMajor hm)) and
       not exists (select 1
                   from   major m1, major m2
                   where  m1.major <> m2.major and
                          (s.sid, m1.major) not in (select hm.sid, hm.major 
                                                    from   hasMajor hm) and
                          (s.sid, m2.major) not in (select hm.sid, hm.major 
                                                    from   hasMajor hm));

\qecho 'Problem 7.a'

-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.

-- 1 in -> intersect
SELECT Q.SID FROM (SELECT S.* FROM STUDENT S WHERE EXISTS
(SELECT 1 FROM MAJOR MJ WHERE (S.SID,MJ.MAJOR) NOT IN (SELECT HM.SID,HM.MAJOR
FROM HASMAJOR HM))
INTERSECT
SELECT S.* FROM STUDENT S WHERE NOT EXISTS(SELECT 1
                   FROM   MAJOR MJ1, MAJOR MJ2
                   WHERE  MJ1.MAJOR <> MJ2.MAJOR AND
                          (S.SID, MJ1.MAJOR) NOT IN 
							(SELECT HM.SID, HM.MAJOR FROM   HASMAJOR HM) AND
                          (S.SID, MJ2.MAJOR) NOT IN 
							(SELECT HM.SID, HM.MAJOR 
                                             FROM   HASMAJOR HM))) Q;


-- 2 not in -> except 
SELECT Q.SID FROM (
	(SELECT P1.SID, P1.SNAME, P1.BIRTHYEAR 
	 FROM 
		(SELECT S.*, MJ.* FROM STUDENT S, MAJOR MJ
		EXCEPT
		SELECT S.*, MJ.* FROM STUDENT S, HASMAJOR HM, MAJOR MJ
		WHERE S.SID = HM.SID AND MJ.MAJOR = HM.MAJOR)P1)
		INTERSECT
		(SELECT S.* FROM STUDENT S
		EXCEPT
		SELECT S.* FROM STUDENT S, MAJOR MJ1, MAJOR MJ2
		WHERE MJ1.MAJOR <> MJ2.MAJOR 
		 AND (S.SID, MJ1.MAJOR) NOT IN (SELECT HM.SID, HM.MAJOR 
									FROM   HASMAJOR HM) 
		 AND
		(S.SID, MJ2.MAJOR) NOT IN (SELECT HM.SID, HM.MAJOR 
								FROM   HASMAJOR HM))
) Q;


--3 not in -> except 

SELECT Q.SID FROM (
	(SELECT Q1.SID, Q1.SNAME, Q1.BIRTHYEAR 
	 FROM 
		(SELECT S.*, MJ.* 
		 FROM STUDENT S CROSS JOIN MAJOR MJ
		EXCEPT
		SELECT S.*, MJ1.* 
		 FROM STUDENT S JOIN HASMAJOR HM ON S.SID = HM.SID
		JOIN MAJOR MJ1 ON MJ1.MAJOR = HM.MAJOR)
	       Q1)
	
		INTERSECT
	
		(SELECT S.* FROM STUDENT S
		 
		EXCEPT
		 
		(SELECT Q2.SID, Q2.SNAME, Q2.BIRTHYEAR
		FROM 
		 (SELECT S.*, MJ1.*, MJ2.* FROM STUDENT S 
		  CROSS JOIN MAJOR MJ1 JOIN MAJOR MJ2
		  ON MJ1.MAJOR <> MJ2.MAJOR
		  
		EXCEPT
		  
		SELECT S.*, MJ1.*, MJ2.* 
		  FROM MAJOR MJ2 CROSS JOIN STUDENT S
		JOIN HASMAJOR HM ON S.SID = HM.SID JOIN MAJOR MJ1 ON MJ1.MAJOR = HM.MAJOR
		EXCEPT
		SELECT S.*, MJ1.*, MJ2.* FROM MAJOR MJ1 CROSS JOIN
		STUDENT S JOIN HASMAJOR HM ON S.SID = HM.SID JOIN MAJOR MJ2
		ON MJ2.MAJOR = HM.MAJOR) Q2
		))
)Q;

-- 4


SELECT Q.SID FROM (
	(SELECT Q1.SID, Q1.SNAME, Q1.BIRTHYEAR FROM 
		(SELECT S.*, MJ.* 
		 FROM STUDENT S CROSS JOIN MAJOR MJ
		 
		EXCEPT
		 
		SELECT S.*, MJ.* 
		 FROM STUDENT S JOIN HASMAJOR HM ON S.SID = HM.SID
		JOIN MAJOR MJ ON  HM.MAJOR=MJ.MAJOR ) Q1)
	
		INTERSECT
	
		(SELECT S.* FROM STUDENT S
		 
		EXCEPT
		 
		(SELECT Q2.SID, Q2.SNAME, Q2.BIRTHYEAR
		FROM (SELECT S.*, MJ1.*, MJ2.* 
			  FROM STUDENT S CROSS JOIN MAJOR MJ1 JOIN MAJOR MJ2
		ON MJ1.MAJOR <> MJ2.MAJOR
			  
		EXCEPT
			  
		SELECT S.*, MJ1.*, MJ2.* 
			  FROM MAJOR MJ2 CROSS JOIN STUDENT S
		JOIN HASMAJOR HM ON S.SID = HM.SID JOIN MAJOR MJ1 ON   HM.MAJOR = MJ1.MAJOR
			  
		EXCEPT
			  
		SELECT S.*, MJ1.*, MJ2.* 
			  FROM MAJOR MJ1 CROSS JOIN
		STUDENT S JOIN HASMAJOR HM ON S.SID = HM.SID JOIN MAJOR MJ2
		ON HM.MAJOR =  MJ2.MAJOR)
		 Q2))
)Q;


\qecho 'Problem 7.b'

-- While staying in RA SQL, and starting from the RA SQL query obtained
-- in Problem 7.a, produce an equivalent optimized RA SQL.
-- Show the optimization steps you used to obtain your solutions.  In
-- particular, specify the rewrite rules that you used.


-- 1 eliminate sname, birthyear and outer sub-query Q

WITH STUDENT AS (SELECT S.SID FROM STUDENT S)
SELECT SID FROM (
		SELECT SID, MAJOR 
	FROM STUDENT CROSS JOIN MAJOR 
	
	EXCEPT
	
	SELECT S.SID, MJ.MAJOR 
	FROM STUDENT S NATURAL JOIN HASMAJOR HM NATURAL JOIN MAJOR MJ) P
	
	INTERSECT
	
	(SELECT S.* FROM STUDENT S
	 
	EXCEPT
	 
	(SELECT Q2.SID 
	 FROM (SELECT S.*, MJ1.*, MJ2.* FROM STUDENT S CROSS JOIN MAJOR MJ1 JOIN MAJOR MJ2
	ON MJ1.MAJOR <> MJ2.MAJOR
		   
	EXCEPT
		   
	SELECT S.*, MJ1.*, MJ2.* 
		   FROM MAJOR MJ2 CROSS JOIN STUDENT S
	JOIN HASMAJOR HM ON S.SID = HM.SID JOIN MAJOR MJ1 ON  HM.MAJOR = MJ1.MAJOR
	EXCEPT
	SELECT S.*, MJ1.*, MJ2.* FROM MAJOR MJ1 CROSS JOIN
	STUDENT S JOIN HASMAJOR HM ON S.SID = HM.SID JOIN MAJOR MJ2
	ON HM.MAJOR = MJ2.MAJOR)
	 Q2));

-- 2 modify student s

WITH STUDENT AS (SELECT SID FROM STUDENT)
SELECT SID FROM (
	SELECT SID, MAJOR FROM STUDENT
	CROSS JOIN MAJOR 
	
	EXCEPT
	
	SELECT S.SID, MJ.MAJOR FROM STUDENT S NATURAL JOIN HASMAJOR HM
	NATURAL JOIN MAJOR MJ) Q
	INTERSECT
	(SELECT SID FROM STUDENT 
	EXCEPT
	(SELECT Q2.SID
	FROM (SELECT S.SID, MJ1.MAJOR, MJ2.MAJOR 
		  FROM STUDENT S CROSS JOIN MAJOR MJ1 JOIN MAJOR MJ2 ON MJ1.MAJOR <> MJ2.MAJOR
	EXCEPT
	SELECT HM.SID, HM.MAJOR, MJ2.MAJOR FROM MAJOR MJ2 CROSS JOIN HASMAJOR HM
	EXCEPT
	SELECT HM.SID, MJ1.MAJOR, HM.MAJOR FROM MAJOR MJ1 CROSS JOIN HASMAJOR HM)
	 Q2));

-- 3 intersect -> except


WITH STUDENT AS (SELECT S.SID FROM STUDENT S)
SELECT SID FROM (
	SELECT S.SID, MJ.MAJOR FROM STUDENT S CROSS JOIN MAJOR MJ
	
	EXCEPT
	
	SELECT S.SID, MJ.MAJOR 
	FROM STUDENT S NATURAL JOIN HASMAJOR HM
	NATURAL JOIN MAJOR MJ) Q
	
	EXCEPT
	
	(SELECT Q2.SID
	FROM (SELECT SID, MJ1.MAJOR, MJ2.MAJOR 
		  FROM STUDENT CROSS JOIN MAJOR MJ1 
	JOIN MAJOR MJ2 ON MJ1.MAJOR <> MJ2.MAJOR
	
	EXCEPT
	SELECT HM.SID, HM.MAJOR, MJ2.MAJOR 
		  FROM MAJOR MJ2 CROSS JOIN HASMAJOR HM
		  
	EXCEPT
		  
	SELECT HM.SID, MJ1.MAJOR, HM.MAJOR 
		  FROM MAJOR MJ1 CROSS JOIN HASMAJOR HM)
	 Q2);



\qecho 'Problem 8'

-- Consider the query ``Find the bno and title of each book that (1) is
-- bought by a student who is born before 2000 and that (2) does not cite
-- any book with title Databases."  A possible way to write this query in
-- Pure SQL is

-- A possible way to write this query in Pure SQL is

select b.bno, b.title
from   book b
where  exists (select 1
               from   buys t, student s
               where  t.bno = b.bno and t.sid = s.sid and s.birthYear < 2000) and
       b.bno not in (select c.bno1
                     from   cites c
                     where  exists (select 1
                                    from   book b1
                                    where  c.bno2 = b1.bno and b1.title = 'Databases'));


\qecho 'Problem 8.a'

-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.


-- 1

SELECT Q1.BNO, Q1.TITLE FROM  (
	SELECT B.BNO, B.TITLE 
	FROM BOOK B 
	WHERE EXISTS
	(SELECT 1 
	 FROM BUYS T, STUDENT S 
	WHERE T.BNO = B.BNO AND T.SID = S.SID AND S.BIRTHYEAR < 2000)
	EXCEPT
	SELECT B.BNO, B.TITLE FROM BOOK B WHERE
	B.BNO IN (SELECT C.BNO1 FROM   CITES C
				WHERE  EXISTS (SELECT 1 FROM BOOK BK1
				WHERE  C.BNO2 = BK1.BNO AND BK1.TITLE = 'Databases'))

                     
) Q1 ORDER BY 1;

-- 2

SELECT Q1.BNO, Q1.TITLE FROM 
(
	(SELECT B.BNO, B.TITLE 
	 FROM BOOK B ,BUYS T, STUDENT S 
		WHERE B.BNO = T.BNO AND T.SID = S.SID AND S.BIRTHYEAR < 2000)
		EXCEPT
		SELECT B.BNO, B.TITLE 
		FROM BOOK B WHERE
		B.BNO IN (SELECT C.BNO1 
				  FROM CITES C, BOOK BK
		WHERE C.BNO2 = BK.BNO AND BK.TITLE = 'Databases')
)Q1 ORDER BY 1;

--3

SELECT Q1.BNO, Q1.TITLE FROM 
(
	(SELECT B.BNO, B.TITLE FROM BOOK B ,BUYS T, STUDENT S 
		WHERE   B.BNO =T.BNO AND T.SID = S.SID AND S.BIRTHYEAR < 2000)
		EXCEPT
		(SELECT B.BNO, B.TITLE FROM BOOK B, CITES C, BOOK BK
		WHERE B.BNO = C.BNO1 AND C.BNO2 = BK.BNO AND BK.TITLE = 'Databases')
)Q1 ORDER BY 1;

--4

SELECT Q1.BNO, Q1.TITLE FROM 
(
	(SELECT B.BNO, B.TITLE 
 	 FROM BOOK B NATURAL JOIN 
		BUYS T JOIN (SELECT * 
					 FROM STUDENT WHERE BIRTHYEAR < 2000) S ON T.SID = S.SID)
		EXCEPT
		(SELECT B.BNO, B.TITLE 
		 FROM BOOK B, CITES C, BOOK BK
		WHERE B.BNO = C.BNO1 AND C.BNO2 = BK.BNO AND BK.TITLE = 'Databases')
)Q1 ORDER BY 1;

-- 5
SELECT Q1.BNO, Q1.TITLE FROM 
(
	(SELECT B.BNO, B.TITLE FROM BOOK B NATURAL JOIN 
	BUYS T JOIN (SELECT * FROM STUDENT 
				 WHERE BIRTHYEAR < 2000) S ON T.SID = S.SID)
	EXCEPT
	(SELECT B.BNO, B.TITLE 
	 FROM BOOK B JOIN CITES C ON B.BNO = C.BNO1
	JOIN (SELECT * FROM BOOK WHERE TITLE = 'Databases') BK ON C.BNO2 = BK.BNO)
)Q1 ORDER BY 1;


\qecho 'Problem 8.b'

-- While staying in RA SQL, and starting from the RA SQL query obtained
-- in Problem 8.a, produce an equivalent optimized RA SQL.
-- Show the optimization steps you used to obtain your solutions.  In
-- particular, specify the rewrite rules that you used.

--1 
WITH Q2 AS (SELECT B.BNO, B.TITLE FROM BOOK B NATURAL JOIN 
BUYS T JOIN 
			(SELECT * FROM STUDENT WHERE BIRTHYEAR < 2000) SB ON T.SID = SB.SID)
SELECT Q1.BNO,Q1.TITLE FROM 
(
	(SELECT Q2.* FROM Q2 Q2)
EXCEPT
(SELECT B.BNO, B.TITLE FROM BOOK B JOIN CITES C ON B.BNO = C.BNO1
JOIN (SELECT * FROM BOOK WHERE TITLE = 'DATABASES') BK ON C.BNO2 = BK.BNO)
) Q1 ORDER BY 1;


--2
WITH Q2 AS (SELECT B.BNO, B.TITLE FROM BOOK B NATURAL JOIN 
BUYS T JOIN 
			(SELECT * FROM STUDENT WHERE BIRTHYEAR < 2000) SB ON T.SID = SB.SID), Q3 AS (SELECT B.BNO, B.TITLE FROM BOOK B JOIN CITES C ON B.BNO = C.BNO1
JOIN (SELECT * FROM BOOK WHERE TITLE = 'DATABASES') BK ON C.BNO2 = BK.BNO)

SELECT Q1.BNO,Q1.TITLE FROM 
(
	(SELECT Q2.* FROM Q2  Q2)
	EXCEPT
	(SELECT Q3.* FROM Q3 Q3)
) Q1 ORDER BY 1;

\qecho 'Problem 9'

-- Consider the query ``Find the sid of each student who bought
-- at least one book that cost at most 30 and such that each book
-- bought by that student that cost at most 30 is a book that was also
-- bought by each student who both majors in CS and in DataScience."

-- A possible way to write this query in Pure SQL using temporary
-- views is

with   buys30 as (select t.sid, t.bno from buys t where price <= 30),
       student as (select s.sid, s.sname 
                   from   student s 
                   where  s.sid in (select t.sid from buys30 t)),
       bookCSDataScience as (select t.bno
                             from   buys t 
                             where  t.sid in (select hm.sid 
                                              from   hasMajor hm
                                              where  hm.major = 'CS'
                                              intersect
                                              select hm.sid 
                                              from   hasMajor hm
                                              where  major = 'DataScience'))
select s.sid, s.sname
from   student s
where  not exists (select 1
                   from   buys30 t
                   where  t.sid = s.sid and
                          t.bno not in (select b.bno from bookCSDataScience b));



\qecho 'Problem 9.a'

-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.

WITH B30 AS (SELECT T.SID, T.BNO
FROM BUYS T WHERE PRICE <= 30), STUDENT AS (SELECT DISTINCT S.SID,
S.SNAME FROM STUDENT S NATURAL JOIN B30 T),
BOOKCDS AS (SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'CS')HM 
ON HM.SID = T.SID INTERSECT SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM 
				  WHERE HM.MAJOR = 'DataScience')HM 
			ON HM.SID = T.SID)

SELECT SID, SNAME FROM STUDENT
EXCEPT
(SELECT R.* FROM (SELECT S.* FROM STUDENT S
NATURAL JOIN B30 T
CROSS JOIN BOOKCDS B) R
EXCEPT SELECT U.* FROM
(SELECT S.* FROM STUDENT S
NATURAL JOIN B30 T
JOIN BOOKCDS B ON B.BNO <> T.BNO) U);

-- 2

WITH B30 AS (SELECT T.SID, T.BNO
FROM BUYS T WHERE PRICE <= 30),
STUDENT AS 
	(SELECT DISTINCT S.SID,
	S.SNAME FROM STUDENT S NATURAL JOIN B30 T),
BOOKCDS AS (SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'CS')HM 
ON HM.SID = T.SID INTERSECT SELECT T.BNO
FROM BUYS T JOIN 
			(SELECT HM.*
			FROM HASMAJOR HM WHERE HM.MAJOR = 'DataScience')HM
ON HM.SID = T.SID)

SELECT SID, SNAME FROM STUDENT

EXCEPT
(SELECT R.* FROM (SELECT S.* FROM STUDENT S
NATURAL JOIN B30 T
CROSS JOIN BOOKCDS B) R
EXCEPT 
	(SELECT S.* FROM STUDENT S
	NATURAL JOIN B30 T
JOIN BOOKCDS B ON B.BNO <> T.BNO));

--3
WITH B30 AS (SELECT T.SID, T.BNO
FROM BUYS T WHERE PRICE <= 30),
STUDENT AS (SELECT DISTINCT S.SID,
	S.SNAME FROM STUDENT S NATURAL JOIN B30 T),
	BOOKCDS AS (SELECT T.BNO
	FROM BUYS T JOIN (SELECT HM.*
	FROM HASMAJOR HM WHERE HM.MAJOR = 'CS')HM 
	ON HM.SID = T.SID 
				INTERSECT
	SELECT T.BNO
	FROM BUYS T JOIN (SELECT HM.*
	FROM HASMAJOR HM WHERE HM.MAJOR = 'DataScience')HM
	ON HM.SID = T.SID)

SELECT SID, SNAME FROM STUDENT

EXCEPT

(SELECT S.* FROM STUDENT S
	NATURAL JOIN B30 T
	CROSS JOIN BOOKCDS B

 EXCEPT 
 
(SELECT S.* FROM STUDENT S
NATURAL JOIN B30 T
JOIN BOOKCDS B ON B.BNO <> T.BNO));

-- 4


WITH B30 AS (SELECT T.SID, T.BNO
FROM BUYS T WHERE PRICE <= 30),
STUDENT AS 
(SELECT DISTINCT S.SID,
S.SNAME FROM STUDENT S NATURAL JOIN B30 T),
BOOKCDS AS (SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM 
WHERE HM.MAJOR = 'CS')HM 
ON HM.SID = T.SID INTERSECT SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'DataScience')HM
ON HM.SID = T.SID)

SELECT SID, SNAME FROM STUDENT

EXCEPT

(SELECT SID,SNAME FROM STUDENT S
 
NATURAL JOIN B30 T
CROSS JOIN BOOKCDS B
EXCEPT 
(SELECT SID,SNAME FROM STUDENT S
NATURAL JOIN B30 T
JOIN BOOKCDS B ON B.BNO <> T.BNO));


\qecho 'Problem 9.b'

-- While staying in RA SQL, and starting from the RA SQL query obtained
-- in Problem 9.a, produce an equivalent optimized RA SQL.
-- Show the optimization steps you used to obtain your solutions.  In
-- particular, specify the rewrite rules that you used.


WITH B30 AS
	(SELECT T.SID,
			T.BNO
		FROM BUYS T
		WHERE PRICE <= 30),
	STUDENT AS
	(SELECT DISTINCT S.SID,
			S.SNAME
		FROM STUDENT S
		NATURAL JOIN B30 T),
	BOOKCSDATASCIENCE AS
	(SELECT T.BNO
		FROM BUYS T
		JOIN
			(SELECT HM.*
				FROM HASMAJOR HM
				WHERE HM.MAJOR = 'CS')HM ON HM.SID = T.SID 
	 INTERSECT 
	 SELECT T.BNO
		FROM BUYS T
		JOIN
			(SELECT HM.*
				FROM HASMAJOR HM
				WHERE HM.MAJOR = 'DataScience')HM ON HM.SID = T.SID)
SELECT SID,
	SNAME
FROM STUDENT
EXCEPT
	(SELECT R.*
		FROM
			(SELECT S.*
				FROM STUDENT S
				NATURAL JOIN B30 T
				JOIN BOOKCSDATASCIENCE B ON B.BNO = T.BNO) R
		EXCEPT SELECT U.*
		FROM
			(SELECT S.*
				FROM STUDENT S
				NATURAL JOIN B30 T
				JOIN BOOKCSDATASCIENCE B ON B.BNO <> T.BNO) U);


--2
WITH BUYS30 AS
	(SELECT T.SID,
			T.BNO
		FROM BUYS T
		WHERE PRICE <= 30),
	STUDENT AS
	(SELECT DISTINCT S.SID,
			S.SNAME
		FROM STUDENT S
		NATURAL JOIN BUYS30 T),
	BOOKCSDATASCIENCE AS
	(SELECT T.BNO
		FROM BUYS T
		JOIN
			(SELECT HM.*
				FROM HASMAJOR HM
				WHERE HM.MAJOR = 'CS')HM ON HM.SID = T.SID INTERSECT SELECT T.BNO
		FROM BUYS T
		JOIN
			(SELECT HM.*
				FROM HASMAJOR HM
				WHERE HM.MAJOR = 'DataScience')HM ON HM.SID = T.SID)
SELECT SID,
	SNAME
FROM STUDENT
EXCEPT
	(SELECT R.*
		FROM
			(SELECT S.*
				FROM STUDENT S
				NATURAL JOIN BUYS30 T
				JOIN BOOKCSDATASCIENCE B ON B.BNO = T.BNO) R
		EXCEPT SELECT U.*
		FROM
			(SELECT S.*
				FROM STUDENT S
				NATURAL JOIN BUYS30 T
				JOIN BOOKCSDATASCIENCE B ON B.BNO <> T.BNO) U);

-- resolving projection U
 WITH BUYS30 AS
	(SELECT T.SID,
			T.BNO
		FROM BUYS T
		WHERE PRICE <= 30),
	STUDENT AS
	(SELECT DISTINCT S.SID,
			S.SNAME
		FROM STUDENT S
		NATURAL JOIN BUYS30 T),
	BOOKCSDATASCIENCE AS
	(SELECT T.BNO
		FROM BUYS T
		JOIN
			(SELECT HM.*
				FROM HASMAJOR HM
				WHERE HM.MAJOR = 'CS')HM ON HM.SID = T.SID INTERSECT SELECT T.BNO
		FROM BUYS T
		JOIN
			(SELECT HM.*
				FROM HASMAJOR HM
				WHERE HM.MAJOR = 'DataScience')HM ON HM.SID = T.SID)
SELECT SID,
	SNAME
FROM STUDENT
EXCEPT
	(SELECT R.*
		FROM
			(SELECT S.*
				FROM STUDENT S
				NATURAL JOIN BUYS30 T
				JOIN BOOKCSDATASCIENCE B ON B.BNO = T.BNO) R
		EXCEPT
			(SELECT S.*
				FROM STUDENT S
				NATURAL JOIN BUYS30 T

				JOIN BOOKCSDATASCIENCE B ON B.BNO <> T.BNO));

-- resolving projection R
 WITH BUYS30 AS
	(SELECT T.SID,
			T.BNO
		FROM BUYS T
		WHERE PRICE <= 30),
	STUDENT AS
	(SELECT DISTINCT S.SID,
			S.SNAME
		FROM STUDENT S
		NATURAL JOIN BUYS30 T),
	BOOKCSDATASCIENCE AS
	(SELECT T.BNO
		FROM BUYS T
		JOIN
			(SELECT HM.*
				FROM HASMAJOR HM
				WHERE HM.MAJOR = 'CS')HM ON HM.SID = T.SID INTERSECT SELECT T.BNO
		FROM BUYS T
		JOIN
			(SELECT HM.*
				FROM HASMAJOR HM
				WHERE HM.MAJOR = 'DataScience')HM ON HM.SID = T.SID)
SELECT SID,
	SNAME
FROM STUDENT
EXCEPT
	(SELECT S.*
		FROM STUDENT S
		NATURAL JOIN BUYS30 T
		JOIN BOOKCSDATASCIENCE B ON B.BNO = T.BNO
		EXCEPT
			(SELECT S.*
				FROM STUDENT S
				NATURAL JOIN BUYS30 T
				JOIN BOOKCSDATASCIENCE B ON B.BNO <> T.BNO));

-- projection down in main query
 WITH BUYS30 AS
	(SELECT T.SID,
			T.BNO
		FROM BUYS T
		WHERE PRICE <= 30),
	STUDENT AS
	(SELECT DISTINCT S.SID,
			S.SNAME
		FROM STUDENT S
		NATURAL JOIN BUYS30 T),
	BOOKCSDATASCIENCE AS
	(SELECT T.BNO
		FROM BUYS T
		JOIN
			(SELECT HM.*
				FROM HASMAJOR HM
				WHERE HM.MAJOR = 'CS')HM ON HM.SID = T.SID INTERSECT SELECT T.BNO
		FROM BUYS T
		JOIN
			(SELECT HM.*
				FROM HASMAJOR HM
				WHERE HM.MAJOR = 'DataScience')HM ON HM.SID = T.SID)
SELECT SID,
	SNAME
FROM STUDENT
EXCEPT
	(SELECT SID,
			SNAME
		FROM STUDENT S
		NATURAL JOIN BUYS30 T
		JOIN BOOKCSDATASCIENCE B ON B.BNO = T.BNO
		EXCEPT
			(SELECT SID,
					SNAME
				FROM STUDENT S
				NATURAL JOIN BUYS30 T
				JOIN BOOKCSDATASCIENCE B ON B.BNO <> T.BNO));

 -- more projection down
 WITH BUYS30 AS
	(SELECT T.SID,
			T.BNO
		FROM BUYS T
		WHERE PRICE <= 30),
	STUDENT AS
	(SELECT DISTINCT S.SID,
			S.SNAME
		FROM STUDENT S
		NATURAL JOIN BUYS30 T),
	BOOKCSDATASCIENCE AS
	(SELECT T.BNO
		FROM BUYS T
		Natural JOIN
			(SELECT HM.sid
				FROM HASMAJOR HM
				WHERE HM.MAJOR = 'CS')HM
	   INTERSECT 
	   SELECT T.BNO
		FROM BUYS T
		Natural JOIN
			(SELECT HM.sid
				FROM HASMAJOR HM
				WHERE HM.MAJOR = 'DataScience')HM)
SELECT SID,
	SNAME
FROM STUDENT
EXCEPT
	(SELECT SID,
			SNAME
		FROM STUDENT S
		NATURAL JOIN BUYS30 T
		JOIN BOOKCSDATASCIENCE B ON B.BNO = T.BNO
		EXCEPT
			(SELECT SID,
					SNAME
				FROM STUDENT S
				NATURAL JOIN BUYS30 T
				JOIN BOOKCSDATASCIENCE B ON B.BNO <> T.BNO));


\qecho 'Problem 10'

-- Consider the following Pure SQL query.

select b.bno, not exists (select 1
                          from    cites c1, cites c2
                          where   c1.bno1 =  b.bno and c2.bno1 = b.bno and 
                                  c1.bno2 <> c2.bno2) as value
from    book b order by 1,2;


\qecho 'Problem 10.a'

-- This query returns the pair (b,t) if b is the bno of a book that cites
-- fewer than 2 books and returns the pair (p,f) otherwise.

-- Using the insights gained from Problem 2, translate this Pure SQL
-- query to an equivalent RA SQL query.   

--1

SELECT B.BNO, Q.BOOLQ 
FROM BOOK B, (SELECT FALSE AS BOOLQ) Q,
CITES C1, CITES C2 
WHERE C1.BNO1 = B.BNO AND C2.BNO1 = B.BNO
AND C1.BNO2 <> C2.BNO2

UNION

(SELECT B.BNO, Q.BOOLQ FROM BOOK B, (SELECT TRUE AS BOOLQ) Q
 
EXCEPT
 
SELECT B.BNO,Q.BOOLQ FROM BOOK B, (SELECT TRUE AS BOOLQ) Q,
CITES C1, CITES C2 WHERE C1.BNO1 = B.BNO AND C2.BNO1 = B.BNO
AND C1.BNO2 <> C2.BNO2) 
ORDER BY 1,2;


--2 


SELECT B.BNO, Q.BOOLQ FROM (SELECT FALSE AS BOOLQ) Q
CROSS JOIN BOOK B
JOIN CITES C1 ON C1.BNO1 = B.BNO JOIN CITES C2 ON C2.BNO1 = B.BNO
AND C1.BNO2 <> C2.BNO2 

UNION

(SELECT B.BNO, Q.BOOLQ FROM BOOK B, (SELECT TRUE AS BOOLQ) Q
EXCEPT
SELECT B.BNO, Q.BOOLQ FROM (SELECT TRUE AS BOOLQ) Q
 CROSS JOIN
BOOK B JOIN CITES C1 ON C1.BNO1 = B.BNO JOIN CITES C2 ON C2.BNO1 = B.BNO
AND C1.BNO2 <> C2.BNO2) ORDER BY 1,2;

\qecho 'Problem 10.b'

-- While staying in RA SQL, and starting from the RA SQL query obtained
-- in Problem 9.a, produce an equivalent optimized RA SQL.
-- Show the optimization steps you used to obtain your solutions.  In
-- particular, specify the rewrite rules that you used.p

-- 1


WITH BOOK AS (SELECT BNO FROM BOOK)
SELECT B.BNO, Q.BOOLQ FROM 
(SELECT FALSE AS BOOLQ) Q 
CROSS JOIN BOOK B
JOIN CITES C1 ON C1.BNO1 = B.BNO JOIN CITES C2 ON C2.BNO1 = B.BNO
AND C1.BNO2 <> C2.BNO2 

UNION

(SELECT B.BNO, Q.BOOLQ FROM BOOK B, (SELECT TRUE AS BOOLQ) Q
 
EXCEPT
 
SELECT B.BNO, Q.BOOLQ FROM (SELECT TRUE AS BOOLQ) Q
 CROSS JOIN
BOOK B JOIN CITES C1 ON C1.BNO1 = B.BNO 
 JOIN CITES C2 ON C2.BNO1 = B.BNO
AND C1.BNO2 <> C2.BNO2) ORDER BY 1,2;

-- 2

WITH BOOK AS (SELECT BNO FROM BOOK)
SELECT Q1.BNO1, Q.BOOLQ 
FROM (SELECT FALSE AS BOOLQ) Q 
CROSS JOIN (SELECT C1.BNO1 FROM CITES C1 JOIN CITES C2 ON 
(C1.BNO1 = C2.BNO1 AND C1.BNO2 <> C2.BNO2)) Q1 

UNION

(SELECT B.BNO, Q.BOOLQ FROM BOOK B, (SELECT TRUE AS BOOLQ) Q

EXCEPT

SELECT Q1.BNO1,Q.BOOLQ FROM (SELECT TRUE AS BOOLQ)  Q
CROSS JOIN (SELECT C1.BNO1 FROM CITES C1 JOIN CITES C2 ON
(C1.BNO1 = C2.BNO1 AND C1.BNO2 <> C2.BNO2))
 Q1) 
 ORDER BY 1,2;


-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE dirkvg;



-- collaborated with akshat arvind and renuka srishti


