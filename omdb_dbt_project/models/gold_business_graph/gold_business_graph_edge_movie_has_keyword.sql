{{ config(materialized='table') }}

with source_data as (

    select

    movie_id as src_movie_id, unnest(keywords) as dst_category_id
    
    FROM {{ ref('gold_business_movie') }}
)

select * from source_data