SELECT object_name
FROM (
    SELECT pizza_name AS object_name, 'menu' AS object_type
    FROM menu
    UNION ALL
    SELECT name AS object_name, 'person' AS object_type
    FROM person
) AS data_and_type
ORDER BY
    CASE WHEN object_type = 'person' THEN 1 ELSE 2 END,
    object_name;