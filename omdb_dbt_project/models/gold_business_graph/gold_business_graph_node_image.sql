{{ config(materialized='table') }}

with source_image as (

    select

    *
    FROM {{ ref('gold_business_image') }} 

)

select * from source_image