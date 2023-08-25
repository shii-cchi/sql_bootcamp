SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id
LEFT JOIN person_order ON person_order.menu_id IN (
	SELECT menu.id
	FROM menu
	WHERE menu.pizzeria_id = person_visits.pizzeria_id
) AND person_order.person_id = person.id
WHERE person.name = 'Andrey' AND person_order.person_id IS NULL
ORDER BY pizzeria_name;