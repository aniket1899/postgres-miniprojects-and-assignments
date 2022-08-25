-- Script for Assignment 5

-- Creating database with full name
-- collaborated with Akshat Arvind, Renuka Srishti
CREATE DATABASE dirkassignment5out;

-- Connecting to database 
\c dirkassignment5out

-- Relation schemas and instances for assignment 5

CREATE TABLE Person(pid integer,
                    pname text,
                    city text,
                    primary key (pid));

CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

CREATE TABLE Skill(skill text,
                   primary key (skill));


CREATE TABLE worksFor(pid integer,
                      cname text,
                      salary integer,
                      primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text,
                             city text,
                             primary key (cname, city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill(pid integer,
                         skill text,
                         primary key (pid, skill),
                         foreign key (pid) references Person (pid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE Knows(pid1 integer,
                   pid2 integer,
                   primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));



INSERT INTO Person VALUES
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

INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale');


INSERT INTO worksFor VALUES
     (1001,'Apple', 65000),
     (1002,'Apple', 45000),
     (1003,'Amazon', 55000),
     (1004,'Amazon', 55000),
     (1005,'Google', 60000),
     (1006,'Amazon', 55000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 50000),
     (1013,'Yahoo', 55000),
     (1014,'Apple', 50000), 
     (1015,'Amazon', 60000),
     (1016,'Amazon', 55000),
     (1017,'Netflix', 60000),
     (1018,'Apple', 50000),
     (1019,'Microsoft', 50000);

INSERT INTO companyLocation VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington'),
   ('Apple', 'Cupertino'),
   ('Amazon', 'Seattle'),
   ('Google', 'MountainView'),
   ('Netflix', 'LosGatos'),
   ('Microsoft', 'Redmond'),
   ('IBM', 'NewYork'),
   ('Yahoo', 'Sunnyvale');

INSERT INTO Skill VALUES
   ('Programming'),
   ('AI'),
   ('Networks'),
   ('OperatingSystems'),
   ('Databases');

INSERT INTO personSkill VALUES
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1010,'Databases'),
 (1011,'Databases'),
 (1013,'Databases'),
 (1014,'Databases'),
 (1017,'Databases'),
 (1019,'Databases'),
 (1005,'Databases'),
 (1006,'AI'),
 (1009,'Databases');
 

INSERT INTO Knows VALUES
 (1011,1009),
 (1007,1016),
 (1011,1010),
 (1003,1004),
 (1006,1004),
 (1002,1014),
 (1009,1005),
 (1018,1009),
 (1007,1017),
 (1017,1019),
 (1019,1013),
 (1016,1015),
 (1001,1012),
 (1015,1011),
 (1019,1006),
 (1013,1002),
 (1018,1004),
 (1013,1007),
 (1014,1006),
 (1004,1014),
 (1001,1014),
 (1010,1013),
 (1010,1014),
 (1004,1019),
 (1018,1007),
 (1014,1005),
 (1015,1018),
 (1014,1017),
 (1013,1018),
 (1007,1008),
 (1005,1015),
 (1017,1014),
 (1015,1002),
 (1018,1013),
 (1018,1010),
 (1001,1008),
 (1012,1011),
 (1002,1015),
 (1007,1013),
 (1008,1007),
 (1004,1002),
 (1015,1005),
 (1009,1013),
 (1004,1012),
 (1002,1011),
 (1004,1013),
 (1008,1001),
 (1008,1019),
 (1019,1008),
 (1001,1019),
 (1019,1001),
 (1004,1003),
 (1006,1003),
 (1015,1003),
 (1016,1004),
 (1016,1006),
 (1008,1015),
 (1010,1008),
 (1017,1013),
 (1002,1001),
 (1009,1001),
 (1011,1005),
 (1014,1012),
 (1010,1002),
 (1010,1012),
 (1010,1018);


-- We define the following functions and predicates

/*
Functions:
set_union(A,B)               A union B
set_intersection(A,B)        A intersection B
set_difference(A,B)          A - B
add_element(x,A)             {x} union A
remove_element(x,A)          A - {x}
make_singleton(x)            {x}
choose_element(A)            choose some element from A
bag_union(A,B)               the bag union of A and B
bag_to_set(A)                coerce a bag A to the corresponding set

Predicates:
is_in(x,A)                   x in A
is_not_in(x,A)               not(x in A)
is_empty(A)                  A is the emptyset
is_not_emptyset(A)           A is not the emptyset
subset(A,B)                  A is a subset of B
superset(A,B)                A is a super set of B
equal(A,B)                   A and B have the same elements
overlap(A,B)                 A intersection B is not empty
disjoint(A,B)                A and B are disjoint 
*/

-- Set Operations: union, intersection, difference

-- Set union $A \cup B$:
create or replace function set_union(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) union select unnest(B) order by 1);
$$ language sql;

-- Set intersection $A\cap B$:
create or replace function set_intersection(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

-- Set difference $A-B$:
create or replace function set_difference(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) except select unnest(B) order by 1);
$$ language sql;


-- Add element to set
create or replace function add_element(x anyelement, A anyarray) 
returns anyarray as
$$
   select bag_to_set(x || A);
$$ language sql;


-- Add element to set
create or replace function remove_element(x anyelement, A anyarray) 
returns anyarray as
$$
   select array_remove(A, x);
$$ language sql;


-- Make singleton  x --->  {x}

create or replace function make_singleton(x anyelement) 
returns anyarray as
$$
   select add_element(x,'{}');
$$ language sql;


-- Choose some element from set A
create or replace function choose_element(A anyarray) 
returns anyelement as
$$
   select x 
   from (select UNNEST(A) as x) q
   order by random();
$$ language sql;


-- Bag operations

-- Bag union 
create or replace function bag_union(A anyarray, B anyarray) 
returns anyarray as
$$
   select A || B;
$$ language sql;

-- bag To set
create or replace function bag_to_set(A anyarray)
returns anyarray as
$$
   select array(select distinct unnest(A) order   by 1);
$$ language sql;


-- Set Predicates: set membership, set non membership, emptyset, subset, superset, overlap, disjoint

-- Set membership $x \in A$:
create or replace function is_in(x anyelement, A anyarray) 
returns boolean as
$$
   select x = SOME(A);
$$ language sql;

-- Set non membership $x \not\in A$:
create or replace function is_not_in(x anyelement, A anyarray) 
returns boolean as
$$
   select not(x = SOME(A));
$$ language sql;

-- emptyset test $A = \emptyset$:
create or replace function is_empty(A anyarray) 
returns boolean as
$$
   select A <@ '{}';
$$ language sql;


-- non emptyset test $A \neq \emptyset$:
create or replace function is_not_empty(A anyarray) 
returns boolean as
$$
   select not(A <@ '{}');
$$ language sql;

-- Subset test $A\subseteq B$:
create or replace function subset(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B;
$$ language sql;

-- Superset test $A \supseteq B$:
create or replace function superset(A anyarray, B anyarray) 
returns boolean as
$$
   select A @> B;
$$ language sql;

-- Equality test $A = B$
create or replace function equal(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B and A @> B;
$$ language sql;

-- Overlap test $A\cap B \neq \emptyset$:
create or replace function overlap(A anyarray, B anyarray) 
returns boolean as
$$
   select A && B;
$$ language sql;

-- Disjointness test $A\cap B = \emptyset$:
create or replace function disjoint(A anyarray, B anyarray) 
returns boolean as
$$
   select not A && B;
$$ language sql;


-- Set Operations: union, intersection, difference

-- Set union $A \cup B$:
create or replace function setunion(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) union select unnest(B) order by 1);
$$ language sql;

-- Set intersection $A\cap B$:
create or replace function setintersection(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

-- Set difference $A-B$:
create or replace function setdifference(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) except select unnest(B) order by 1);
$$ language sql;


-- Set Predicates: set membership, subset, superset, overlap, disjoint

-- Set membership $x \in A$:
create or replace function isIn(x anyelement, A anyarray) 
returns boolean as
$$
   select x = SOME(A);
$$ language sql;

-- Subset test $A\subseteq B$:
create or replace function subset(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B;
$$ language sql;

-- Superset test $A \supseteq B$:
create or replace function superset(A anyarray, B anyarray) 
returns boolean as
$$
   select A @> B;
$$ language sql;

-- Overlap test $A\cap B \neq \emptyset$:
create or replace function overlap(A anyarray, B anyarray) 
returns boolean as
$$
   select A && B;
$$ language sql;

-- Disjointness test $A\cap B = \emptyset$:
create or replace function disjoint(A anyarray, B anyarray) 
returns boolean as
$$
   select not A && B;
$$ language sql;

-- Complex-object views on the Person, Company, companyLocation,
-- worksFor, Skill, personSkill, and Knows database

-- Define the view {\tt companyHasEmployees(cname,employees)} which
-- associates with each company, identified by a cname, the set of
-- pids of persons who work for that company. 

create or replace view companyHasEmployees as
   select cname, array(select pid 
                       from   worksfor w
                       where  w.cname = c.cname order by 1) as employees
   from   company c order by 1;


-- Define a view {\tt cityHasCompanies(city,companies)} which associates
-- with each city the set of cnames of companies who are located in that
-- city. 

create or replace view cityHasCompanies as
   select city, array_agg(cname order by 1) as companies
   from   companyLocation 
   group by city order by 1;




-- Define a view {\tt companyLocations(cname,locations)} which associates
-- with each company, identified by a cname, the set of cities in which
-- that company is located.  

create or replace view companyHasLocations     as
   select cname, array(select city 
                       from   companyLocation cc
                       where  c.cname = cc.cname order by 1) as locations
   from   company c
   order by 1;



-- Define a view {\tt knowsPersons(pid,persons)} which associates with each
-- person, identified by a pid, the set of pids of persons he or she
-- knows.

create or replace view knowsPersons as
   select p.pid, array(select k.pid2 
                       from   knows k
                       where  k.pid1 = p.pid order by pid2) as persons
   from   person p
   order by 1;




-- The view {\tt isKnownByPersons(pid,persons)} which associates with
-- each person, identified by a pid, the set of pids of persons who know
-- that person.  Observe that there may be persons who are not known by
-- any one.

create or replace view isKnownByPersons as
   select distinct p.pid, array(select k.pid1 
                                from   knows k
                                where  k.pid2 = p.pid order by pid1) as persons
   from   person p
   order by 1;


-- Define a view {\tt personHasSkills(pid,skills)} which associates with
-- each person, identified by a pid, his or her set of job skills.
-- Observe that a person may not have any job skills.  (Test your view.)

create or replace view personHasSkills  as
   select distinct p.pid, array(select s.skill
                                from   personSkill s
                                where  s.pid = p.pid order by 1) as skills
   from   person p order by 1;





-- Define a view {\tt skillOfPersons(skills,persons)} which associates
-- with each job skill the set of pids of persons who have that job
-- skill.  Observe that there may be job skills that are not job skills
-- of any person.  (Test your view.)

create or replace view  skillOfPersons as
    select js.skill, array(select ps.pid
                           from   personSkill ps
                           where  ps.skill = js.skill order by 1) as persons
    from   Skill js order by 1;


-- Problem 1

\qecho 'Problem 1.a' 

-- Find the cname and headquarter of each company that employs at
-- least three persons who have a common job skill.

SELECT DISTINCT CE.CNAME, C.headquarter FROM COMPANY C, COMPANYHASEMPLOYEES CE,
PERSONHASSKILLS PS1,  PERSONHASSKILLS PS2,  PERSONHASSKILLS PS3
WHERE PS1.PID <> PS2.PID AND PS3.PID <> PS2.PID AND PS1.PID <> PS3.PID AND 
IS_IN(PS1.PID, CE.EMPLOYEES) AND IS_IN(PS2.PID, CE.EMPLOYEES) AND IS_IN(PS3.PID, CE.EMPLOYEES) AND 
OVERLAP(
	set_intersection(PS1.SKILLS, PS2.SKILLS),
	set_intersection(PS1.SKILLS, PS3.SKILLS)
		)
AND CE.CNAME = C.CNAME;			       


\qecho 'Problem 1.b'  

-- Find each person who has no skill in common with those
-- of the persons who works for Yahoo or for Netflix.

SELECT distinct P.* FROM PERSON P, PERSONHASSKILLs PS
WHERE p.pid = ps.pid and
	DISJOINT(
	PS.SKILLS
	,
	array(select unnest(ps.skills)
	from personHasSkills ps
	where is_in(ps.pid, (select employees
	from companyHasEmployees
	where cname = 'Netflix')))
	)
AND
	DISJOINT(
	PS.SKILLS
	,
	array(select unnest(ps.skills)
	from personHasSkills ps
	where is_in(ps.pid, (select employees
	from companyHasEmployees
	where cname = 'Yahoo')))
	);	  


\qecho 'Problem 1.c'  

-- Find the set of companies that employ at least 2 persons who each
-- know fewer than 3 persons.  (So this query returns {\bf only one}
-- object, i.e., the set of companies specified in the query.)

SELECT bag_to_set(ARRAY(
	SELECT C.CNAME FROM COMPANY C
WHERE 
CARDINALITY(ARRAY((SELECT KP.PID
				   FROM 
				   (SELECT UNNEST(CE.EMPLOYEES) AS PID FROM companyHasEmployees CE WHERE CE.CNAME=C.CNAME) CEN
				   INNER JOIN
				   knowsPersons KP ON CEN.PID = KP.PID
				   WHERE CARDINALITY(KP.PERSONS)<3
				  
				  ))) >=2
	)) AS COMPANIES;


\qecho 'Problem 1.d' 

-- Find the pid and name of each person $p$ along with the set of pids
-- of persons who (1) are known by $p$ and (2) who have both the
-- Programming and AI skills.


SELECT P.PID, P.PNAME, 
ARRAY(SELECT KBY.PERSONS FROM (SELECT UNNEST(PERSONS) AS PERSONS FROM knowsPersons WHERE PID=P.PID) KBY
 				WHERE
 			   subset('{"AI", "Programming"}'
				   ,(SELECT SKILLS FROM personHasSkills WHERE PID=KBY.PERSONS))
				
)
FROM PERSON P;


\qecho 'Problem 1.e' 



-- Find each pair $(s_1,s_2)$ of different skills $s_1$ and $s_2$ such
-- that the number of employees who have skill $s_1$ and who make
-- strictly less than 55000 is strictly more than the number of
-- employees who have skill $s_2$ and who make at most 55000.


SELECT S1.SKILL, S2.SKILL FROM SKILL S1, SKILL S2
WHERE S1.SKILL <> S2.SKILL
AND CARDINALITY(ARRAY(
SELECT PS.PID FROM personHasSkills PS INNER JOIN WORKSFOR W ON PS.PID=W.PID
	WHERE IS_IN(S1.SKILL, PS.SKILLS) AND W.SALARY<55000
) )<

CARDINALITY(ARRAY(
SELECT PS.PID FROM personHasSkills PS INNER JOIN WORKSFOR W ON PS.PID=W.PID
	WHERE IS_IN(S2.SKILL, PS.SKILLS) AND W.SALARY<=55000
));			    

\qecho 'Problem 2'


-- Find the following set of sets
-- {S | S ⊆ Skill ∧ |S| ≤ 4}.
-- I.e., this is the set consisting of 
-- each set of job skills whose size (cardinality) is at most 4.

CREATE OR REPLACE FUNCTION MAKE_PAIR(X ANYELEMENT, Y ANYELEMENT) 
RETURNS ANYARRAY AS
$$
   SELECT SET_UNION(MAKE_SINGLETON(X),MAKE_SINGLETON(Y));
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION MAKE_TRIPLE(X ANYELEMENT, Y ANYELEMENT, Z ANYELEMENT) 
RETURNS ANYARRAY AS
$$
   SELECT SET_UNION(SET_UNION(MAKE_SINGLETON(X),MAKE_SINGLETON(Y)),MAKE_SINGLETON(Z));
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION MAKE_QUADRUPLE(W ANYELEMENT,X ANYELEMENT, Y ANYELEMENT, Z ANYELEMENT) 
RETURNS ANYARRAY AS
$$
   SELECT SET_UNION(SET_UNION(MAKE_SINGLETON(W),MAKE_SINGLETON(X)),SET_UNION(MAKE_SINGLETON(Y),MAKE_SINGLETON(Z)));
$$ LANGUAGE SQL;

SELECT '{}'
UNION
SELECT MAKE_SINGLETON(SKILL) AS SKILLS
FROM   SKILL
UNION
SELECT MAKE_PAIR(S1.SKILL,S2.SKILL)
FROM   SKILL S1, SKILL S2
UNION
SELECT MAKE_TRIPLE(S1.SKILL,S2.SKILL,S3.SKILL)
FROM   SKILL S1, SKILL S2, SKILL S3
UNION
SELECT MAKE_QUADRUPLE(S1.SKILL,S2.SKILL,S3.SKILL,S4.SKILL)
FROM SKILL S1, SKILL S2, SKILL S3, SKILL S4;



\qecho 'Problem 3'

-- Reconsider Problem 2. Let
-- S = {S | S ⊆ Skill ∧ |S| ≤ 4}.
-- Find the following set of sets
-- {X | X ⊆ S ∧ |X| ≥ 2}.


CREATE TYPE SKILL_TYPE AS (SKILL TEXT);

CREATE TYPE SKILLS_TYPE AS (SKILLS SKILL_TYPE[]);

WITH S AS (SELECT '{}' AS SKILLS UNION
SELECT MAKE_SINGLETON(ROW(S.SKILL)::SKILL_TYPE) SKILLS
FROM   SKILL S
UNION 
SELECT MAKE_PAIR(ROW(S1.SKILL)::SKILL_TYPE,ROW(S2.SKILL)::SKILL_TYPE)
FROM   SKILL S1, SKILL S2
UNION
SELECT MAKE_TRIPLE(ROW(S1.SKILL)::SKILL_TYPE,ROW(S2.SKILL)::SKILL_TYPE,ROW(S3.SKILL)::SKILL_TYPE)
FROM   SKILL S1, SKILL S2, SKILL S3
UNION
SELECT MAKE_QUADRUPLE(ROW(S1.SKILL)::SKILL_TYPE,ROW(S2.SKILL)::SKILL_TYPE,
ROW(S3.SKILL)::SKILL_TYPE,ROW(S4.SKILL)::SKILL_TYPE)
FROM SKILL S1, SKILL S2, SKILL S3, SKILL S4)


SELECT '{}'
UNION
SELECT MAKE_SINGLETON(ROW(S.SKILLS)::SKILLS_TYPE)
FROM S S
UNION
SELECT MAKE_PAIR(ROW(S1.SKILLS)::SKILLS_TYPE,ROW(S2.SKILLS)::SKILLS_TYPE)
FROM S S1, S S2;

\qecho 'Problem 4'

-- Let t be a number called a threshold. We say that an (unordered) triple of different 
-- skills {s1, s2, s3} co-occur with frequency at least t if there are at 
-- least t persons who each have skills s1, s2, and s3.
-- Write a function coOccur(t integer)that returns the (unordered) triples {s1, s2, s3} of 
-- skills that co-occur with frequency at least t.
-- Test your coOccur function for t in the range [0, 3].


CREATE OR REPLACE FUNCTION coOccur(T integer) RETURNS TABLE(TRIPLE TEXT[]) AS $$
select qm.triple from (select q.triple, CARDINALITY(ARRAY_AGG(PS.PID)) as cnt from
(select qs3.triple from (SELECT bag_to_set(array[S1.SKILL, S2.SKILL, S3.SKILL]) as triple
			 FROM SKILL S1, SKILL S2, SKILL S3
 where S1.SKILL <> S2.SKILL AND  S1.SKILL <> S3.SKILL AND  S3.SKILL <> S2.SKILL) qs3
 group by qs3.triple) q, PERSONHASSKILLS PS
 where SUBSET(q.triple, PS.SKILLS)
 group by q.triple) qm
 where qm.cnt >=t
$$ LANGUAGE SQL;

SELECT * FROM coOccur(3);


-- \section{Nested Relations and Semi-structured databases}

-- Consider the lecture on Nested and Semi-structured Data models.  In
-- that lecture, we considered the {\tt studentGrades} nested relation
-- and we constructed it using a PostgreSQL query starting from the {\tt
-- Enroll} relation.

CREATE TABLE student (sid TEXT, sname TEXT, major TEXT, byear INT);
INSERT INTO student VALUES
('s100', 'Eric'  , 'CS'     , 1988),
('s101', 'Nick'  , 'Math'   , 1991),
('s102', 'Chris' , 'Biology', 1977),
('s103', 'Dinska', 'CS'     , 1978),
('s104', 'Zanna' , 'Math'   , 2001),
('s105', 'Vince' , 'CS'     , 2001);

CREATE TABLE course (cno TEXT, cname TEXT, dept TEXT);
INSERT INTO course VALUES
('c200', 'PL'      , 'CS'),
('c201', 'Calculus', 'Math'),
('c202', 'Dbs'     , 'CS'),
('c301', 'AI'      , 'CS'),
('c302', 'Logic'   , 'Philosophy');

CREATE TABLE enroll (sid TEXT, cno TEXT, grade TEXT);
insert into enroll values 
     ('s100','c200', 'A'),
     ('s100','c201', 'B'),
     ('s100','c202', 'A'),
     ('s101','c200', 'B'),
     ('s101','c201', 'A'),
     ('s102','c200', 'B'),
     ('s103','c201', 'A'),
     ('s101','c202', 'A'),
     ('s101','c301', 'C'),
     ('s101','c302', 'A'),
     ('s102','c202', 'A'),
     ('s102','c301', 'B'),
     ('s102','c302', 'A'),
     ('s104','c201', 'D');



\qecho 'Problem 6'

-- Write a PostgreSQL view {\tt courseGrades} that creates the nested
-- relation of type \[{\tt (cno, gradeInfo\{(grade, students
-- \{(sid)\})\})}\] This view should compute for each course, the grade
-- information of the students enrolled in this course.  In particular,
-- for each course and for each grade, this relation stores in a set the
-- students who obtained that grade in that course.

-- Test your view.
CREATE TYPE STYPE AS (SID TEXT);
CREATE TYPE CTYPE AS (CNO TEXT);
CREATE TYPE GRADE_SIDS_TYPE AS (GRADE TEXT, SID STYPE[]);

CREATE OR REPLACE VIEW courseGrades AS
WITH E AS (SELECT CNO, GRADE, ARRAY_AGG(ROW(SID)::STYPE) AS SID FROM ENROLL 
		  GROUP BY (CNO, GRADE)
		  ORDER BY 1, 2)
SELECT CNO, ARRAY_AGG(ROW(GRADE, SID)::GRADE_SIDS_TYPE) AS gradeinfo FROM E 
		 GROUP BY CNO
		 ORDER BY 1;

 SELECT * FROM courseGrades;

-- Problem 7

-- Starting from the {\tt courseGrades} view in
-- Problem~\ref{nestedrelation} solve the following queries:

\qecho 'Problem 7.a'
--- ******* grade is C

-- Find each pair (c,S) where c is the cno of a course and S is the set of sids of 
-- students who received an ‘A’ or a 'C' in course c. The type of 
-- your answer relation should be (cno : text, Students : {(sid : text)}).

SELECT CNO, G.SID FROM courseGrades CG, UNNEST(CG.GRADEINFO) G
WHERE G.GRADE = 'A' OR G.GRADE = 'C';


\qecho 'Problem 7.b'

-- Find each (s, C) pair where s is the sid of a students and C is the set of cnos of 
-- courses in which the student received an ‘A’ or a ‘B’. 
-- The type of your answer relation should be (sid : text, Courses : {(cno : text)}).

SELECT S.SID AS SID, ARRAY_AGG(ROW(CG.CNO)::STYPE) AS CNO 
FROM courseGrades CG, UNNEST(CG.GRADEINFO) AS G, UNNEST(G.SID) AS S
WHERE G.GRADE = 'A' OR G.GRADE = 'B' 
GROUP BY S.SID;

\qecho 'Problem 8'
-- Write a PostgreSQL view {\tt jcourseGrades} that creates a
-- semi-structured database which stores {\tt jsonb} objects whose
-- structure conforms with the structure of tuples as described for the
-- {\tt courseGrades} in Problem 6.

-- Test your view.

CREATE OR REPLACE VIEW jcourseGrades AS 
WITH E AS (SELECT CNO, GRADE, JSONB_AGG(JSONB_BUILD_OBJECT('sid',E.SID)) AS SID
		  FROM ENROLL E
		  GROUP BY (E.CNO, E.GRADE)
		  ORDER BY 1, 2),
     G AS (SELECT JSONB_BUILD_OBJECT('cno',E1.CNO,'gradeinfo', JSONB_AGG(JSONB_BUILD_OBJECT('grade', E1.GRADE, 'students', E1.SID)))
		   AS courseinfo
		 FROM E E1
		 GROUP BY E1.CNO
		 ORDER BY 1)
SELECT courseinfo
FROM G ;

SELECT * FROM jcourseGrades;

-- Problem 9
-- Starting from the {\tt jcourseGrades} view in
-- Problem~\ref{jsoncourseGrades} solve the following queries. Note that
-- the output of each of these queries is a nested relation.

\qecho 'Problem 9.a'

-- Find each pair (c,s) where c is the cno of a course and s is the sid of a student 
-- who received an ‘A’ in course c. 
-- The type of your answer relation should be (cno:text, sid:text).

SELECT CG.courseinfo ->> 'cno' AS CNO, S ->> 'sid' AS SID
FROM jcourseGrades CG, 
jsonb_array_elements(CG.courseinfo -> 'gradeinfo') G,
 jsonb_array_elements(G -> 'students') S
WHERE G -> 'grade' = '"A"'
ORDER BY 1, 2;

\qecho 'Problem 9.b'

-- Find each pair ({c1, c2}, S) where c1 and c2 are the course numbers of two different 
-- courses and S is the set of sids of students who received a ’A’ in both courses c1 and c2. 
-- The type of your answer relation should be 
-- (coursePair : {(cno : text)}, Students : {(sid : text))}.



CREATE OR REPLACE FUNCTION STUDENTS_A(C1 TEXT, C2 TEXT) RETURNS STYPE[] AS 
$$
WITH Q AS (SELECT CG.courseinfo ->> 'cno' AS CNO, S ->> 'sid' AS SID
FROM jcourseGrades CG, 
jsonb_array_elements(CG.courseinfo -> 'gradeinfo') G,
 jsonb_array_elements(G -> 'students') S
WHERE G -> 'grade' = '"A"')
SELECT ARRAY(SELECT ROW(Q.SID)::STYPE AS SID FROM Q WHERE Q.CNO = C1
									INTERSECT 
									SELECT ROW(Q.SID)::STYPE AS SID FROM Q WHERE Q.CNO = C2
								   ) Q2
$$ LANGUAGE SQL;
create or replace function make_pair(x anyelement, y anyelement) 
returns anyarray as
$$
   select set_union(make_singleton(x),make_singleton(y));
$$ language sql;

SELECT DISTINCT make_pair(ROW(C1.CNO)::CTYPE , ROW(C2.CNO)::CTYPE), STUDENTS_A(C1.CNO, C2.CNO) AS STUDENTS
								   FROM   COURSE C1, COURSE C2
								   
								    WHERE C1.CNO <> C2.CNO
									GROUP BY C1.CNO, C2.CNO;


\c postgres

drop database dirkassignment5out;

-- collaborated with Akshat Arvind, Renuka Srishti


