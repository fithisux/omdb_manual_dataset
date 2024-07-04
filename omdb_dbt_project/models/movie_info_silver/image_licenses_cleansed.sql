{{ config(materialized='table') }}

with source_image_licenses_cleansed as (

    select

    *
    
    FROM {{ ref('image_licenses_with_types') }}

)

select * from source_image_licenses_cleansed