{{ config(materialized='table') }}

with source_content_updates_gold as (

    select

    *
    
    FROM {{ ref('movie_content_updates_cleansed') }}

)

select * from source_content_updates_gold