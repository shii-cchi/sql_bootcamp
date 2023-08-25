SELECT DISTINCT name AS pizzeria_name, rating
FROM pizzeria
LEFT JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
WHERE visit_date IS NULL;