{{ config(materialized='table') }}

with source_content_has_countries_edges as (

    select

    movie_id as src_movie_id, movie_id as dst_movie_id, country_code as dst_country_code
    
    FROM {{ ref('edge_has_country_gold') }}

)

select * from source_content_has_countries_edges