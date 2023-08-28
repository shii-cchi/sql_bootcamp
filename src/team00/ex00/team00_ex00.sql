CREATE TABLE node (
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INTEGER NOT NULL,
    PRIMARY KEY (point1, point2)
);

INSERT INTO node (point1, point2, cost)
VALUES
    ('A', 'B', 10),
    ('B', 'A', 10),
    ('A', 'C', 15),
    ('C', 'A', 15),
	('A', 'D', 20),
    ('D', 'A', 20),
	('B', 'C', 35),
    ('C', 'B', 35),
	('B', 'D', 25),
	('D', 'B', 25),
    ('C', 'D', 30),
    ('D', 'C', 30);

WITH RECURSIVE Route AS (
	SELECT 
		ARRAY [point1] AS route, 
	    point2 AS current_point, 
		cost AS total_cost,
	    1 AS count
	FROM node
	WHERE point1 = 'A'
    UNION
    SELECT
		ARRAY_APPEND(route, current_point) AS route, 
		point2 AS current_point, 
        total_cost + cost AS total_cost,
		count + 1 AS count
	FROM Route
	JOIN node ON current_point = node.point1
	WHERE count < 4 AND route @> ARRAY [current_point] = FALSE),
	
    routes AS (
		SELECT 
			total_cost, 
			array_append(route, current_point) AS tour
        FROM Route
        WHERE count = 4 AND current_point = 'A')
		
SELECT *
FROM routes
WHERE total_cost = (SELECT MIN(total_cost) FROM routes)
ORDER BY total_cost, tour;   