{{ config(materialized='table') }}

with source_all_series_cleansed as (

    select

    *
    
    FROM {{ ref('all_series_with_types') }}

)

select * from source_all_series_cleansed