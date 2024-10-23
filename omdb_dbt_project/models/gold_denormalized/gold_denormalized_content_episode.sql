{{ config(materialized='table') }}

with source_content_episode as (

    select
    id, provided_series_id as series_id, season_id
    FROM {{ ref('silver_cleansed_all_episodes') }}
)

select * from source_content_episode