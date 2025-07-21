SELECT
    c.IdCollectivite,
    l.TypeDechet,
    COUNT(l.IdLevee) AS NombreLevees,
    SUM(l.PoidsKg) AS TotalPoidsKg,
    AVG(l.PoidsKg) AS PoidsMoyenParLevee
FROM {{ ref('stg_collectivite') }} c
LEFT JOIN {{ ref('stg_usager') }} u ON c.IdCollectivite = u.IdCollectivite
LEFT JOIN {{ ref('stg_levees') }} l ON u.IdUsager = l.IdUsager
GROUP BY c.IdCollectivite, l.TypeDechet
