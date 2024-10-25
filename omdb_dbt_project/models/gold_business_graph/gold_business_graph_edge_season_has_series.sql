{{ config(materialized='table') }}

with source_has_series as (

    select

    season_id as src_season_id, series_id as dst_series_id
    
    FROM {{ ref('gold_business_season') }}
    where series_id is not null

)

select * from source_has_series