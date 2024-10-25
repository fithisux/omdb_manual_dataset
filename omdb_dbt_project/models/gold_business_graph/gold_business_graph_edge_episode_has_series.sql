{{ config(materialized='table') }}

with source_has_series as (

    select

    episode_id as src_episode_id, series_id as dst_series_id
    
    FROM {{ ref('gold_business_episode') }}
    where series_id is not null

)

select * from source_has_series