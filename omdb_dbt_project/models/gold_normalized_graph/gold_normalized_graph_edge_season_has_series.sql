{{ config(materialized='table') }}

with source_has_series as (

    select

    season_id as src_content_id, series_id as dst_content_id
    
    FROM {{ ref('gold_normalized_content_season') }}
    where series_id is not null

)

select * from source_has_series