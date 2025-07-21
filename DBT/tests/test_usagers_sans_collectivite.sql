SELECT u.IdUsager
FROM {{ ref('stg_usager') }} u
LEFT JOIN {{ ref('stg_collectivite') }} c ON u.IdCollectivite = c.IdCollectivite
WHERE c.IdCollectivite IS NULL
