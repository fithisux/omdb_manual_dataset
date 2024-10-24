{{ config(materialized='table') }}

with source_content_season as (

    select

    content_id as id, parent_id
    
    FROM {{ ref('gold_normalized_content') }}

    where content_type='season'

)

select * from source_content_season