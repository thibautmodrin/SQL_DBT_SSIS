SELECT *
FROM {{ ref('mart_collectivite_performance') }}
WHERE UsagersActifs = 0 AND TotalPoidsKg > 0
