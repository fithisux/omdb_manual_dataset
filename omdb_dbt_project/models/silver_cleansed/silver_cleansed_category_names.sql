{{ config(materialized='table') }}

with source_category_names as (

    select

    distinct category_id, name, language_iso_639_1
    
    FROM {{ ref('silver_casted_category_names') }}

    where language_iso_639_1 is not null

)

select * from source_category_names