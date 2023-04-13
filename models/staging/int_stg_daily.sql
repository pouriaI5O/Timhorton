{{ config(materialized='ephemeral') }}
with coffee as ( select * from {{ ref('int_stg_coffee_daily') }}),
sandwich as ( select * from {{ ref('int_stg_sandwich_daily') }}),
final as (
    select * from coffee c
     JOIN sandwich s 
ON 
 c.date_c = s.date and
   c.branch_c=s.branch and

   c.shift_c=s.shift
order by c.date_c desc
)

select coffee_manned,year_c as year ,date_c as date ,shift_c as shift ,branch_c as branch,sandwich_manned from final 