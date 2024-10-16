{{ config(materialized='table') }}

with source_content_movie_gold as (

    select

    id, parent_id
    
    FROM {{ ref('content_gold') }}

    Where 
        content_type='movie' 


)

select * from source_content_movie_gold