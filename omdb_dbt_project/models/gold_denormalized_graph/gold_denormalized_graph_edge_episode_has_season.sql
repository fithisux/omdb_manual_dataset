{{ config(materialized='table') }}

with source_has_series as (

    select

    id as src_id, season_id as dst_id
    
    FROM {{ ref('gold_denormalized_content_episode') }}
    where season_id is not null

)

select * from source_has_series