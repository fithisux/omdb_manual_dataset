{{ config(materialized='table') }}

with source_content_episode_gold as (

    select

    id, parent_id
    
    FROM {{ ref('content_gold') }}
    where content_type='episode'
)

select * from source_content_episode_gold