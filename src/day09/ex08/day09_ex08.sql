CREATE OR REPLACE FUNCTION fnc_fibonacci (IN pstop INTEGER DEFAULT 10)
RETURNS SETOF INTEGER LANGUAGE SQL AS 
$$
WITH RECURSIVE Fib_series(num1, num2) AS (
    VALUES (0, 1)
    UNION ALL
    SELECT GREATEST(num1, num2), num1 + num2 AS num1 FROM Fib_series
    WHERE num2 < pstop
)
SELECT num1 FROM Fib_series;
$$;

SELECT * FROM fnc_fibonacci(100);

SELECT * FROM fnc_fibonacci();