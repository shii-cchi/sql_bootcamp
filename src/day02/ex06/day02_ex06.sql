SELECT
	menu.pizza_name,
	pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person.name = 'Anna' OR person.name = 'Denis'
ORDER BY menu.pizza_name, pizzeria_name;