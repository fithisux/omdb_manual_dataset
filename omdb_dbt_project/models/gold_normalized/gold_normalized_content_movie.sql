{{ config(materialized='table') }}

with source_content_movie as (

    select

    content_id as id, parent_id
    
    FROM {{ ref('gold_normalized_content') }}

    Where 
        content_type='movie' 


)

select * from source_content_movie