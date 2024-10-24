{{ config(materialized='table') }}

with source_category as (

    select *
    FROM {{ref('gold_business_category')}}
), category_named as (
    select category_id, array_agg(ROW(name, language_iso_639_1)::omdb_name_type) as names
    FROM {{ref('gold_normalized_category_name')}}
    group by category_id
)

select*
from source_category