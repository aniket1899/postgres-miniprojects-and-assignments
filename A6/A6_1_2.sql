
--collaborated with Renuka Srishti, Akshat Arvind
--1


create table P (outcome int,
                probability float);

create table c_probability (outcome int,
                probability double precision,
                cum_probability double precision);

create or replace function RelationOverProbabilityFunction
(n integer , l1 integer, u1 integer, l2 integer, u2 integer)
returns table (x int, y int) as
$$
with c_probability as 
(
    select outcome, probability, sum(probability)
     over 
    (partition by section order by outcome) as cum_probability  
    from (select *,0 as section from P) as x
), F as (select min(outcome) from 
c_probability,(select random() a 
    from generate_series(1, n)) b 
    where 
    b.a < cum_probability 
    group by b.a
)
select floor(random() * (u1 - l1 + 1) + 1)::int x, min::int y 
from F;
$$ 
language sql;

truncate P;

-- uniform mass function'
insert into P values
  (1, 0.125),
  (2, 0.125),
  (3, 0.125),
  (4, 0.125),
  (5, 0.125),
  (6, 0.125),
  (7, 0.125),
  (8, 0.125);

select * from RelationOverProbabilityFunction(100, 1, 150, 1, 8);
truncate P;

-- non-uniform function'
insert into P values
  (1, 0.25),
  (2, 0.05),
  (3, 0.10),
  (4, 0.10),
  (5, 0.15),
  (6, 0.05),
  (7, 0.10),
  (8, 0.20);

select * from RelationOverProbabilityFunction(100, 1, 150, 1, 8);


--2


create table Skill_text (skill text);
insert into Skill_text values
  ('AI'),
  ('Databases'),
  ('Networks'),
  ('Web Development'),
  ('Data Science');

create table PSkill(skill text, probability float);
insert into PSkill values
  ('AI', 0.2),
  ('Databases', 0.2),
  ('Networks', 0.2),
  ('Web Development', 0.2),
  ('Data Science', 0.2);


create or replace function PSkill_dist
(n integer, l1 integer, u1 integer, l2 integer, u2 integer) returns
table (pid int, skill text) as
$$
with skillNumber(skill, k) as 
      (select skill, row_number() over (order by skill) 
                               from   Skill_text),
Q as (select  skillNumber.k as outcome, PSkill.probability
           from  PSkill natural join skillNumber),
 c_probability as (
    select outcome, probability, sum(probability) 
    over 
    (partition by section order by outcome) as cum_probability  
    from (select *,0 as section from Q) as x
      ),
 F as (select min(outcome) from c_probability,(select random() a 
    from generate_series(1, n)) b 
    where b.a < cum_probability 
    group by b.a
      )


select floor(random() * (u1 - l1 + 1) + 1)::int pid, min::text skill
from F;
$$
language sql;




select * from PSkill_dist(100, 1, 160, 1, 5);


