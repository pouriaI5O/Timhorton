{{ config(
    materialized='table'
)}}

with coffee as ( select * from {{ ref('int_stg_coffee_weekly') }}),
sandwich as ( select * from {{ ref('int_stg_sandwich_weekly') }}),
final as (
    select * from coffee c
     JOIN sandwich s 
ON c.year_c=s.year and 
 c.week_c = s.week and
   c.branch_c=s.branch and

   c.shift_c=s.shift
order by c.week_c desc
)

select coffee_manned,year_c as year_w,
week_c as week_w,shift_c as shift_w ,branch_c as branch_w,sandwich_manned from final 