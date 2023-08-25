SELECT d::date AS missing_date
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS d
LEFT JOIN person_visits ON person_visits.visit_date = d::date AND person_visits.person_id < 3
WHERE person_visits.person_id IS NULL
ORDER BY missing_date;