{{ config(materialized='table') }}

with source_has_series as (

    select

    episode_id as src_episode_id, season_id as dst_season_id
    
    FROM {{ ref('gold_business_episode') }}
    where season_id is not null

)

select * from source_has_series