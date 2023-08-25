SELECT pizzeria_name
FROM (
    SELECT pizzeria.name AS pizzeria_name,
           SUM(CASE WHEN person.gender = 'male' THEN 1 ELSE 0 END) AS male_order,
           SUM(CASE WHEN person.gender = 'female' THEN 1 ELSE 0 END) AS female_order
    FROM pizzeria
	JOIN menu ON pizzeria.id = menu.pizzeria_id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id
    GROUP BY pizzeria_name
) AS count_order
WHERE (male_order > 0 AND female_order = 0) OR (male_order = 0 AND female_order > 0)
ORDER BY pizzeria_name;