{{ config(materialized='table') }}

with source_category_names_cleansed as (

    select

    distinct category_id, name, language_iso_639_1
    
    FROM {{ ref('category_names_with_types') }}

    where language_iso_639_1 is not null

)

select * from source_category_names_cleansed