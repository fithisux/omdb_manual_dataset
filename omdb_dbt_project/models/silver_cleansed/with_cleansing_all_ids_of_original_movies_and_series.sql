{{ config(materialized='table') }}

with source_all_movie_and_series_ids as (

    select id as movie_id from {{ ref('silver_cleansed_all_movies') }}
    UNION
    select id as movie_id from {{ ref('silver_cleansed_all_movieseries') }}
    UNION
    select id as movie_id from {{ ref('silver_cleansed_all_series') }}
    UNION
    select id as movie_id from {{ ref('silver_cleansed_all_seasons') }}
    UNION
    select id as movie_id from {{ ref('silver_cleansed_all_episodes') }}

)

select * from source_all_movie_and_series_ids