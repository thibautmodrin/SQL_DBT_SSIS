SELECT
    u.IdUsager,
    u.Nom,
    COUNT(l.IdLevee) AS NombreLevees,
    SUM(l.PoidsKg) AS TotalPoidsKg
FROM {{ ref('stg_usager') }} u
LEFT JOIN {{ ref('stg_levees') }} l ON u.IdUsager = l.IdUsager
GROUP BY u.IdUsager, u.Nom
