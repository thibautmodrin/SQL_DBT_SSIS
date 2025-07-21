SELECT c.IdCollectivite
FROM {{ ref('stg_collectivite') }} c
LEFT JOIN {{ ref('stg_usager') }} u ON c.IdCollectivite = u.IdCollectivite
GROUP BY c.IdCollectivite
HAVING COUNT(u.IdUsager) = 0
