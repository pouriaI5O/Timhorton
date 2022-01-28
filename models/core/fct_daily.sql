{{ config(
    materialized='table'
)}}

select date,date AT TIME ZONE 'UTC'  AS
       Utc_Timestamp,branch,shift,
       coffee_manned,sandwich_manned,
    CASE WHEN branch='TH-ON-Leamington-1642-255-Talbot' then 1642 
      WHEN branch='TH-ON-Leamington-324-250-Erie' then 324 
      WHEN branch='TH-ON-Leamington-562-185-Erie' then 562 
      WHEN branch='TH-ON-Essex-1903-9-Maidstone' then 1903 ELSE 0 END AS branch_id
     from {{ ref('int_stg_daily') }}