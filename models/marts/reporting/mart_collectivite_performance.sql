SELECT
    cu.IdCollectivite,
    cu.NomCollectivite,
    cu.Region,
    cu.TotalUsagers,
    cu.UsagersActifs,
    cd.TotalPoidsKg,
    cf.TotalMontantHT,
    cf.TotalMontantTTC,
    (cf.NombreFacturesPayees * 1.0 / NULLIF(cf.NombreFactures, 0)) AS TauxPaiement
FROM {{ ref('mart_collectivite_usagers') }} cu
LEFT JOIN (
    SELECT
        c.IdCollectivite,
        SUM(f.MontantHT) AS TotalMontantHT,
        SUM(f.MontantTTC) AS TotalMontantTTC,
        COUNT(f.IdFacture) AS NombreFactures,
        SUM(f.Payee) AS NombreFacturesPayees
    FROM {{ ref('stg_collectivite') }} c
    LEFT JOIN {{ ref('stg_usager') }} u ON c.IdCollectivite = u.IdCollectivite
    LEFT JOIN {{ ref('stg_factures') }} f ON u.IdUsager = f.IdUsager
    GROUP BY c.IdCollectivite
) cf ON cu.IdCollectivite = cf.IdCollectivite
LEFT JOIN (
    SELECT
        c.IdCollectivite,
        SUM(l.PoidsKg) AS TotalPoidsKg
    FROM {{ ref('stg_collectivite') }} c
    LEFT JOIN {{ ref('stg_usager') }} u ON c.IdCollectivite = u.IdCollectivite
    LEFT JOIN {{ ref('stg_levees') }} l ON u.IdUsager = l.IdUsager
    GROUP BY c.IdCollectivite
) cd ON cu.IdCollectivite = cd.IdCollectivite
