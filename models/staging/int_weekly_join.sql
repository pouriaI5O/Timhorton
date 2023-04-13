{{ config(materialized='ephemeral') }}
with quantity as (select * from {{ ref('int_stg_tim_quantity')}} ),

weekly as (select * from {{ ref('int_stg_weekly')}}),

joined as ( select * from quantity q
 inner JOIN weekly w on 
 w.year_w=q.year and 
 w.week_w=q.week and 
w.branch_w=q.branch and 
w.shift_w= q.shift
)

select date,date AT TIME ZONE 'UTC' AS
Utc_Timestamp,branch_id, branch,shift,sandwich_sales_quantity,coffee_sales_quantity,
drive_thru_time,customer_score,coffee_sale_per_hour,
sandwich_sale_per_hour,coffee_manned,sandwich_manned
 from joined