{{ config(materialized='table') }}

with source_content_trailers_gold as (

    select

    *
    
    FROM {{ ref('trailers_cleansed') }}
)

select * from source_content_trailers_gold