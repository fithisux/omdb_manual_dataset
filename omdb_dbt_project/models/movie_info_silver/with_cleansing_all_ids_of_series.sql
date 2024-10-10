{{ config(materialized='table') }}

with source_all_series_ids_cleansed as (


    select id from {{ ref('all_series_cleansed') }}
    UNION
    select id from {{ ref('all_seasons_cleansed') }}

)

select * from source_all_series_ids_cleansed