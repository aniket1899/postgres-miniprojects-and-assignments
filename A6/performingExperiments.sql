--collaborated with Renuka Srishti, Akshat Arvind



--3
-- The function queryPlan returns the query plan for the given sqlStatement

create or replace function queryPlan (sqlStatement text) 
returns table (queryPlanRow text) as
$$
begin
 return  query execute 'explain analyze ' || sqlStatement;
end;
$$ language plpgsql;

-- The function extractExecutionTime extracts the execution time of
-- the query plan for the given sqlStatement

create or replace function extractExecutionTime(sqlStatement text)
returns       float as
$$
   select substring(q.queryPlan,'([0-9.]+)')::float
   from   (select queryPlan from queryPlan(sqlStatement)) q
   where  q.queryPlan like '%Exec%';
$$ language sql;

-- The function runExperiment runs 'n' experiment for the
-- given queryStatement and returns their average execution time

create or replace function runExperiment(n int, queryStatement text) 
returns float as
$$
    select avg((select * from extractExecutionTime(queryStatement)))
    from   generate_series(1,n);
$$ language sql;

-- The 'experiment' function creates m relation S, with |S| = 10^k for k
-- in [k_1,k_2] and runs the (scan) query `SELECT x FROM S' n times.
-- Then the function returns the average execution times of these n
-- runs.

create or replace function experiment(m int, k_1 int, k_2 int, n int, sqlstatement text)
returns table(s int, e numeric) as
$$
begin
   drop table if exists executionTimeTable;
   create table executionTimeTable (size int, executionTime    float);   
   
   for i in 1..m loop
     for k in k_1..k_2 loop
      perform makeS(floor(power(10,k))::int);
      insert into executionTimeTable values(floor(power(10,k))::int, (select runexperiment(n,sqlstatement)));
    end loop;
   end loop;
   return query select size::int, round(avg(executiontime)::numeric,3)
                from   executionTimeTable 
                group by(size) order by 1;
end;
$$ language plpgsql;


-- Example:  SCANNING
-- Average execution times to analyze scanning a set S of increasing size
-- using the SQL statement  'SELECT x FROM S' statement.

select s as "size of relation S", e as "Average execution time for SELECT x FROM S"
from   experiment(5,1,7,5,'SELECT x FROM S');


/*
 size of relation S | Average execution time for SELECT x FROM S 
--------------------+--------------------------------------------
                 10 |                                      0.008
                100 |                                      0.023
               1000 |                                      0.142
              10000 |                                      1.352
             100000 |                                     13.343
            1000000 |                                    133.687
           10000000 |                                   1377.334
          100000000 |                                  14040.783
(8 rows)
*/

-- These execution times makes sense since scanning a relation is O(|S|).

-- select q1.s as "size of relation S (256MB)", q1.e as "Average execution time for SELECT x FROM S",
-- q2.e as "Average execution time for SELECT x FROM S ORDER BY 1" from
-- (select s , e
-- from experiment(3,1,8,3,'SELECT x FROM S')) q1, 
-- (select s, e
-- from experiment(3,1,8,3,'SELECT x FROM S order by 1')) q2
-- where q1.s=q2.s;


select s as "size of relation S", e as "Average execution time for SELECT x FROM S order by 1"
from   experiment(3,1,8,3,'SELECT x FROM S order by 1');






--Problem 9 :

create table person (pid int);
insert into person select * from generate_series(1,100);

create table skill (skill text);
insert into skill values ('AI'),('Databases'),('Networks'),('OperatingSystems'),('Programming');

create table personskill(pid int, skill text);
do $$
begin 
	truncate personskill;
	for counter in 1..1000 by 1 loop
		insert into personskill(pid,skill) select 
        (SELECT pid from person order by RANDOM() limit 1) as pid, 
        (SELECT skill from skill order by RANDOM() limit 1) as skill;
	end loop;
end;
$$;

create index sk_index_b on personSkill(skill);
drop index sk_index_b; 

create index sk_index_hash on personSkill using hash(skill);
drop index sk_index_hash; 

explain analyze select pid from personSkill where skill = 'Networks'; 





-- 10
create table company (cno int);
insert into company select * from generate_series(1,20); 
create table worksFor(pid int, cno int, salary int);

do $$
begin 
	truncate worksFor;
	for counter in 1..100000 by 1 loop
		insert into worksFor(pid,cno,salary) 
		select (SELECT pid from person order by RANDOM() limit 1) as pid, 
		(SELECT cno from company order by RANDOM() limit 1) as cno, 
		floor(random()*(100000-5000)+5000):: int as salary;
	end loop;
end;
$$;
-- drop index sal_index_b;
create index sal_index_b on worksFor(salary);
-- drop index sal_index_hash;
create index sal_index_hash on worksFor using hash(salary);
explain analyze select pid from worksFor where 7000 <= salary and salary <= 50000; 





-- 11

explain analyze select pid from personSkill where pid = 45 and skill = 'Databases';

-- vacuum personSkill;

--b+ index
-- drop index sk_pid_index_b;
create index sk_pid_index_b on personSkill(pid,skill);

-- hash index
-- drop index pid_hash;
-- drop index skill_hash;
create index pid_hash on personSkill using hash(pid);
create index skill_hash on personSkill using hash(skill);

explain analyze select pid from personSkill where pid = 89 and skill = 'AI';




--12

select pid from Person where pid [not] in 
(select pid from personSkill where skill = 'AI');


-- vacuum personSkill;
create index sk_index_b on personSkill(skill);
create index sk_index_hash on personSkill using hash(skill);


select * from pg_indexes where tablename = 'personSkill';

--collaborated with Renuka Srishti, Akshat Arvind
