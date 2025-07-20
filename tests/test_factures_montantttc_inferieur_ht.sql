SELECT IdFacture, MontantHT, MontantTTC
FROM {{ ref('stg_factures') }}
WHERE TRY_CAST(MontantTTC AS FLOAT) < TRY_CAST(MontantHT AS FLOAT)
