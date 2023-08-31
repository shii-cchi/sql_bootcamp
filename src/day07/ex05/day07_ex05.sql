SELECT DISTINCT
    person.name
FROM person
JOIN person_order ON person.id = person_order.person_id
GROUP BY person.name
ORDER BY person.name;