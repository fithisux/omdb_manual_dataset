{{ config(materialized='table') }}

with source_image_licenses as (

    select

    *
    
    FROM {{ ref('silver_casted_image_licenses') }}

)

select * from source_image_licenses