DROP FUNCTION fnc_persons_male();
DROP FUNCTION fnc_persons_female();

CREATE OR REPLACE FUNCTION fnc_persons(in pgender varchar DEFAULT 'female')
RETURNS SETOF person AS
$$
SELECT *
FROM person
WHERE gender = pgender;
$$
LANGUAGE SQL;

SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();