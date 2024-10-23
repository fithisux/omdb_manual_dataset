{{ config(materialized='table') }}

with source_image as (

    select

    image_id, object_id, object_type, image_version, license_id, source, author
    
    FROM {{ ref('gold_denormalized_image') }} 

)

select * from source_image