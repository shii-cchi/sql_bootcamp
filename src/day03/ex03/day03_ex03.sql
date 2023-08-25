SELECT pizzeria_name
FROM (
    SELECT pizzeria.name AS pizzeria_name,
           SUM(CASE WHEN person.gender = 'male' THEN 1 ELSE 0 END) AS male_visit,
           SUM(CASE WHEN person.gender = 'female' THEN 1 ELSE 0 END) AS female_visit
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person_visits.person_id = person.id
    GROUP BY pizzeria_name
) AS count_visit
WHERE male_visit > female_visit OR female_visit > male_visit
ORDER BY pizzeria_name;