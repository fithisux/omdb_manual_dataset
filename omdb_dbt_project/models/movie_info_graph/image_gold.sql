{{ config(materialized='table') }}

with source_image_nodes as (

    select

    *
    
    FROM {{ ref('image_gold') }}

)

select * from source_image_nodes