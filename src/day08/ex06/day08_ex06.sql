-- Session 1
begin transaction;
set transaction isolation level repeatable read;

-- Session 2
begin transaction;
set transaction isolation level repeatable read;

-- Session 1
select sum(rating) from pizzeria;

-- Session 2
update pizzeria set rating = 5 where name = 'Pizza Hut';
commit;

-- Session 1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- Session 2
select sum(rating) from pizzeria;