WITH eur AS (
    SELECT *FROM currency WHERE name = 'EUR'
    ORDER BY updated DESC
    LIMIT 1
),
usd AS (
    SELECT *FROM currency WHERE name = 'USD'
    ORDER BY updated DESC
    LIMIT 1
),
jpy AS (
    SELECT *FROM currency WHERE name = 'JPY'
    ORDER BY updated DESC
    LIMIT 1
),
actual_currency AS (
    SELECT * FROM eur
    UNION
    SELECT * FROM usd
    UNION
    SELECT * FROM jpy
)

SELECT
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    balance.type AS type,
    SUM(balance.money) AS volume,
    COALESCE(actual_currency.name, 'not defined') AS currency_name,
    COALESCE(actual_currency.rate_to_usd, 1) AS last_rate_to_usd,
    SUM(COALESCE(balance.money, 1)) * COALESCE(actual_currency.rate_to_usd, 1) AS total_volume_in_usd
FROM "user"
FULL JOIN balance ON balance.user_id = "user".id
FULL JOIN actual_currency ON balance.currency_id = actual_currency.id
GROUP BY "user".name, "user".lastname, balance.type, actual_currency.name, actual_currency.rate_to_usd
ORDER BY name DESC, lastname ASC, type ASC;