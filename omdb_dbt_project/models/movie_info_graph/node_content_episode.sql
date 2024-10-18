{{ config(materialized='table') }}

with source_content_episode_nodes as (

    select
    *
    FROM {{ ref('content_episode_gold') }}
)

select * from source_content_episode_nodes