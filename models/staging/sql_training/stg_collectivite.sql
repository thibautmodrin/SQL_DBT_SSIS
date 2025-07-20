WITH source AS (
    SELECT * FROM {{ source('sql_training', 'COLLECTIVITE') }}
)

SELECT
    IdCollectivite,
    NomCollectivite,
    COALESCE(Region, 'Inconnu') AS Region
FROM source
WHERE IdCollectivite IS NOT NULL
