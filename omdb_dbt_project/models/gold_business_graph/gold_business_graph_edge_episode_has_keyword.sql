{{ config(materialized='table') }}

with source_data as (

    select

    episode_id as src_episode_id, unnest(keywords) as dst_category_id
    
    FROM {{ ref('gold_business_episode') }}
)

select * from source_data