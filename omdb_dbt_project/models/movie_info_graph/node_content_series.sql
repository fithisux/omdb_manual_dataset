{{ config(materialized='table') }}

with source_content_series_gold as (

    select

    *
    
    FROM {{ ref('content_series_gold') }}

)

select * from source_content_series_gold