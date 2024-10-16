{{ config(materialized='table') }}

with source_content_series_gold as (

    select

    content_id as id, parent_id
    
    FROM {{ ref('content_gold') }}

    where content_type='series'

)

select * from source_content_series_gold