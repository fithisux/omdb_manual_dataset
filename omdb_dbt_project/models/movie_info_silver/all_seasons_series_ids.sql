{{ config(materialized='table') }}

with source_all_seasons_series_ids as (

    select id from {{ ref('all_series_cleansed') }}
    UNION
    select id from {{ ref('all_seasons_cleansed') }}

)

select * from source_all_seasons_series_ids