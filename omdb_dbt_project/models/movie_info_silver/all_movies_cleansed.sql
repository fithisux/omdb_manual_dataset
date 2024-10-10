{{ config(materialized='table') }}

with source_all_movies_cleansed as (

    select

    *
    
    FROM {{ ref('all_movies_with_types') }}

    Where 
        parent_id is null or parent_id in (select id from {{ ref('all_movieseries_cleansed') }} )
        

)

select * from source_all_movies_cleansed