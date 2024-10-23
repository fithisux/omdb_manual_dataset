{{ config(materialized='table') }}

with source_all_categories as (

    select

   *
    
    FROM {{ref('silver_casted_all_categories')}}
    where id in (select distinct category_id from {{ref('silver_casted_category_names')}})
)

select * from source_all_categories