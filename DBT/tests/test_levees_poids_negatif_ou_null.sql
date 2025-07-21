SELECT IdLevee, PoidsKg
FROM {{ ref('stg_levees') }}
WHERE TRY_CAST(PoidsKg AS FLOAT) <= 0 OR PoidsKg IS NULL
