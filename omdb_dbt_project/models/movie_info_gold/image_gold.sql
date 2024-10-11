{{ config(materialized='table') }}

with source_image_gold as (

    select

    iic.*, ilc.license_id, ilc.source, ilc.author
    
    FROM {{ ref('image_ids_cleansed') }} iic

    inner join {{ ref('image_licenses_cleansed')}} ilc on  iic.image_id=ilc.image_id

)

select * from source_image_gold