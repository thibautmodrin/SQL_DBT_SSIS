SELECT
    c.IdCollectivite,
    c.NomCollectivite,
    c.Region,
    COUNT(DISTINCT u.IdUsager) AS TotalUsagers,
    SUM(CASE WHEN u.Actif = 1 THEN 1 ELSE 0 END) AS UsagersActifs
FROM {{ ref('stg_collectivite') }} c
LEFT JOIN {{ ref('stg_usager') }} u ON c.IdCollectivite = u.IdCollectivite
GROUP BY c.IdCollectivite, c.NomCollectivite, c.Region
