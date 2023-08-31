SELECT *
FROM (
    SELECT
        pizzeria.name,
        COUNT(person_visits.pizzeria_id) AS count,
        'visit' AS action_type
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY count DESC
    LIMIT 3
) AS visits
UNION
SELECT *
FROM (
    SELECT
        pizzeria.name,
        COUNT(menu.pizzeria_id) AS count,
        'order' AS action_type
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY count DESC
    LIMIT 3
) AS orders
ORDER BY action_type ASC, count DESC;