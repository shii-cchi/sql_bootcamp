WITH Days AS (
	SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS missing_date
)
SELECT Days.missing_date::date
FROM Days
LEFT JOIN person_visits ON person_visits.visit_date = Days.missing_date::date AND person_visits.person_id < 3
WHERE person_visits.person_id IS NULL
ORDER BY Days.missing_date;