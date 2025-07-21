WITH source AS (
    SELECT * FROM {{ source('sql_training', 'USAGER') }}
)

SELECT
    IdUsager,
    Nom,
    Adresse,
    CAST(IdCollectivite AS INT) AS IdCollectivite,
    CASE WHEN Actif IN ('1', 'yes') THEN 1 ELSE 0 END AS Actif,
    TRY_TO_DATE(DateInscription, 'YYYY-MM-DD') AS DateInscription
FROM source
WHERE IdUsager IS NOT NULL
