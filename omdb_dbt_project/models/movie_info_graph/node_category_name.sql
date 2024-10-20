{{ config(materialized='table') }}

with source_category_name_nodes as (

    select

    category_id name, language_iso_639_1
    
    FROM {{ ref('category_name_gold') }}

)

select * from source_category_name_nodes