{{ config(materialized='table') }}

with source_all_movie_and_series_ids_cleansed as (

    select id as movie_id from {{ ref('all_movies_cleansed') }}
    UNION
    select movie_id from {{ ref('all_movie_aliases_iso_cleansed') }}
    UNION
    select id as movie_id from {{ ref('all_movieseries_cleansed') }}
    UNION
    select id as movie_id from {{ ref('all_series_cleansed') }}
    UNION
    select id as movie_id from {{ ref('all_seasons_cleansed') }}
    UNION
    select id as movie_id from {{ ref('all_episodes_cleansed') }}

)

select * from source_all_movie_and_series_ids_cleansed