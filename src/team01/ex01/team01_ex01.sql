INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH balance_with_actual_currency AS (
    SELECT
        user_id,
        money,
        currency_id,
        CASE
            WHEN (SELECT MAX(currency.updated) FROM currency WHERE balance.currency_id = id AND updated <= balance.updated) IS NOT NULL
            THEN (SELECT MAX(currency.updated) FROM currency WHERE balance.currency_id = id AND updated <= balance.updated)
            ELSE (SELECT MIN(currency.updated) FROM currency WHERE balance.currency_id = id AND updated > balance.updated)
        END AS updated
    FROM balance
)

SELECT
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
	currency.name AS currency_name,
	balance_with_actual_currency.money * currency.rate_to_usd AS currency_in_usd
FROM balance_with_actual_currency
JOIN currency ON (balance_with_actual_currency.updated = currency.updated AND balance_with_actual_currency.currency_id = currency.id)
LEFT JOIN "user" ON balance_with_actual_currency.user_id = "user".id

ORDER BY name DESC, lastname ASC, currency_name ASC;