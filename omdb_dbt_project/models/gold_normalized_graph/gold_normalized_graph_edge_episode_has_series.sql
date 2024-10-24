{{ config(materialized='table') }}

with source_has_series as (

    select

    id as src_id, series_id as dst_id
    
    FROM {{ ref('gold_normalized_content_episode') }}
    where series_id is not null

)

select * from source_has_series