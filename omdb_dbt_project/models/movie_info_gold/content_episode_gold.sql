{{ config(materialized='table') }}

with source_content_episode_gold as (

    select

    id, series_id as provided_series_id, 
    coalesce(parent_id, series_id) as series_id, 
    null as season_id
    
    FROM {{ ref('all_episodes_cleansed') }}
    where parent_id is null or parent_id in (select id from {{ ref('all_series_cleansed') }})

    UNION

    select

    aa.id as id, aa.series_id as provided_series_id, 
    coalesce(bb.parent_id, aa.series_id) as series_id, 
    aa.parent_id as season_id
    
    FROM {{ ref('all_episodes_cleansed') }} aa
    inner join {{ ref('all_seasons_cleansed') }} bb on aa.parent_id=bb.id
)

select * from source_content_episode_gold