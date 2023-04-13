{{ config(materialized='ephemeral') }}
 select * from  {{ ref('int_weekly_join') }}