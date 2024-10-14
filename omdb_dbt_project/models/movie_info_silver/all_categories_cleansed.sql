{{ config(materialized='table') }}

with source_all_categories_cleansed as (

    select

   *
    
    FROM {{ref('all_categories_with_types')}}
    where id in (select distinct category_id from {{ref('category_names_cleansed')}})
)

select * from source_all_categories_cleansed