{{ config(materialized='table') }}

with source_content_season_gold as (

    select

    content_id as id, parent_id
    
    FROM {{ ref('content_gold') }}

    where content_type='season'

)

select * from source_content_season_gold