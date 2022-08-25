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

-- start with inner query
-- Translating '=some' in exists

SELECT B.BNO,B.TITLE FROM BOOK B
WHERE B.BNO in (SELECT T.BNO FROM BUYS T
WHERE T.PRICE < 32 AND EXISTS
(SELECT HM.SID FROM HASMAJOR HM
WHERE HM.MAJOR = 'CS'
AND T.SID = HM.SID));

-- Translating 'in' to exists

SELECT B.BNO, B.TITLE FROM BOOK B
WHERE EXISTS (SELECT T.BNO
FROM BUYS T WHERE T.PRICE < 32
AND T.BNO = B.BNO AND EXISTS
(SELECT HM.SID FROM HASMAJOR HM
WHERE HM.MAJOR = 'CS' AND T.SID = HM.SID));

-- Start removing exists, again start with inner query first

SELECT B.BNO, B.TITLE FROM BOOK B
WHERE EXISTS (SELECT T.BNO, HM.SID
FROM BUYS T, HASMAJOR HM
WHERE T.PRICE < 32 AND T.BNO = B.BNO
AND HM.MAJOR = 'CS' AND T.SID = HM.SID);

-- remove outer exists

SELECT DISTINCT B.BNO, B.TITLE FROM BOOK B,
BUYS T, HASMAJOR HM WHERE T.PRICE < 32
AND T.BNO = B.BNO AND HM.MAJOR = 'CS'
AND T.SID = HM.SID;

-- replace comma with join

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

-- Push selections over JOINS and PROJECTIONS

select distinct b.bno, b.title from Book b
JOIN (select t.* from Buys t where t.price < 32)t 
on (t.bno = b.bno)
JOIN (select hm.* from hasmajor hm where hm.major = 'CS') hm
on (hm.sid = t.sid);

-- Using only the relevant projections

select distinct b.bno, b.title from Book b
JOIN (select t.bno, t.sid from Buys t where t.price < 32)t 
on (t.bno = b.bno)
JOIN (select hm.sid from hasmajor hm where hm.major = 'CS') hm
on (hm.sid = t.sid);

-- ADD semi join





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

-- STEP 1 : REPLACING "AND" BY INTERSECTION

select p.sid from (select s.* from Student s where exists
(select 1 from major m where (s.sid,m.major) not in (select hm.sid,hm.major
from hasmajor hm))
intersect
select s.* from student s where not exists(select 1
                   from   major m1, major m2
                   where  m1.major <> m2.major and
                          (s.sid, m1.major) not in (select hm.sid, hm.major 
                                                    from   hasMajor hm) and
                          (s.sid, m2.major) not in (select hm.sid, hm.major 
                                                    from   hasMajor hm))) p;

-- STEP 2: TRANSLATING THE SET PREDICATES EXISTS AND NOT EXISTS

-- NEED CHECK

select p.sid from (
(select s.* from Student s, hasmajor m where (s.sid,m.major) 
not in (select hm.sid,hm.major
from hasmajor hm))
intersect
(select s.* from student s except select s.* from student s,
major m1, major m2
where  m1.major <> m2.major and
(s.sid, m1.major) not in (select hm.sid, hm.major 
from   hasMajor hm) and
(s.sid, m2.major) not in (select hm.sid, hm.major 
from   hasMajor hm)))p;

-- STEP 3: TRANSLATING THE FIRST NOT IN USING EXCEPT

select p.sid from ((select p1.sid, p1.sname, p1.birthyear from 
(select s.*, m.* from student s, major m
except
select s.*, m.* from student s, hasmajor hm, major m
where s.sid = hm.sid and m.major = hm.major)p1)
intersect
(select s.* from student s
except
select s.* from student s, major m1, major m2
where m1.major <> m2.major and (s.sid, m1.major)not in (select hm.sid, hm.major 
from   hasMajor hm) and
(s.sid, m2.major) not in (select hm.sid, hm.major 
from   hasMajor hm)))p;

-- STEP 4: TRANSLATING THE TWO NOT INS USING EXCEPT
select p.sid from ((select p1.sid, p1.sname, p1.birthyear from 
(select s.*, m.* from student s, major m
except
select s.*, m.* from student s, hasmajor hm, major m
where s.sid = hm.sid and m.major = hm.major)p1)
intersect
(select s.* from student s
except
(select p2.sid, p2.sname, p2.birthyear
from (select s.*, m1.*, m2.* from student s, major m1, major m2
where m1.major <> m2.major
except
select s.*, m1.*, m2.* from student s,
major m1, major m2, hasmajor hm where s.sid = hm.sid
and m1.major = hm.major
except
select s.*, m1.*, m2.* from student s,
major m1, major m2, hasmajor hm where s.sid = hm.sid
and m2.major = hm.major)p2)))p;

--STEP 5: USING JOINS
select p.sid from ((select p1.sid, p1.sname, p1.birthyear from 
(select s.*, m.* from student s CROSS JOIN major m
except
select s.*, m.* from student s JOIN hasmajor hm ON s.sid = hm.sid
JOIN major m ON m.major = hm.major)p1)
intersect
(select s.* from student s
except
(select p2.sid, p2.sname, p2.birthyear
from (select s.*, m1.*, m2.* from student s CROSS JOIN major m1 JOIN major m2
ON m1.major <> m2.major
except
select s.*, m1.*, m2.* from major m2 CROSS JOIN student s
JOIN hasmajor hm ON s.sid = hm.sid JOIN major m1 ON m1.major = hm.major
except
select s.*, m1.*, m2.* from major m1 CROSS JOIN
student s JOIN hasmajor hm ON s.sid = hm.sid JOIN major m2
ON m2.major = hm.major)p2)))p;


\qecho 'Problem 7.b'

-- While staying in RA SQL, and starting from the RA SQL query obtained
-- in Problem 7.a, produce an equivalent optimized RA SQL.
-- Show the optimization steps you used to obtain your solutions.  In
-- particular, specify the rewrite rules that you used.

-- STEP 1 : Since sname and birthyear are not used,
-- we can remove them, creating a view student with only sid.
-- Also, removing the outer-most p

with student as (select sid from student)
select sid from (select sid, major from student
CROSS JOIN major except
select s.sid, m.major from student s NATURAL JOIN hasmajor hm
NATURAL JOIN major m) p
intersect
(select s.* from student s
except
(select p2.sid
from (select s.*, m1.*, m2.* from student s CROSS JOIN major m1 JOIN major m2
ON m1.major <> m2.major
except
select s.*, m1.*, m2.* from major m2 CROSS JOIN student s
JOIN hasmajor hm ON s.sid = hm.sid JOIN major m1 ON m1.major = hm.major
except
select s.*, m1.*, m2.* from major m1 CROSS JOIN
student s JOIN hasmajor hm ON s.sid = hm.sid JOIN major m2
ON m2.major = hm.major)p2));

-- STEP 2: 

-- Eliminating student from except statemts --

with student as (select sid from student)
select sid from (select sid, major from student
CROSS JOIN major except
select s.sid, m.major from student s NATURAL JOIN hasmajor hm
NATURAL JOIN major m) p
intersect
(select sid from student 
except
(select p2.sid
from (select sid, m1.major, m2.major from student CROSS JOIN major m1 
JOIN major m2 ON m1.major <> m2.major
except
select hm.sid, hm.major, m2.major from major m2 CROSS JOIN hasmajor hm
except
select hm.sid, m1.major, hm.major from major m1 CROSS JOIN hasmajor hm)p2));

-- STEP3:

-- Converting the intersect and except into just except

with student as (select sid from student)
select sid from (select sid, major from student
CROSS JOIN major except
select s.sid, m.major from student s NATURAL JOIN hasmajor hm
NATURAL JOIN major m) p 
except
(select p2.sid
from (select sid, m1.major, m2.major from student CROSS JOIN major m1 
JOIN major m2 ON m1.major <> m2.major
except
select hm.sid, hm.major, m2.major from major m2 CROSS JOIN hasmajor hm
except
select hm.sid, m1.major, hm.major from major m1 CROSS JOIN hasmajor hm)p2);


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

-- STEP 1: REPLACING NOT IN WITH EXCEPT

select q.bno, q.title from 
(select b.bno, b.title from Book b where exists
(select 1 from   buys t, student s 
where  t.bno = b.bno and t.sid = s.sid and s.birthYear < 2000)
except
select b.bno, b.title from Book b where
b.bno in (select c.bno1 from   cites c
where  exists (select 1 from   book b1
where  c.bno2 = b1.bno and b1.title = 'Databases')))q order by 1;

-- STEP 2: REMOVING EXISTS

select q.bno, q.title from 
((select b.bno, b.title from Book b ,buys t, student s 
where  t.bno = b.bno and t.sid = s.sid and s.birthYear < 2000)
except
select b.bno, b.title from Book b where
b.bno in (select c.bno1 from   cites c, book b1
where  c.bno2 = b1.bno and b1.title = 'Databases'))q order by 1;

-- STEP 3: RELACING IN 

select q.bno, q.title from 
((select b.bno, b.title from Book b ,buys t, student s 
where  t.bno = b.bno and t.sid = s.sid and s.birthYear < 2000)
except
(select b.bno, b.title from Book b, cites c, book b1
where b.bno = c.bno1 and c.bno2 = b1.bno and b1.title = 'Databases'))q order by 1;

-- STEP 4: INTRODUCING JOINS IN FIRST PART

select q.bno, q.title from 
((select b.bno, b.title from Book b NATURAL JOIN 
Buys t JOIN (select * from student where birthYear < 2000) s ON t.sid = s.sid)
except
(select b.bno, b.title from Book b, cites c, book b1
where b.bno = c.bno1 and c.bno2 = b1.bno and b1.title = 'Databases'))q order by 1;

-- STEP 5: INTRODUCING JOINS IN SECOND PART

select q.bno, q.title from 
((select b.bno, b.title from Book b NATURAL JOIN 
Buys t JOIN (select * from student where birthYear < 2000) s ON t.sid = s.sid)
except
(select b.bno, b.title from Book b JOIN cites c ON b.bno = c.bno1
JOIN (select * from Book where title = 'Databases') b1 ON c.bno2 = b1.bno))q order by 1;




\qecho 'Problem 8.b'

-- While staying in RA SQL, and starting from the RA SQL query obtained
-- in Problem 8.a, produce an equivalent optimized RA SQL.
-- Show the optimization steps you used to obtain your solutions.  In
-- particular, specify the rewrite rules that you used.

-- STEP 1: Creating view A to optimize first part

with A as (select b.bno, b.title from Book b NATURAL JOIN 
Buys t JOIN (select * from student where birthYear < 2000) s ON t.sid = s.sid)
select q.bno,q.title from 
((select a.* from A a)
except
(select b.bno, b.title from Book b JOIN cites c ON b.bno = c.bno1
JOIN (select * from Book where title = 'Databases') b1 ON c.bno2 = b1.bno))q order by 1;

--STEP 2: 

with A as (select b.bno, b.title from Book b NATURAL JOIN 
Buys t JOIN (select * from student where birthYear < 2000) s ON t.sid = s.sid),
B as (select b.bno, b.title from Book b JOIN cites c ON b.bno = c.bno1
JOIN (select * from Book where title = 'Databases') b1 ON c.bno2 = b1.bno)

select q.bno,q.title from 
((select a.* from A a)
except
(select b.* from B b))q order by 1;

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

-- 'in' to 'exists' translation in 'with' query
with   buys30 as (select t.sid, t.bno from buys t where price <= 30),
student as (select s.sid, s.sname from   student s 
where  exists(select t.sid from buys30 t where t.sid = s.sid)),
bookCSDataScience as (select t.bno from   buys t 
where  exists (select hm.sid from   hasMajor hm
where  hm.major = 'CS' and hm.sid = t.sid intersect
select hm.sid from   hasMajor hm
where  major = 'DataScience' and hm.sid = t.sid))

select s.sid, s.sname from   student s
where  not exists (select 1
from   buys30 t where  t.sid = s.sid and
t.bno not in (select b.bno from bookCSDataScience b));


-- exists to where clause for student query
with   buys30 as (select t.sid, t.bno from buys t where price <= 30),
student as (select distinct s.sid, s.sname 
from   student s, buys30 t where t.sid = s.sid),
bookCSDataScience as (select t.bno from   buys t 
where  exists (select hm.sid from   hasMajor hm
where  hm.major = 'CS' and hm.sid = t.sid
intersect
select hm.sid from   hasMajor hm
where  major = 'DataScience' and hm.sid = t.sid))

select s.sid, s.sname
from   student s
where  not exists (select 1
from   buys30 t
where  t.sid = s.sid and
t.bno not in (select b.bno from bookCSDataScience b));


-- resolve exists in bookCSDataScience query
with   buys30 as (select t.sid, t.bno from buys t where price <= 30),
student as (select distinct s.sid, s.sname 
from   student s, buys30 t where t.sid = s.sid),
bookCSDataScience as (select t.bno
from   buys t , hasmajor hm where  hm.major = 'CS' and hm.sid = t.sid
intersect
select t.bno from   buys t, hasMajor hm
where  major = 'DataScience' and hm.sid = t.sid)

select s.sid, s.sname
from   student s
where  not exists (select 1
from   buys30 t where  t.sid = s.sid and
t.bno not in (select b.bno from bookCSDataScience b));

-- 'not in' to 'except' in main query
with   buys30 as (select t.sid, t.bno from buys t where price <= 30),
student as (select distinct s.sid, s.sname 
from   student s, buys30 t where t.sid = s.sid),
bookCSDataScience as (select t.bno
from   buys t , hasmajor hm where  hm.major = 'CS' and hm.sid = t.sid
intersect
select t.bno from   buys t, hasMajor hm
where  major = 'DataScience' and hm.sid = t.sid)

-- 'not in' to except
select s.sid, s.sname
from   student s
where  not exists (select 1
from   buys30 t, bookCSDataScience b where  t.sid = s.sid
except
select 1 from   buys30 t, bookCSDataScience b 
where  t.sid = s.sid and b.bno <> t.bno);


-- not exists to except in outer main query

WITH BUYS30 AS (SELECT T.SID,T.BNO
FROM BUYS T WHERE PRICE <= 30),
STUDENT AS (SELECT DISTINCT S.SID,
S.SNAME FROM STUDENT S, BUYS30 T
WHERE T.SID = S.SID), BOOKCSDATASCIENCE AS
(SELECT T.BNO FROM BUYS T,HASMAJOR HM
WHERE HM.MAJOR = 'CS' AND HM.SID = T.SID INTERSECT
SELECT T.BNO FROM BUYS T, HASMAJOR HM 
WHERE MAJOR = 'DataScience' AND HM.SID = T.SID) 
                     

SELECT Q.SID, Q.SNAME
FROM (SELECT S.* FROM STUDENT S
EXCEPT SELECT S.* FROM STUDENT S
WHERE EXISTS (SELECT 1 FROM BUYS30 T,
BOOKCSDATASCIENCE B WHERE T.SID = S.SID
EXCEPT SELECT 1 FROM BUYS30 T,
BOOKCSDATASCIENCE B WHERE T.SID = S.SID
AND B.BNO <> T.BNO))Q;

-- resolve exists in main query
WITH BUYS30 AS (SELECT T.SID,
T.BNO FROM BUYS T WHERE PRICE <= 30),
STUDENT AS (SELECT DISTINCT S.SID, S.SNAME
FROM STUDENT S, BUYS30 T WHERE T.SID = S.SID),
BOOKCSDATASCIENCE AS (SELECT T.BNO
FROM BUYS T, HASMAJOR HM
WHERE HM.MAJOR = 'CS' AND HM.SID = T.SID INTERSECT
SELECT T.BNO FROM BUYS T,
HASMAJOR HM WHERE MAJOR = 'DataScience'
AND HM.SID = T.SID) 

SELECT Q.SID, Q.SNAME
FROM (SELECT S.* FROM STUDENT S
EXCEPT (SELECT S.* FROM STUDENT S,
BUYS30 T, BOOKCSDATASCIENCE B
WHERE T.SID = S.SID EXCEPT SELECT S.*
FROM STUDENT S, BUYS30 T, BOOKCSDATASCIENCE B
WHERE T.SID = S.SID AND B.BNO <> T.BNO))Q;


-- move constant condition with 'from' clause for bookCSDataScience query
WITH BUYS30 AS (SELECT T.SID, T.BNO
FROM BUYS T WHERE PRICE <= 30),
STUDENT AS (SELECT DISTINCT S.SID,
S.SNAME FROM STUDENT S, BUYS30 T
WHERE T.SID = S.SID), BOOKCSDATASCIENCE AS
(SELECT T.BNO FROM BUYS T, (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'CS')HM
WHERE HM.SID = T.SID INTERSECT SELECT T.BNO
FROM BUYS T, (SELECT HM.* FROM HASMAJOR HM
WHERE HM.MAJOR = 'DataScience')HM WHERE HM.SID = T.SID)

SELECT Q.SID, Q.SNAME
FROM (SELECT S.* FROM STUDENT S
EXCEPT (SELECT S.* FROM STUDENT S,
BUYS30 T, BOOKCSDATASCIENCE B
WHERE T.SID = S.SID EXCEPT SELECT S.*
FROM STUDENT S, BUYS30 T, BOOKCSDATASCIENCE B
WHERE T.SID = S.SID AND B.BNO <> T.BNO))Q;


-- replace comma to join
WITH BUYS30 AS (SELECT T.SID, T.BNO
FROM BUYS T WHERE PRICE <= 30),
STUDENT AS (SELECT DISTINCT S.SID,
S.SNAME FROM STUDENT S NATURAL JOIN BUYS30 T),
BOOKCSDATASCIENCE AS (SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'CS')HM 
ON HM.SID = T.SID INTERSECT SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'DataScience')HM
ON HM.SID = T.SID)

SELECT Q.SID, Q.SNAME
FROM (SELECT S.* FROM STUDENT S
EXCEPT
(SELECT R.* FROM (SELECT S.* FROM STUDENT S
NATURAL JOIN BUYS30 T
CROSS JOIN BOOKCSDATASCIENCE B) R
EXCEPT SELECT U.* FROM
(SELECT S.* FROM STUDENT S
NATURAL JOIN BUYS30 T
JOIN BOOKCSDATASCIENCE B ON B.BNO <> T.BNO) U)) Q;



\qecho 'Problem 9.b'

-- While staying in RA SQL, and starting from the RA SQL query obtained
-- in Problem 9.a, produce an equivalent optimized RA SQL.
-- Show the optimization steps you used to obtain your solutions.  In
-- particular, specify the rewrite rules that you used.

-- REMOVING OUTERMOST PROJECTION Q

WITH BUYS30 AS (SELECT T.SID, T.BNO
FROM BUYS T WHERE PRICE <= 30),
STUDENT AS (SELECT DISTINCT S.SID,
S.SNAME FROM STUDENT S NATURAL JOIN BUYS30 T),
BOOKCSDATASCIENCE AS (SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'CS')HM 
ON HM.SID = T.SID INTERSECT SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'DataScience')HM
ON HM.SID = T.SID)


SELECT SID, SNAME FROM STUDENT
EXCEPT
(SELECT R.* FROM (SELECT S.* FROM STUDENT S
NATURAL JOIN BUYS30 T
CROSS JOIN BOOKCSDATASCIENCE B) R
EXCEPT SELECT U.* FROM
(SELECT S.* FROM STUDENT S
NATURAL JOIN BUYS30 T
JOIN BOOKCSDATASCIENCE B ON B.BNO <> T.BNO) U);

-- REMOVING PROJECTION U

WITH BUYS30 AS (SELECT T.SID, T.BNO
FROM BUYS T WHERE PRICE <= 30),
STUDENT AS (SELECT DISTINCT S.SID,
S.SNAME FROM STUDENT S NATURAL JOIN BUYS30 T),
BOOKCSDATASCIENCE AS (SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'CS')HM 
ON HM.SID = T.SID INTERSECT SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'DataScience')HM
ON HM.SID = T.SID)


SELECT SID, SNAME FROM STUDENT
EXCEPT
(SELECT R.* FROM (SELECT S.* FROM STUDENT S
NATURAL JOIN BUYS30 T
CROSS JOIN BOOKCSDATASCIENCE B) R
EXCEPT 
(SELECT S.* FROM STUDENT S
NATURAL JOIN BUYS30 T
JOIN BOOKCSDATASCIENCE B ON B.BNO <> T.BNO));


-- REMOVING PROJECTION R

WITH BUYS30 AS (SELECT T.SID, T.BNO
FROM BUYS T WHERE PRICE <= 30),
STUDENT AS (SELECT DISTINCT S.SID,
S.SNAME FROM STUDENT S NATURAL JOIN BUYS30 T),
BOOKCSDATASCIENCE AS (SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'CS')HM 
ON HM.SID = T.SID INTERSECT SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'DataScience')HM
ON HM.SID = T.SID)

SELECT SID, SNAME FROM STUDENT
EXCEPT
(SELECT S.* FROM STUDENT S
NATURAL JOIN BUYS30 T
CROSS JOIN BOOKCSDATASCIENCE B
EXCEPT 
(SELECT S.* FROM STUDENT S
NATURAL JOIN BUYS30 T
JOIN BOOKCSDATASCIENCE B ON B.BNO <> T.BNO));

-- USING ONLY SID,SNAME FROM STUDENT

WITH BUYS30 AS (SELECT T.SID, T.BNO
FROM BUYS T WHERE PRICE <= 30),
STUDENT AS (SELECT DISTINCT S.SID,
S.SNAME FROM STUDENT S NATURAL JOIN BUYS30 T),
BOOKCSDATASCIENCE AS (SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'CS')HM 
ON HM.SID = T.SID INTERSECT SELECT T.BNO
FROM BUYS T JOIN (SELECT HM.*
FROM HASMAJOR HM WHERE HM.MAJOR = 'DataScience')HM
ON HM.SID = T.SID)

SELECT SID, SNAME FROM STUDENT
EXCEPT
(SELECT SID,SNAME FROM STUDENT S
NATURAL JOIN BUYS30 T
CROSS JOIN BOOKCSDATASCIENCE B
EXCEPT 
(SELECT SID,SNAME FROM STUDENT S
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

-- AS THE GIVEN STATEMENT HAS NOT EXISTS SO IT COVERS THE FALSE CASE
select b.bno, p.booleanV from Book b, (select false as booleanV)p,
cites c1, cites c2 where c1.bno1 = b.bno and c2.bno1 = b.bno
and c1.bno2 <> c2.bno2
UNION
-- FOR TRUE CASE we translate the not exists case using EXCEPT 
(select b.bno, p.booleanV from Book b, (select true as booleanV)p
except
select b.bno,p.booleanV from Book b, (select true as booleanV)p,
cites c1, cites c2 where c1.bno1 = b.bno and c2.bno1 = b.bno
and c1.bno2 <> c2.bno2) order by 1,2;


-- STEP 2: USING JOINS

select b.bno, p.booleanV from (select false as booleanV)p 
CROSS JOIN Book b
JOIN Cites c1 ON c1.bno1 = b.bno JOIN cites c2 ON c2.bno1 = b.bno
and c1.bno2 <> c2.bno2 
UNION
(select b.bno, p.booleanV from Book b, (select true as booleanV)p
except
select b.bno,p.booleanV from (select true as booleanV)p CROSS JOIN
Book b JOIN cites C1 ON c1.bno1 = b.bno JOIN cites c2 ON c2.bno1 = b.bno
and c1.bno2 <> c2.bno2) order by 1,2;



\qecho 'Problem 10.b'

-- While staying in RA SQL, and starting from the RA SQL query obtained
-- in Problem 9.a, produce an equivalent optimized RA SQL.
-- Show the optimization steps you used to obtain your solutions.  In
-- particular, specify the rewrite rules that you used.p

-- STEP1: Creating new view for Book having only bno, as per requirement.

with book as (select bno from Book)
select b.bno, p.booleanV from (select false as booleanV)p 
CROSS JOIN Book b
JOIN Cites c1 ON c1.bno1 = b.bno JOIN cites c2 ON c2.bno1 = b.bno
and c1.bno2 <> c2.bno2 
UNION
(select b.bno, p.booleanV from Book b, (select true as booleanV)p
except
select b.bno,p.booleanV from (select true as booleanV)p CROSS JOIN
Book b JOIN cites C1 ON c1.bno1 = b.bno JOIN cites c2 ON c2.bno1 = b.bno
and c1.bno2 <> c2.bno2) order by 1,2;

--STEP2: Removing Book from CROSS JOIN as the condition can be
-- satisfied using Cites c1, Cites c2.

with book as (select bno from Book)
select q.bno1, p.booleanV from (select false as booleanV)p 
CROSS JOIN (select c1.bno1 from cites c1 JOIN cites c2 ON 
(c1.bno1 = c2.bno1 and c1.bno2 <> c2.bno2))q 
UNION
(select b.bno, p.booleanV from Book b, (select true as booleanV)p
except
select q.bno1,p.booleanV from (select true as booleanV)p 
CROSS JOIN (select c1.bno1 from cites c1 JOIN cites c2 ON 
(c1.bno1 = c2.bno1 and c1.bno2 <> c2.bno2))q) order by 1,2;



-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE dirkvg;