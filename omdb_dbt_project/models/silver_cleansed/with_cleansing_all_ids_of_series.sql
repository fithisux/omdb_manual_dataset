{{ config(materialized='table') }}

with source_all_series_ids as (


    select id from {{ ref('silver_cleansed_all_series') }}
    UNION
    select id from {{ ref('silver_cleansed_all_seasons') }}

)

select * from source_all_series_ids