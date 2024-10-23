{{ config(materialized='table') }}

with source_content_movieseries as (

    select

    content_id as id
    
    FROM {{ ref('gold_denormalized_content') }}
    where content_type='movieseries'

)

select * from source_content_movieseries