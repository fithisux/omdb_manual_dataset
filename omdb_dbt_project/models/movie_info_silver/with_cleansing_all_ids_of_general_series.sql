{{ config(materialized='table') }}

with source_all_general_series_ids_cleansed as (


    select id from {{ ref('all_series_cleansed') }}
    UNION    
    select id from {{ ref('all_movies_cleansed') }}
    UNION    
    select id from {{ ref('all_seasons_with_types') }}

)

select * from source_all_general_series_ids_cleansed