SELECT
    u.IdUsager,
    u.Nom,
    COUNT(f.IdFacture) AS NombreFactures,
    SUM(f.MontantHT) AS TotalMontantHT,
    SUM(f.MontantTTC) AS TotalMontantTTC,
    MAX(f.DateEmission) AS DerniereDateFacture
FROM {{ ref('stg_usager') }} u
LEFT JOIN {{ ref('stg_factures') }} f ON u.IdUsager = f.IdUsager
GROUP BY u.IdUsager, u.Nom
