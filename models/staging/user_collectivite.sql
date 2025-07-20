WITH collectivite AS (
    SELECT *
    FROM {{ source('sql_training', 'COLLECTIVITE') }}
),

usager AS (
    SELECT *
    FROM {{ source('sql_training', 'USAGER') }}
)

SELECT
    c.NomCollectivite,
    COUNT(u.IdUsager) AS TotalUsagers,
    SUM(CASE WHEN u.Actif = 1 THEN 1 ELSE 0 END) AS UsagersActifs
FROM collectivite c
LEFT JOIN usager u ON c.IdCollectivite = u.IdCollectivite
GROUP BY c.NomCollectivite
