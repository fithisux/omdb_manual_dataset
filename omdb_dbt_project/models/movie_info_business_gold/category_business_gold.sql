{{ config(materialized='table') }}

with source_category_gold as (

    select *
    FROM {{ref('category_gold')}}
), category_named as (
    select category_id, array_agg(ROW(name, language_iso_639_1)::omdb_name_type) as names
    FROM {{ref('category_name_gold')}}
    group by category_id
)

select aa.*, bb.names
from source_category_gold aa
left join category_named bb
on aa.category_id = bb.category_id