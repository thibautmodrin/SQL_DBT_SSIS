SELECT IdFacture, DateEmission, Payee
FROM {{ ref('stg_factures') }}
WHERE Payee = 0 
  AND TRY_CAST(DateEmission AS DATE) < DATEADD(day, -180, CURRENT_DATE)
