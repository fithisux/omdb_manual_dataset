{{ config(materialized='table') }}

with source_image_ids as (

    select

    *
    
    FROM {{ ref('silver_casted_image_ids') }}

)

select * from source_image_ids