{{ config(materialized='table') }}

with source_content_series as (

    select

    content_id as id, parent_id
    
    FROM {{ ref('gold_normalized_content') }}

    where content_type='series'

)

select * from source_content_series