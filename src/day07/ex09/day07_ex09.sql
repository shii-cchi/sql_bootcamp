SELECT DISTINCT 
    person.address,
    ROUND(MAX(person.age::numeric) - (MIN(person.age::numeric) / MAX(person.age::numeric)), 2) AS formula,
    ROUND(AVG(person.age::numeric), 2) AS average,
    (MAX(person.age::numeric) - (MIN(person.age::numeric) / MAX(person.age::numeric))) > AVG(person.age::numeric)                                                         AS comparison
FROM person
GROUP BY person.address
ORDER BY person.address;