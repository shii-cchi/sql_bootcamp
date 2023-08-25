SELECT
	menu.pizza_name,
	menu.price,
	pizzeria.name AS pizzeria_name,
	person_visits.visit_date
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Kate' AND menu.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;