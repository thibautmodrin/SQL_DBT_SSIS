SELECT
    c.IdCollectivite,
    c.NomCollectivite,
    COUNT(f.IdFacture) AS NombreFactures,
    SUM(f.MontantHT) AS TotalMontantHT,
    SUM(f.MontantTTC) AS TotalMontantTTC
FROM {{ ref('stg_collectivite') }} c
LEFT JOIN {{ ref('stg_usager') }} u ON c.IdCollectivite = u.IdCollectivite
LEFT JOIN {{ ref('stg_factures') }} f ON u.IdUsager = f.IdUsager
GROUP BY c.IdCollectivite, c.NomCollectivite
