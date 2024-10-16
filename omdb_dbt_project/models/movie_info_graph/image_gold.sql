{{ config(materialized='table') }}

with source_image_nodes as (

    select

    image_id, object_id, object_type, image_version, license_id, source, author
    
    FROM {{ ref('image_gold') }}

)

select * from source_image_nodes