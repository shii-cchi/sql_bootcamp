-- Session 1
begin transaction;
set transaction isolation level serializable;

-- Session 2
begin transaction;
set transaction isolation level serializable;

-- Session 1
select * from pizzeria where name  = 'Pizza Hut';

-- Session 2
update pizzeria set rating = 3.0 where name = 'Pizza Hut';
commit;

-- Session 1
select * from pizzeria where name  = 'Pizza Hut';
commit;
select * from pizzeria where name  = 'Pizza Hut';

-- Session 2
select * from pizzeria where name  = 'Pizza Hut';