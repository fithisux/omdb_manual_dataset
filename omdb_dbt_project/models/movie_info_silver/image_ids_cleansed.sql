{{ config(materialized='table') }}

with source_image_ids_cleansed as (

    select

    *
    
    FROM {{ ref('image_ids_with_types') }}

)

select * from source_image_ids_cleansed