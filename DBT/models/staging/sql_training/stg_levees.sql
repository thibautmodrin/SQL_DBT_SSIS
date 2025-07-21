WITH source AS (
    SELECT * FROM {{ source('sql_training', 'LEVEES') }}
)

SELECT
    IdLevee,
    CAST(IdUsager AS INT) AS IdUsager,
    TRY_TO_DATE(DateLevee, 'YYYY-MM-DD') AS DateLevee,
    TRY_CAST(PoidsKg AS FLOAT) AS PoidsKg,
    TypeDechet
FROM source
WHERE IdLevee IS NOT NULL
