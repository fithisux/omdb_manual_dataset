{{ config(materialized='table') }}

with source_image as (

    select

    *
    FROM {{ ref('gold_denormalized_image') }} 

)

select * from source_image