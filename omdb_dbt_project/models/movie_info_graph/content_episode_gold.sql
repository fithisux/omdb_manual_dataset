{{ config(materialized='table') }}

with source_content_episode_gold as (

    select
    id, provided_series_id as series_id, season_id
    FROM {{ ref('all_episodes_cleansed') }}
)

select * from source_content_episode_gold