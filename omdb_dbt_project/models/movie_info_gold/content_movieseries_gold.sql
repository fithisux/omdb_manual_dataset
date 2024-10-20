{{ config(materialized='table') }}

with source_content_movieseries_gold as (

    select

    content_id as id
    
    FROM {{ ref('content_gold') }}
    where content_type='movieseries'

)

select * from source_content_movieseries_gold