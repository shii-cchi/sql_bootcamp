SELECT
	person.name,
	menu.pizza_name,
	menu.price,
	ROUND(price * (1 - discount / 100), 2) AS discount_price,
	pizzeria.name AS pizzeria_name
FROM person_discounts
JOIN person ON person_discounts.person_id = person.id
JOIN pizzeria ON person_discounts.pizzeria_id = pizzeria.id
JOIN menu ON person_discounts.pizzeria_id = menu.pizzeria_id
ORDER BY name, pizza_name;