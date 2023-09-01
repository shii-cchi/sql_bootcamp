-- Session 1
begin transaction;
set transaction isolation level read committed;

-- Session 2
begin transaction;
set transaction isolation level read committed;

-- Session 1
select sum(rating) from pizzeria;

-- Session 2
update pizzeria set rating = 1.0 where name = 'Pizza Hut';
commit;

-- Session 1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- Session 2
select sum(rating) from pizzeria;