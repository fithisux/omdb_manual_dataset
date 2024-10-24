{{ config(materialized='table') }}

with source_image as (

    select

    iic.*, ilc.license_id, ilc.source, ilc.author
    
    FROM {{ ref('silver_cleansed_image_ids') }} iic

    inner join {{ ref('silver_cleansed_image_licenses')}} ilc on  iic.image_id=ilc.image_id

)

select * from source_image