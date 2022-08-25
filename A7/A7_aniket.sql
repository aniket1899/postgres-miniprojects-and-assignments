-- Script for B561 Spring 2022 Assignment 7

create database dvgassignment7;

\c dvgassignment7


\qecho 'Problem 6'

--- Topological sort
create table V(node int);
create table E(source int, target int);


insert into V values
   (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12);

insert into E values
   (1,2),
   (1,3),
   (1,4),
   (2,5),
   (2,6),
   (3,7),
   (4,8),
   (5,9),
   (7,10),
   (7,11),
   (9,12);


-- create table Topological(node int);
-- create or replace function TopologicalSort(n int)
-- returns int
-- $$ 




\qecho 'Problem 7' -- not graded
-- same generation

create table PC(parent int, child int);

insert into PC values 
   (1,2),
   (1,3),
   (1,4),
   (2,5),
   (2,6),
   (3,7),
   (4,8),
   (5,9),
   (7,10),
   (7,11),
   (9,12);

-- Consider a parent-child relation PC(parent, child). (You can assume
-- that PC is a rooted tree and the domain of the attributes parent
-- and child is int.) An edge (p,c) in PC indicates that node p is a
-- parent of node c. Now consider a pair of nodes (m,n) in PC (m and n
-- maybe the same nodes.) We say that m and n are in the same
-- generation when the distance from m to the root of PC is the same
-- as the distance from n to the root of PC.

-- Consider the following recursive query that computes the {\tt
-- sameGeneration} relation:

/*
WITH RECURSIVE sameGeneration(m, n) AS
          ((SELECT parent, parent FROM PC) UNION (select child, child from PC)
          UNION
          SELECT  t1.child, t2.child
          FROM    sameGeneration pair, PC t1, PC t2
          WHERE   pair.m = t1.parent and pair.n = t2.parent)
SELECT DISTINCT pair.m, pair.n from sameGeneration pair order by m, n;
*/

-- Write a non-recursive function sameGeneration() in the language
-- plpgsql that computes the sameGeneration relation.

\qecho 'Problem 8'
-- Heapsort

create table data (index int, value int);

INSERT INTO data VALUES 
 (1, 3), 
 (2, 1), 
 (3, 2), 
 (4, 0), 
 (5, 7), 
 (6, 8), 
 (7,9), 
 (8, 11),
 (9, 1), 
 (10, 3);



create or replace function insert_heap(x int)
returns void as
$$
declare 
max_index int;
curr int;
parent int;
p_val int;
c_val int;
begin
if not exists (select * from data )
then
	insert into data values (0, x);
	
else
	max_index := (select max(index) from data);
	insert into data values (max_index+1, x);
	curr := max_index+1;
	parent := curr/2;
	while (select value from data where index = curr) < (select value from data where index = parent)
	loop
		p_val := (select value from data where index = parent);
		c_val := (select value from data where index = curr);
		
		update data set value = p_val where index = curr;
		update data set value = c_val where index = parent;
		curr = parent/2;
		parent := curr/2;
		
	end loop;
end if;
end;
$$ language plpgsql;

create or replace function min_heapify(x int)
returns void as
$$
declare
max_index int;
curr int;
l int;
r int;
x_val int;
c_val int;

begin
if exists (select * from data)
then	
	curr := x;
	l := curr * 2;
	r := curr * 2 + 1;
	max_index := (select max(index) from data);
	if r <= max_index and (select value from data where index=r) < (select value from data where index=curr)
	then
		curr = r;
	end if;
	if l <= max_index and (select value from data where index=l) < (select value from data where index=curr)
	then
		curr = l;
	end if;

	
	
	if curr != x
	then
		x_val := (select value from data where index = x);
		c_val := (select value from data where index = curr);
		
		update data set value = x_val where index = curr;
		update data set value = c_val where index = x;
		
		perform min_heapify(curr);
	
	end if;
end if;
end;
$$  language plpgsql;


begin
	if not exists(select * from data)
	then
		return(NULL);
	else
		max_index := (select max(index) from data);
		pop := (select value from data where index = 1);
		last_val := (select value from data where index = max_index);
		update data set value = last_val where index = 1;
		delete from data where index = max_index;
		perform min_heapify(1);
		return(pop);

	end if;
end;
$$  language plpgsql;

create table sortedData(index int,value int);
DROP FUNCTION heapsort();
create or replace function heapsort()
returns void as
$$
declare
sort_idx int;
min_val int;
begin
drop table if exists temp;
create table temp(index int,value int);
insert into temp (select index, value from data);
sort_idx := 1;
delete from sorteddata;
while exists (select * from data)
	loop
		min_val := (select value from data where index=1);
		delete from data where index = 1;
		update data set index = index-1;
		insert into sortedData values (sort_idx, min_val);
		sort_idx := sort_idx+1;
		perform min_heapify(0);
 	end loop;
insert into data (select index, value from temp);
drop table if exists temp;

end;
$$  language plpgsql;




\qecho 'Problem 9'
-- Dijkstra Algorithm

create table Graph(source int,
                   target int,
                   weight int);

insert into Graph values
  (0,1,2),
  (1,0,2),
  (0,4,10),
  (4,0,10),
  (1,3,3),
  (3,1,3),
  (1,4,7),
  (4,1,7),
  (2,3,4),
  (3,2,4),
  (3,4,5),
  (4,3,5),
  (4,2,6),
  (2,4,6);

\qecho 'Problem 10'

create table partSubpart(pid int, sid int, quantity int);
create table basicPart(pid int, weight int);

insert into partSubpart values 
   (1,2,1),
   (1,3,3),
   (1,4,2),
   (2,5,1),
   (2,6,4),
   (3,7,2),
   (4,8,1),
   (5,9,2),
   (7,10,2),
   (7,11,3),
   (9,12,5);

insert into basicPart values
  (6,  1),
  (8,  4),
  (10, 1),
  (11, 5),
  (12, 3);

\qecho 'Problem 10.a'

-- Write a {\bf recursive} function {\tt recursiveAggregatedWeight(p
-- integer)} that returns the aggregated weight of a part {\tt p}.

\qecho 'Problem 10.b'

-- Write a {\bf non-recursive} function {\tt
-- nonRecursiveAggregatedWeight(p integer)} that returns the aggregated
-- weight of a part {\tt p}.  Test your function.


\qecho 'Problem 11'

-- Write a PostgreSQL program frequentSets(t int) that returns the sets
-- of all t-frequent sets.

create table Document(doc int, words text[]);

insert into Document values
  (1, '{"A", "B", "C", "D", "E"}'),
  (2, '{"A", "B", "C", "E", "F"}'),
  (3, '{"A", "E", "F"}'),
  (4, '{"E", "A"}');



\qecho 'Problem 12' -- not graded
-- Hamiltonian

\qecho 'Problem 12.a'

-- Write a {\bf recursive} function {\tt recursiveHamiltonian()} that
-- returns {\tt true} if the graph stored in {\tt Graph} is
-- Hamiltonian, and {\tt false} otherwise.

drop table Graph;
create table Graph(source int, target int);


-- Test your function on the following graphs.


-- delete from Graph;
-- insert into Graph values (1,2), (2,3), (3,1);

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,1);

-- select recursiveHamiltonian();

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,1),
 (4,5),
 (5,4);

-- select recursiveHamiltonian();

\qecho 'Problem 12.b'

-- Write a {\bf non-recursive} function {\tt nonRecursiveHamiltonian}
-- that returns {\tt true} if the graph stored in {\tt Graph} is
-- Hamiltonian, and {\tt false} otherwise. 

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,1);

-- select nonRecursiveHamiltonian();

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,1),
 (4,5),
 (5,4);

-- select nonRecursiveHamiltonian();

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,5),
 (5,6),
 (6,7),
 (7,8),
 (8,9),
 (9,10),
 (10,1);


-- select nonRecursiveHamiltonian();

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,5),
 (5,6),
 (6,7),
 (7,8),
 (8,9),
 (9,10);

-- select nonRecursiveHamiltonian();




\qecho 'Problem 13' 

-- Write, in PostgreSQL, a basic MapReduce program, i.e., a mapper
-- function and a reducer function, as well as a 3-phases simulation that
-- implements the symmetric difference of two unary relations R(a) and
-- S(a), i.e., the relation (R − S) ∪ (S − R). You can assume that the
-- domain of the attribute ‘a’ is integer.

-- drop table if exists R;
-- drop table if exists S;

create table R(a int); 
insert into R values (1),(2),(3),(4);

create table S(a int);
insert into S values (2),(4),(5);



\qecho 'Problem 14' -- not graded

-- Write, in PostgreSQL, a basic MapReduce program, i.e., a mapper func-
-- tion and a reducer function, as well as a 3-phases simulation that
-- implements the semijoin of two relations R(A,B) and S(A,B,C),

-- Test the function on the following relations:

drop table if exists R;
drop table if exists S;

create table R(A integer, B integer);
insert into R values (1, 2), (2, 4), (3, 6), (4,6);

create table S(A integer, B integer, C integer);
insert into S values (1, 2, 7), (2, 5, 8), (1, 4, 9), (3, 6, 10), (5, 7, 11);


\qecho 'Problem 15'

-- Write, in PostgreSQL, a basic MapRe- duce program, i.e., a mapper

-- function and a reducer function, as well as a 3-phases simulation that
-- implements the natural join R ◃▹ S of two relations R(A, B) and
-- S(B,C). You can assume that the domains of A, B, and C are
-- integer. Use the encoding and decoding methods described above.


drop table if exists R;
drop table if exists S;

create table R(A integer, B integer);
insert into R values (1, 2), (2, 4), (3, 6), (4,6);

create table S(A integer, B integer, C integer);
insert into S values (2, 7), (2, 5), (6, 4), (6, 8), (5, 7);



\qecho 'Problem 16' --not graded

-- Write, in PostgreSQL, a basic MapReduce program, i.e., a mapper func-
-- tion and a reducer function, as well as a 3-phases simulation that
-- imple- ments the SQL query

/*
SELECT r.A, array_agg(r.B), sum(r.B) FROM R r
GROUP BY (r.A)
HAVING COUNT(r.B) < 3;
*/


drop table if exists R;
create table R(A integer, B integer);

insert into R values
   (1,1),
   (1,2),
   (1,3),
   (2,2),
   (2,3),
   (3,2);


\qecho 'Problem 17'

drop table if exists R;
drop table if exists S;

create table R(K int, V int);
create table S(K int, W int);

insert into R values
   (1,1),
   (1,2),
   (1,3),
   (2,2),
   (2,3),
   (3,2),
   (7,7);

insert into S values
   (1,1),
   (1,2),
   (1,3),
   (3,2),
   (4,1),
   (4,2),
   (5,1),
   (5,2),
   (6,4),
   (6,5);

\qecho 'Problem 17.a'

-- Define a PostgreSQL view coGroup that computes a complex-object
-- relation that represent the co-group transformation R.cogroup(S). Show
-- that this view works.


\qecho 'Problem 17.b'

-- Write a PostgreSQL query that use this {\tt coGroup} view to
-- compute the anti semi join $R\, \overline{\ltimes}\, S$, in other words compute the
-- relation $R- R \bowtie \pi_{K}(S)$.


\qecho 'Problem 17.c'

-- Write a PostgreSQL query that uses this coGroup view to implement
-- the SQL query

/*

SELECT distinct r.K as rK, s.K as sK
FROM R r, S s
WHERE ARRAY(SELECT r1.V
FROM R r1
WHERE r1.K = r.K) <@ ARRAY(SELECT s1.W
FROM S s1
WHERE s1.K = s.K);

*/



\qecho 'Problem 18' -- not graded


create table A(x int); 
insert into A values (1),(2),(3),(4);

create table B(x int);
insert into B values (2),(4),(5);


\qecho 'Problem 18.a'
-- Write a PostgreSQL query that uses the cogroup transformation to compute A ∩ B.



\qecho 'Problem 18.b'

-- Write a PostgreSQL query that uses the cogroup operator to compute the
-- symmetric difference of A and B, i.e., the expression (A − B) ∪ (B −
-- A).



\c postgres
drop database dvgassignment7;

