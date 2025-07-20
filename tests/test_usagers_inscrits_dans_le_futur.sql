SELECT IdUsager, DateInscription
FROM {{ ref('stg_usager') }}
WHERE TRY_CAST(DateInscription AS DATE) > CURRENT_DATE
