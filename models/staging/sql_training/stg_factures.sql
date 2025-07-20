WITH source AS (
    SELECT * FROM {{ source('sql_training', 'FACTURES') }}
)

SELECT
    IdFacture,
    CAST(IdUsager AS INT) AS IdUsager,
    TRY_CAST(MontantHT AS FLOAT) AS MontantHT,
    TRY_CAST(MontantTTC AS FLOAT) AS MontantTTC,
    TRY_TO_DATE(DateEmission, 'YYYY-MM-DD') AS DateEmission,
    CASE WHEN Payee IN ('1', 'yes') THEN 1 ELSE 0 END AS Payee
FROM source
WHERE IdFacture IS NOT NULL
