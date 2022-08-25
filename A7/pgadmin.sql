-- --- Topological sort
-- -- create table V(node int);
-- -- create table E(source int, target int);


-- -- insert into V values
-- --    (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12);

-- -- insert into E values
-- --    (1,2),
-- --    (1,3),
-- --    (1,4),
-- --    (2,5),
-- --    (2,6),
-- --    (3,7),
-- --    (4,8),
-- --    (5,9),
-- --    (7,10),
-- --    (7,11),
-- --    (9,12);

-- -- with RECURSIVE toposort as (select target as t from E where source = 1
-- -- union all
-- -- select E.target from toposort, E
-- -- where toposort.t= E.source)
-- -- select * from toposort
-- -- ;

-- -- 8

-- -- create table data (index int, value int);

-- create or replace function insert_heap(x int)
-- returns void as
-- $$
-- declare 
-- max_index int;
-- curr int;
-- parent int;
-- p_val int;
-- c_val int;
-- begin
-- if not exists (select * from data )
-- then
-- 	insert into data values (1, x);
	
-- else
-- 	max_index := (select max(index) from data);
-- 	insert into data values (max_index+1, x);
-- 	curr := max_index+1;
-- 	parent := curr/2;
-- 	while (select value from data where index = curr) < (select value from data where index = parent)
-- 	loop
-- 		p_val := (select value from data where index = parent);
-- 		c_val := (select value from data where index = curr);
		
-- 		update data set value = p_val where index = curr;
-- 		update data set value = c_val where index = parent;
-- 		curr = parent;
-- 		parent := curr/2;
		
-- 	end loop;
	
-- end if;
-- end;
-- $$ language plpgsql;

-- create or replace function min_heapify(x int)
-- returns void as
-- $$
-- declare
-- max_index int;
-- curr int;
-- l int;
-- r int;
-- x_val int;
-- c_val int;

-- begin
-- if exists (select * from data)
-- then	
-- 	curr := x;
-- 	l := curr * 2;
-- 	r := curr * 2 + 1;
-- 	max_index := (select max(index) from data);
-- 	if r <= max_index and (select value from data where index=r) < (select value from data where index=curr)
-- 	then
-- 		curr = r;
-- 	end if;
-- 	if l <= max_index and (select value from data where index=l) < (select value from data where index=curr)
-- 	then
-- 		curr = l;
-- 	end if;

	
	
-- 	if curr != x
-- 	then
-- 		x_val := (select value from data where index = x);
-- 		c_val := (select value from data where index = curr);
		
-- 		update data set value = x_val where index = curr;
-- 		update data set value = c_val where index = x;
		
-- 		perform min_heapify(curr);
	
-- 	end if;
-- end if;
-- end;
-- $$  language plpgsql;


-- create or replace function remove()
-- returns int as
-- $$
-- declare
-- max_index int;
-- curr int;
-- l int;
-- r int;
-- pop int;
-- last_val int;

-- begin
-- 	if not exists(select * from data)
-- 	then
-- 		return(NULL);
-- 	else
-- 		max_index := (select max(index) from data);
-- 		pop := (select value from data where index = 1);
-- 		last_val := (select value from data where index = max_index);
-- 		update data set value = last_val where index = 1;
-- 		delete from data where index = max_index;
-- 		perform min_heapify(1);
-- 		return(pop);

-- 	end if;
-- end;
-- $$  language plpgsql;

-- -- create table sortedData(index int,value int);
-- DROP FUNCTION heapsort();
-- create or replace function heapsort()
-- returns void as
-- $$
-- declare
-- sort_idx int;
-- min_val int;
-- begin
-- drop table if exists temp;
-- create table temp(index int,value int);
-- insert into temp (select index, value from data);
-- sort_idx := 1;
-- delete from sorteddata;
-- while exists (select * from data)
-- 	loop
-- 		min_val := (select value from data where index=1);
-- 		delete from data where index = 1;
-- 		update data set index = index-1;
-- 		insert into sortedData values (sort_idx, min_val);
-- 		sort_idx := sort_idx+1;
-- 		perform min_heapify(0);
--  	end loop;
-- insert into data (select index, value from temp);
-- drop table if exists temp;

-- end;
-- $$  language plpgsql;


-- -- delete from data;
-- select heapsort();
-- -- select * from temp;



-- 9
-- create table Graph(source int,
--                    target int,
--                    weight int);

-- insert into Graph values
--   (0,1,2),
--   (1,0,2),
--   (0,4,10),
--   (4,0,10),
--   (1,3,3),
--   (3,1,3),
--   (1,4,7),
--   (4,1,7),
--   (2,3,4),
--   (3,2,4),
--   (3,4,5),
--   (4,3,5),
--   (4,2,6),
--   (2,4,6);
-- drop function Dijkstra;
-- create or replace function Dijkstra(start int)
-- returns table(target int, shortestDistance int, prev int, visited int) 
-- -- returns int 
-- as
-- $$
-- declare
-- 	v record;
-- 	curr int := start;
-- 	pathwt int;
-- 	iter int := 1;
-- begin
-- 	drop table if exists distances;
-- 	create table distances (target int, shortestDistance int default 9999, prev int, visited int default 0);
-- 	insert into distances (select distinct q.s, 9999, -1, 0 from (select g.source as s from Graph g
-- 															   union select g.target as s from Graph g) q);
-- 	-- update s
-- 	update distances d set shortestDistance = 0 where d.target = start;
-- 	while exists(select 1 from distances where distances.visited = 0)
-- 	loop
-- 		update distances d set visited = 1 where d.target = curr;
		
		
		
		
-- 		for v in (select g.target, g.weight from Graph g 
-- 		where g.source = 0 and g.target in (select d.target from  distances d where d.visited =0))
-- 			loop
-- 			pathwt := (select d.shortestDistance from distances d where d.target = curr);
-- 			if (select d.shortestDistance from distances d where d.target = v.target) > v.weight + pathwt
-- 			then
-- 				update distances d set shortestDistance = v.weight + pathwt where d.target = v.target;
-- 			else if (select d.shortestDistance from distances d where d.target = v.target) = 9999
-- 			then 
-- 			end if;
		
-- -- 		exit;
		
		
		
-- 		end loop;
		
-- -- 	if curr != start
-- -- 		then
-- 		curr := (
-- -- 			select q.target from (select d.target, min(d.shortestDistance) mind from distances d where d.visited = 0
-- -- 									  group by d.target) q, distances d
-- -- 				where d.shortestDistance = q.mind and d.target = q.target
-- 				select d.target from distances d where d.visited = 0 order by d.shortestDistance
-- 				limit 1);
-- -- 		end if;
-- -- 	if iter > 3
-- -- 	then 
-- -- 	return(curr);
-- -- 	end if;
-- -- 	iter := iter +1;
-- -- 	exit;
-- 	end loop;
	
-- 	return query select d.* from distances d;

-- end;
-- $$ language plpgsql;

-- select * from Dijkstra(0) ;
-- select g.* from Graph g 
-- 		where g.source = 0 and g.target in (select d.target from  Dijkstra(0) d where d.visited =0);
-- 		and g.source = 0;
-- select * from Graph g where  g.source = 0;



-- 10
-- drop function compute_wt_rec;
-- create or replace function compute_wt_rec(start int)
-- returns int as
-- $$
-- 	declare
-- 		r record;
-- 		q int;
-- 		w int;
--    	begin 
   
-- --       for r in select sid from partSubPart where pid = start
-- -- 	  loop
-- -- 	  	if r.sid in (select pid from basicPart)
-- -- 		then 
-- -- 			q := (select p.quantity from partSubPart p where p.sid = r.sid);
-- -- 			w := (select b.weight from basicPart b where b.pid = r.sid);
-- -- 			wt := q*w;
-- -- 			exit;
-- -- 		else
-- -- 			q := (select p.quantity from partSubPart p where p.sid = r.sid);
-- -- 			wt := wt + q*compute_wt_rec(r.sid, wt);
		
-- -- 		end if;

-- 		if (select count(pid) from partsubpart where pid = start) = 0 then
-- 		w:= (select weight from basicpart where pid = start);
-- 		   return (w);
-- 		else 
-- 		   return (select sum(quantity * compute_wt_rec(sid)) from partsubpart where pid = start); 
-- 		end if;
--    end;
-- $$ language plpgsql;

-- select compute_wt_rec(1);


-- 10 b

-- create or replace function compute_wt_nonrec(start int)
-- returns int as
-- $$
-- 	declare
-- 		r record;
-- 		q int;
-- 		wt int;
-- 		p int:= start;
--    	begin 
--    drop table if exists pweight;
--    create table pweight(p int, w int, flag boolean);
--    insert into pweight (select pid, weight, true from basicPart 
--    where pid = p union select sid, quantity, false from partSubPart where pid = p);

--    while (select count(*) from pweight where flag = false) > 0
--    loop
--    for r in select * from pweight where flag = false
--    loop
--    insert into pweight (
--       select ps.sid, ps.quantity * r.w, false from partSubPart ps where ps.pid = r.p
--       union
--       select bp.pid, bp.weight * r.w, true from basicPart bp where bp.pid = r.p 
--    );
--    delete from pweight pw where
--    	pw.p = r.p and pw.flag = false;
--    end loop;
--    end loop;

--    select into wt sum(w) from pweight;
--    drop table pweight;
--    return wt;
--    end;
-- $$ language plpgsql;


-- select compute_wt_nonrec(1);





-- drop table if exists Document cascade;
-- create table Document(doc int, words text[]);

-- insert into Document values
--   (1, '{"A", "B", "C", "D", "E"}'),
--   (2, '{"A", "B", "C", "E", "F"}'),
--   (3, '{"A", "E", "F"}'),
--   (4, '{"E", "A"}');

-- drop table if exists word_combinations;
-- -- drop table if exists word_combinations;
-- create or replace view singular as
--   select distinct unnest(words) as word from document;

-- create or replace function combinations(anyarray) 
-- returns setof anyarray as 
--     $$
--     with recursive x as (
--         select row_number() over (order by item) as row_no, item
--         from (select unnest($1) as item) unnested
--     ), q as (
--         select 1 as i, $1[1:0] arr
--         union all
--         select (i+1), case x
--             when 1 then array_append(q.arr,(select item from x where row_no = i))
--                 else q.arr end
--         from generate_series(0,1) x cross join q where i <= array_upper($1,1)
--     )
--     select q.arr as mods
--     from q 
--     where i = array_upper($1,1)+1;
--     $$ language sql;


-- create table word_combinations as select combinations(array_agg(word)) from singular;

-- create or replace function generatesets(t int)
-- returns table(set text[]) as
-- $$
-- declare tmp record;
-- begin
--    drop table if exists result;
--    create table result(sets text[],threshold int);
   
--    for tmp in (select * from word_combinations)
--    loop
--       insert into result select tmp.combinations, count(1) from   document where tmp.combinations<@ document.words;
--    end loop;
--    return query(select r.sets from result r where threshold >= t);
-- end;
-- $$ language plpgsql;

-- select * from generatesets(5) order by 1;
-- select * from generatesets(4) order by 1;
-- select * from generatesets(3) order by 1;
-- select * from generatesets(2) order by 1;
-- select * from generatesets(1) order by 1;
-- select * from generatesets(0) order by 1;


--13


-- create table R(a int); 
-- insert into R values (1),(2),(3),(4);

-- create table S(a int);
-- insert into S values (2),(4),(5);


-- drop table encodeRS;

-- create table encodeRS(key text, value jsonb);

-- insert into encodeRS
-- (select 'R' as key, jsonb_build_object('a', a) as value from R
-- union
-- select 'S' as key, jsonb_build_object('a', a) as value from S
-- order by 1);

-- -- map
-- create or replace function map_step(key text, value jsonb)
-- returns table(key jsonb, value text) 
-- as
-- $$
-- 	select value, key;
-- $$ language sql;
-- -- reduce
-- create or replace function reduce_step(key jsonb, values_array text[])
-- returns table(key text, value jsonb) 
-- as
-- $$
-- 	select 'R-S'::text, key 
-- 		where array['R'] <@ values_array and not array['S'] <@ values_array
-- 	UNION
-- 	select 'S-R'::text, key 
-- 		where array['S'] <@ values_array and not array['R'] <@ values_array;
-- $$ language sql;

-- with map as 
-- (select m.key, m.value  FROM encodeRS, 
-- 	lateral(select key, value FROM map_step(key, value)) m),
-- 		grouping_RS AS  (select key, array_agg(value) as value from map group by key), 
--  			reduce AS (select rd.key, rd.value from grouping_RS,
-- 				 lateral(SELECT key, value from reduce_step(key, value)) rd
-- )
-- select reduce.value->'a' as a from reduce order by 1;



-- 15 

-- drop table if exists R;
-- drop table if exists S;

-- create table R(A integer, B integer);
-- insert into R values (1, 2), (2, 4), (3, 6), (4,6);

-- create table S(A integer, B integer, C integer);
-- insert into S values (2, 7), (2, 5), (6, 4), (6, 8), (5, 7);


-- drop table if exists R cascade;
-- drop table if exists S cascade;
-- DROP FUNCTION if exists mapper;
-- DROP FUNCTION if exists reducer;
-- create table R(A integer, B integer);
-- insert into R values (1, 2), (2, 4), (3, 6), (4,6);

-- create table S(B integer, C integer);
-- insert into S values (2, 7), (2, 5), (6, 4), (6, 8), (5, 7);

-- drop table if exists encodeRS;

-- create table encodeRS(key text, value jsonb);

-- insert into encodeRS (select 'R' as key, jsonb_build_object('A', a, 'B', b) as value from R
-- 							union
-- 							select 'S' as key, jsonb_build_object('B', b, 'C', c) as value from S
-- 							order by 1);

-- CREATE OR REPLACE FUNCTION mapper(in_key text, in_value jsonb)
-- RETURNS TABLE(out_key jsonb, out_value jsonb) AS
-- $$
--   SELECT CASE WHEN in_key = 'R' THEN in_value - 'A'
--          ELSE in_value - 'C' END,
--          CASE WHEN in_key = 'R' THEN jsonb_build_object('A', in_value -> 'A')
--          ELSE jsonb_build_object('C', in_value -> 'C') END;
-- $$ LANGUAGE SQL;

-- CREATE OR REPLACE FUNCTION Reducer(in_key jsonb, in_values jsonb[])
-- RETURNS TABLE(out_key text, out_value jsonb) AS
-- $$
--    with R as (select distinct e->'A' as    a
--               from   unnest(in_values) e
--               ),
--         S as (select distinct e->'C' as    c
--               from   unnest(in_values) e
--               ),
--         R_cross_join_S as (select jsonb_build_object('A',r.a,'B',in_key -> 'B', 'C', s.c) as object
--                            from   R r, S s)
--    select 'R_cross_join_S', object from R_cross_join_S;;
-- $$ LANGUAGE SQL;

-- --test
-- with mapping_enc AS (
--     SELECT m.out_key, m.out_value 
--     FROM   encodingOfRandS, LATERAL(SELECT out_key, out_value FROM mapper(key, value)) m),
-- grouping_enc AS (
--     select  out_key, array_agg(out_value) as out_value  from mapping_enc
--     group by out_key),
-- reduce_enc AS (
--     select rdr.out_key, rdr.out_value
--     from   grouping_enc g, LATERAL(SELECT out_key, out_value FROM Reducer(g.out_key, g.out_value)) rdr)
-- select out_value->'A' as a, out_value->'B' as b, out_value-> 'C' as c from reduce_enc order by 1,2,3;




-- 17 a
-- drop table if exists R cascade;
-- drop table if exists S cascade;

-- create table R(K int, V int);
-- create table S(K int, W int);

-- insert into R values
--    (1,1),
--    (1,2),
--    (1,3),
--    (2,2),
--    (2,3),
--    (3,2),
--    (7,7);

-- insert into S values
--    (1,1),
--    (1,2),
--    (1,3),
--    (3,2),
--    (4,1),
--    (4,2),
--    (5,1),
--    (5,2),
--    (6,4),
--    (6,5);


-- drop type if exists cgtype;
-- create type cgtype as (Vs int[], Ws int[]);
-- drop view if exists cogroup;
-- create view cogroup as 
-- with vals as (select r.k from R r UNION select s.k from S s),
-- 	 Rkval as (select r.k, array_agg(r.v) as RV_values from R r group by (r.K)
-- 	union
-- 	select k.K,'{}' as
-- 			   RV_values from vals k where k.K not in (select r.K from R r)),
-- 	Skval  as
-- 		(select s.K, array_agg(s.w) as SW_values from S s group by (s.K)
-- 	union
-- 	select k.K,'{}' as
-- 		 SW_values from vals k where k.K not in (select s.K from S s))
-- select K, (RV_values, SW_values)::cgtype from Rkval natural join Skval;
-- select c.* from cogroup c;


-- b
-- select c.k, v 
-- 	from cogroup c,unnest((c.row).Vs) v
-- except
-- SELECT c.k, v
-- FROM   cogroup c, UNNEST((c.row).Vs) v
-- WHERE  (select count(1) from unnest((c.row).Ws) q) >= 1 order by 1;



--c

-- select distinct r.K,s.K 
-- 	from  cogroup r join cogroup s on ((r.row).Vs <@ (s.row).Ws
-- 		and not (r.row).Vs = '{}'
-- 		and not (s.row).Ws = '{}') 
-- 		order by 1,2; 




create or replace function topologicalsort() 
returns int[] as
$$
declare 
v integer;
topo int[] := ARRAY[]::int[];

begin
    drop table if exists tempE; 
	create table tempE(source int, target int);
	insert into tempE select * from E;
	
    while (select count(*) from tempE)>0
    loop
        v := (select source from tempE where source not in (select target from tempE) limit 1);
        topo := array_append(topo, v);
        delete from tempE where source = v;
    end loop;
   return topo;
end;
$$ language plpgsql;

select array_cat(topologicalsort(), (select array(select node from V where node not in  (select unnest(topologicalsort() )))));

-- CREATE table p(x int);
-- create table q(x int);
-- create table r(x int, y int);



-- SELECT P.X,
--     Q.X
-- FROM P P,
--     Q Q
-- WHERE EXISTS
--         (SELECT 1
--             FROM R R

--             WHERE R.X = P.X
--             EXCEPT SELECT 1
--             FROM R R
--             WHERE R.X = Q.X);

-- drop table r CASCADE;
-- create table R (a int, b int);
drop table if exists P;
drop table if exists R;
drop table if exists S;
create table P(a int);
create table R(a int, b int);
create table S(b int);

create or replace function SetOfIntegers(n int, l int, u int)
returns table (a int) as
$$
select floor(random() * (u-l+1) + l)::int as a
from generate_series(1,n)
group by (a) order by 1;
$$ language sql;

create or replace function BinaryRelationOverIntegers(n int, l_1 int, u_1 int, l_2 int, u_2 int)
returns table (a int, b int) as
$$
select distinct
floor(random() * (u_1-l_1+1) + l_1)::int as a,
floor(random() * (u_2-l_2+1) + l_2)::int as b
from generate_series(1,n);
$$ language sql;

delete from R;
delete from S;
delete from P;

insert into P select * from SetOfIntegers(1000,  2000, 200000);
insert into S select * from  SetOfIntegers(1000,  2000, 200000);
insert into R select * from BinaryRelationOverIntegers(100 , 2000, 200000, 2000, 200000);

-- explain analyze select distinct r1.x
-- from R r1, R r2, R r3, R r4
-- where r1.y = r2.x and r2.y = r3.x and r3.y = r4.x;

-- Explain analyze select distinct r1.x from R r1 natural join 
-- (select r2.x as y from R r2) r2 natural join 
-- (select r3.x as y from R r3) r3 natural join
-- (select r4.x as y from R r4) r4;


-- select p.x
-- from P p
-- where not exists (select 1
-- from R r
-- where r.x = p.x and
-- r.y not in (select s.y
-- from S s));

-- select q2.a from (select p.a from P p except select q1.a from
-- 				 (select r.a, r.b, p.a as pa from R r natural join P p except
-- 				  (select r.a, r.b, p.a as pa from P p natural join R r natural join S s)) q1) q2;




-- select p.a from P p except select q.a from 
-- (select s.b, p.a from s s cross join P p except select r.b, p.a from
--  P p natural join R r)q;
-- select * from S;

