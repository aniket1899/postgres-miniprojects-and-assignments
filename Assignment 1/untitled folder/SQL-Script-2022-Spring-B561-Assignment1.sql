-- Creating database with full name


CREATE DATABASE dirkassignment;

-- Connecting to database 
\c dirkassignment;

-- Relation schemas and instances for assignment 1

\qecho 'Problem 1'

-- Provide 4 conceptually different examples that illustrate how the
-- presence or absence of primary and foreign keys affect insert and
-- deletes in these relations.  To solve this problem, you will need to
-- experiment with the relation schemas and instances for this
-- assignment.  For example, you should consider altering primary keys
-- and foreign key constraints and then consider various sequences of
-- insert and delete operations.  You may need to change some of the
-- relation instances to observe the desired effects.  Certain inserts
-- and deletes should succeed but other should generate error
-- conditions.  (Consider the lecture notes about keys, foreign keys,
-- and inserts and deletes as a guide to solve this problem.)

-- Relation schemas and instances for assignment 1
 
CREATE TABLE Student(sid integer,
                     sname text,
                     homeCity text,
                     primary key (sid));

CREATE TABLE Department(deptName text,
                        mainOffice text,
                        primary key (deptName));

CREATE TABLE Major(major text,
                   primary key (major));


CREATE TABLE employedBy(sid integer,
                        deptName text,
                        salary integer,
                        primary key (sid),
                        foreign key (sid) references Student (sid));


CREATE TABLE departmentLocation(deptName text,
                                building text,
                                primary key (deptName, building),
                                foreign key (deptName) references Department (deptName));


CREATE TABLE studentMajor(sid integer,
                          major text,
                          primary key (sid, major),
                          foreign key (sid) references Student (sid),
                          foreign key (major) references Major (major));


CREATE TABLE hasFriend(sid1 integer,
                       sid2 integer,
                       primary key(sid1,sid2),
                       foreign key (sid1) references Student (sid),
                       foreign key (sid2) references Student (sid));


INSERT INTO Student VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'), 
     (1014,'Deepa', 'Bloomington'), 
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');


INSERT INTO Department VALUES
     ('CS', 'LuddyHall'),
     ('DataScience', 'LuddyHall'),
     ('Mathematics', 'RawlesHall'),
     ('Physics', 'SwainHall'),
     ('Biology', 'JordanHall'),
     ('Chemistry', 'ChemistryBuilding'),
     ('Astronomy', 'SwainHall');


INSERT INTO employedBy VALUES
     (1001,'CS', 65000),
     (1002,'CS', 45000),
     (1003,'DataScience', 55000),
     (1004,'DataScience', 55000),
     (1005,'Mathematics', 60000),
     (1006,'DataScience', 55000),
     (1007,'Physics', 50000),
     (1008,'DataScience', 50000),
     (1009,'CS',60000),
     (1010,'DataScience', 55000),
     (1011,'Mathematics', 70000), 
     (1012,'CS', 50000),
     (1013,'Physics', 55000),
     (1014,'CS', 50000), 
     (1015,'DataScience', 60000),
     (1016,'DataScience', 55000),
     (1017,'Physics', 60000),
     (1018,'CS', 50000),
     (1019,'Biology', 50000);

INSERT INTO departmentLocation VALUES
   ('CS', 'LindleyHall'),
   ('DataScience', 'LuddyHall'),
   ('DataScience', 'Kinsey'),
   ('DataScience', 'WellsLibrary'),
   ('Mathematics', 'RawlesHall'),
   ('Physics', 'SwainHall'),
   ('Physics', 'ChemistryBuilding'),
   ('Biology', 'JordanHall'),
   ('CS', 'LuddyHall'),
   ('Mathematics', 'SwainHall'),
   ('Physics', 'RawlesHall'),
   ('Biology', 'MultiDisciplinaryBuilding'),
   ('Chemistry', 'ChemistryBuilding');

INSERT INTO Major VALUES
   ('CS'),
   ('DataScience'),
   ('Physics'),
   ('Chemistry'),
   ('Biology');

INSERT INTO studentMajor VALUES
 (1001,'CS'),
 (1001,'DataScience'),
 (1002,'CS'),
 (1002,'DataScience'),
 (1004,'DataScience'),
 (1004,'CS'),
 (1005,'DataScience'),
 (1005,'CS'),
 (1005,'Physics'),
 (1006,'CS'),
 (1006,'Chemistry'),
 (1007,'Chemistry'),
 (1007,'CS'),
 (1009,'Chemistry'),
 (1009,'Physics'),
 (1010,'Physics'),
 (1011,'Physics'),
 (1011,'Chemistry'),
 (1011,'DataScience'),
 (1011,'CS'),
 (1012,'DataScience'),
 (1012,'Chemistry'),
 (1012,'CS'),
 (1013,'CS'),
 (1013,'DataScience'),
 (1013,'Chemistry'),
 (1013,'Physics'),
 (1014,'Chemistry'),
 (1014,'DataScience'),
 (1014,'Physics'),
 (1015,'CS'),
 (1015,'DataScience'),
 (1016,'Chemistry'),
 (1016,'DataScience'),
 (1017,'Physics'),
 (1017,'CS'),
 (1018,'DataScience'),
 (1019,'Physics');

INSERT INTO hasFriend VALUES
 (1001,1008),
 (1001,1012),
 (1001,1014),
 (1001,1019),
 (1002,1001),
 (1002,1002),
 (1002,1011),
 (1002,1014),
 (1002,1015),
 (1003,1004),
 (1004,1002),
 (1004,1003),
 (1004,1012),
 (1004,1013),
 (1004,1014),
 (1004,1019),
 (1005,1015),
 (1006,1003),
 (1006,1004),
 (1006,1006),
 (1007,1008),
 (1007,1013),
 (1007,1016),
 (1007,1017),
 (1008,1001),
 (1008,1007),
 (1008,1015),
 (1008,1019),
 (1009,1001),
 (1009,1005),
 (1009,1013),
 (1010,1008),
 (1010,1013),
 (1010,1014),
 (1011,1005),
 (1011,1009),
 (1011,1010),
 (1011,1011),
 (1012,1011),
 (1013,1002),
 (1013,1007),
 (1013,1018),
 (1014,1005),
 (1014,1006),
 (1014,1012),
 (1014,1017),
 (1015,1002),
 (1015,1003),
 (1015,1005),
 (1015,1011),
 (1015,1015),
 (1015,1018),
 (1016,1004),
 (1016,1006),
 (1016,1015),
 (1017,1013),
 (1017,1014),
 (1017,1019),
 (1018,1004),
 (1018,1007),
 (1018,1009),
 (1018,1010),
 (1018,1013),
 (1019,1001),
 (1019,1006),
 (1019,1008),
 (1019,1013);


-- Problem 1

-- Provide 4 conceptually different examples that illustrate how the
-- presence or absence of primary and foreign keys affect insert and
-- deletes in these relations.  To solve this problem, you will need to
-- experiment with the relation schemas and instances for this
-- assignment.  For example, you should consider altering primary keys
-- and foreign key constraints and then consider various sequences of
-- insert and delete operations.  You may need to change some of the
-- relation instances to observe the desired effects.  Certain inserts
-- and deletes should succeed but other should generate error
-- conditions.  (Consider the lecture notes about keys, foreign keys,
-- and inserts and deletes as a guide to solve this problem.)


\qecho 'Problem 1 conceptual example 1'
-- 1.a
-- Inserting an alredy existing major 'Chemistry' into table major
-- as major is the primary key, it will give an error as it already exists.
INSERT INTO major VALUES ('Chemistry');
/*
ERROR:  duplicate key value violates unique constraint "major_pkey"
DETAIL:  Key (major)=(Chemistry) already exists.
*/

-- 1.b
-- Inserting into hasFriend where sid2 = 1020 foreign key does not exist in the master tabel Student
-- Since sid = 1020 does not exist in Student hence cannot be added to hasFriend as sid2
-- refers sid in Student but cannot refer it. 
INSERT INTO hasFriend VALUES (1001, 1020);
/* 
asfriend_sid2_fkey"
DETAIL:  Key (sid2)=(1020) is not present in table "student".
*/


-- 1.c
-- Here the deptname is a primary and since 'Biology' is being referenced by tables
-- 		departmentLocation and employedBy as foreign keys, this deletion cannot be completed.
DELETE FROM Department WHERE deptname = 'Biology';
/*
DETAIL:  Key (deptname)=(Biology) is still referenced from table "departmentlocation".
*/

-- 1.d
-- Deleting an instance which is a foreign key refered from another table.
-- deptname 'Biology' is refered from table Department
DELETE FROM employedBy WHERE deptname = 'Biology';
/*
ERROR:  update or delete on table "department" violates foreign key constraint "departmentlocation_deptname_fkey" on table "departmentlocation"
DETAIL:  Key (deptname)=(Biology) is still referenced from table "departmentlocation".
*/

\qecho 'Problem 2'
-- Find the sid, sname of each student who (a) has home homeCity Bloomington, (b)
-- works for a department where he or she earns a salary that is higher than
-- 20000, and (c) has at least one friend.

SELECT s.sid AS sid, s.sname AS sname FROM Student s, employedBy eby
WHERE s.sid = eby.sid
AND s.homeCity = 'Bloomington' 
AND eby.salary > 20000
AND ( EXISTS (SELECT hf.sid1 FROM hasFriend hf WHERE hf.sid1 = s.sid AND hf.sid1 <> hf.sid2)
	OR EXISTS (SELECT hf.sid2 FROM hasFriend hf WHERE hf.sid2 = s.sid AND hf.sid1 <> hf.sid2));

/*
 sid  | sname 
------+-------
 1008 | Emma
 1009 | Hasan
 1014 | Deepa
 1018 | Arif
(4 rows)

*/
\qecho 'Problem 3'
-- Find the pairs $(d_1, d_2)$ of names of different departments whose main offices
-- are located in the same building.

SELECT d1.deptname AS d1, d2.deptname AS d2 FROM department d1, department d2
WHERE d1.mainoffice = d2.mainoffice
AND d1.deptname <> d2.deptname;

/*
     d1      |     d2      
-------------+-------------
 CS          | DataScience
 DataScience | CS
 Physics     | Astronomy
 Astronomy   | Physics
(4 rows)
*/


\qecho 'Problem 4'
-- Find the sid, sname, and salary of each student who has at least two
-- friends such that these friends have a common major but provided that
-- it is not the ‘Mathematics’ major.

SELECT DISTINCT(s.sid), s.sname FROM Student s, hasFriend h
WHERE s.sid = h.sid1
AND s.homecity NOT IN ( SELECT st.homecity FROM Student st, hasFriend hf
					  WHERE hf.sid1 = s.sid AND hf.sid2 = st.sid);

/*
 sid  | sname 
------+-------
 1005 | Megan
 1008 | Emma
 1009 | Hasan
 1010 | Linda
 1012 | Eric
 1013 | Lisa
 1014 | Deepa
 1017 | Latha
 1019 | John
(9 rows)
*/

\qecho 'Problem 5'
-- Find each major that is the major of at most 2 students.
SELECT m.major FROM major m
WHERE m.major NOT IN  (SELECT ct.major FROM (SELECT sm.major, ROW_NUMBER() OVER(PARTITION BY sm.major) AS counts FROM studentmajor sm) ct
WHERE ct.counts > 2);

/*
  major  
---------
 Biology
(1 row)
*/

\qecho 'Problem 6'
-- Find the sid and sname of each student whose home homeCity
-- different than those of his or her friends.
SELECT sub.sid, sub.sname, e.salary FROM  employedBy e,
(SELECT DISTINCT s.sid, s.sname FROM student s,
(SELECT h.sid1, h.sid2, s.major FROM studentmajor s, hasFriend h WHERE s.sid=h.sid2) s1,
(SELECT h.sid1, h.sid2, s.major FROM studentmajor s, hasFriend h WHERE s.sid=h.sid2) s2
WHERE s1.sid1 = s.sid AND s2.sid1 = s.sid AND s1.sid2 <> s2.sid2
AND s1.major = s2.major
AND s1.major <> 'Mathematics') sub
WHERE e.sid = sub.sid;


/*
sid  |  sname   | salary 
------+----------+--------
 1001 | Jean     |  65000
 1002 | Vidya    |  45000
 1004 | Qin      |  55000
 1006 | Ryan     |  55000
 1007 | Danielle |  50000
 1008 | Emma     |  50000
 1009 | Hasan    |  60000
 1010 | Linda    |  55000
 1011 | Nick     |  70000
 1013 | Lisa     |  55000
 1014 | Deepa    |  50000
 1015 | Chris    |  60000
 1016 | YinYue   |  55000
 1017 | Latha    |  60000
 1018 | Arif     |  50000
 1019 | John     |  50000
(16 rows)
*/

\qecho 'Problem 7'
-- Find the deptName of each department that not only employs students
-- whose home homeCity is Indianapolis.  (In other words, there exists at
-- least one student who is employed by such a department whose home homeCity
-- is not Indianapolis.)
SELECT DISTINCT sub.deptname AS deptname FROM
(SELECT e.deptname, s.homecity FROM employedBy e, Student s
WHERE s.sid=e.sid AND s.homecity <> 'Indianapolis'
EXCEPT
SELECT e.deptname, s.homecity FROM employedBy e, Student s
WHERE s.sid=e.sid AND s.homecity = 'Indianapolis') sub
ORDER BY sub.deptname;

/*
  deptname   
-------------
 Biology
 CS
 DataScience
 Mathematics
 Physics
(5 rows)
*/

\qecho 'Problem 8'
-- For each department, list its name along with the highest salary made
-- by students who are employed by it.
-- SELECT  eb.deptName, eb.salary FROM employedBy eb
-- ORDER BY eb.deptName, eb.salary DESC;

SELECT d.deptName AS deptName, e.salary AS salary 
FROM (SELECT DISTINCT(deptName) FROM Department) d, employedBy e
WHERE ROW(d.deptName, e.salary) = (SELECT eb.deptName, eb.salary FROM employedBy eb
	WHERE e.deptName = eb.deptName
	ORDER BY eb.deptName, eb.salary DESC
							 LIMIT 1 )
ORDER BY deptname;

/*
  deptname   | salary 
-------------+--------
 Biology     |  50000
 CS          |  65000
 DataScience |  60000
 Mathematics |  70000
 Physics     |  60000
(5 rows)
*/

\qecho 'Problem 9'
-- Find the sid and sname of each student $s$ who is employed by a
-- department $d$ and who has a salary that is strictly higher than the
-- salary of each of his friends who is employed by that department $d$.

SELECT s.sid, s.sname
FROM Student s, EmployedBy e
WHERE s.sid = e.sid AND e.salary > ALL
		(SELECT eb1.SALARY FROM hasFriend h,
				employedBy eb1
			WHERE h.sid1 = s.sid AND h.sid2 = eb1.sid AND eb1.deptname = e.deptname )
	AND EXISTS (SELECT * FROM hasFriend hf, employedBy eby1
			WHERE hf.sid1 = S.sid
				AND hf.SID2 = eby1.SID AND eby1.deptname = e.deptname );
				
/*
Problem 9
 sid  | sname 
------+-------
 1013 | Lisa
 1010 | Linda
 1001 | Jean
 1017 | Latha
(4 rows)
*/

\qecho 'Problem 10'

SELECT s.sid, s.sname, w.deptname, w.salary FROM Student s, employedBy w
WHERE s.sid = w.sid AND s.homecity = 'Bloomington' 
AND w.salary >= 10000 AND w.deptname <> 'Mathematics';

/*
 sid  | sname |  deptname   | salary 
------+-------+-------------+--------
 1008 | Emma  | DataScience |  50000
 1009 | Hasan | CS          |  60000
 1014 | Deepa | CS          |  50000
 1018 | Arif  | CS          |  50000
(4 rows)
*/

\qecho 'Problem 11'

SELECT s.sid, s.sname FROM Student s
WHERE
EXISTS (SELECT * FROM Department d, employedBy w 
WHERE d.deptname = w.deptname AND s.sid = w.sid AND mainoffice = 'LuddyHall' AND 
 EXISTS (SELECT * FROM hasFriend f, Student s1
WHERE f.sid1 = s.sid AND f.sid2 = s1.sid AND s1.homecity <> 'Bloomington'))
ORDER BY s.sid;


/*
 sid  | sname  
------+--------
 1001 | Jean
 1002 | Vidya
 1003 | Anna
 1004 | Qin
 1006 | Ryan
 1008 | Emma
 1009 | Hasan
 1010 | Linda
 1012 | Eric
 1014 | Deepa
 1015 | Chris
 1016 | YinYue
 1018 | Arif
(13 rows)
*/

\qecho 'Problem 12'
SELECT m.major FROM major m
WHERE NOT EXISTS (SELECT * FROM Student s, studentmajor sm 
WHERE s.sid = sm.sid AND sm.major = m.major AND s.homecity = 'Bloomington')
ORDER BY m.major;


/*
  major  
---------
 Biology
 CS
(2 rows)

*/


\qecho 'Problem 13'

SELECT s.sid, s.sname FROM Student s
WHERE
NOT EXISTS (SELECT * FROM hasFriend f WHERE f.sid2 = s.sid
AND NOT EXISTS (SELECT * FROM Student s1 	
			   WHERE f.sid1 = s1.sid AND s.homecity = s1.homecity)
		   );

/*
 sid | sname 
-----+-------
(0 rows)
*/

\qecho 'Problem 18 b.'
-- Each student is employed by a department and has at least two majors
SELECT NOT EXISTS( SELECT 1 FROM Student s 
				  WHERE NOT EXISTS (SELECT 1 
								   FROM employedBy e 
								   WHERE e.sid=s.sid 
								   AND EXISTS (SELECT 1 FROM studentmajor sm1, studentmajor sm2
											  WHERE sm1.sid=s.sid AND sm2.sid=s.sid 
											   AND sm1.major <> sm2.major
											  )));
											  
SELECT NOT EXISTS (SELECT s.sid FROM Student s 
WHERE s.sid NOT IN (
SELECT s.sid FROM studentmajor sm1, studentmajor sm2, Student s
	WHERE sm1.sid = s.sid AND sm2.sid = s.sid AND sm1.major <> sm2.major
	AND EXISTS (SELECT 1 FROM employedBy e WHERE e.sid=s.sid) ));


/*
 ?column? 
----------
 f
(1 row)
*/

\qecho 'Problem 19'
-- Each student and his or her friends work for the same department
SELECT NOT EXISTS (SELECT 1 FROM Student s
WHERE s.sid NOT IN (SELECT DISTINCT h.sid1 FROM hasFriend h, employedBy e1, employedBy e2
WHERE e1.sid = h.sid1 AND e2.sid = h.sid2
AND e1.deptname <> e2.deptname));


SELECT NOT EXISTS (SELECT 1 FROM Student s
WHERE  NOT EXISTS (SELECT 1  FROM hasFriend h, employedBy e1, employedBy e2
WHERE e1.sid = h.sid1 AND e2.sid = h.sid2 AND s.sid = h.sid1
AND e1.deptname <> e2.deptname));

/*
 ?column? 
----------
 f
(1 row)
*/
\qecho 'Problem 20'
-- Some employed student has a salary that is strictly higher than the
-- salary of each of his or her employed friends

SELECT  EXISTS (SELECT 1 FROM Student s
WHERE s.sid NOT IN (SELECT h.sid1 FROM hasFriend h, employedBy e1, employedBy e2
WHERE e1.sid = h.sid1 AND e2.sid = h.sid2
AND e1.salary <= e2.salary));

SELECT  EXISTS (SELECT 1 FROM Student s
WHERE  NOT EXISTS (SELECT 1 FROM hasFriend h, employedBy e1, employedBy e2
WHERE e1.sid = h.sid1 AND e2.sid = h.sid2 AND s.sid = h.sid1
AND e1.salary <= e2.salary));

/*
 exists 
--------
 t
(1 row)
*/

-- Connect to default database
-- \c postgres;

-- Drop database created for this assignment
-- DROP DATABASE dirkassignment;

-- I have collabored with Renuka Srishti and Akshat Arvind for this assignment.



