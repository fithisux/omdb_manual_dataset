{{ config(materialized='table') }}

with source_category_name_nodes as (

    select

    distinct name, language_iso_639_1
    
    FROM {{ ref('gold_normalized_category_name') }}

)

select * from source_category_name_nodes