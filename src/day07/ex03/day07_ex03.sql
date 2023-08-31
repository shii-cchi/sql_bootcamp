WITH Visits AS (
    SELECT
        pizzeria.name,
        COUNT(person_visits.pizzeria_id) AS visit_count
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
),
Orders AS (
	SELECT
        pizzeria.name,
        COUNT(menu.pizzeria_id) AS order_count
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
)
SELECT
	COALESCE(Visits.name, Orders.name) AS name,
    COALESCE(visit_count, 0) + COALESCE(order_count, 0) AS total_count
FROM Visits
FULL JOIN Orders ON Visits.name = Orders.name
ORDER BY total_count DESC, name ASC;