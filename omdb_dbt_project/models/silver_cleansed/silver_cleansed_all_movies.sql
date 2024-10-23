{{ config(materialized='table') }}

with source_all_movies as (

    select

    *
    
    FROM {{ ref('silver_casted_all_movies') }}

    Where 
        (parent_id is null or parent_id in (select id from {{ ref('silver_casted_all_movieseries') }} ) )
        and (id not in (select parent_id from {{ ref('silver_casted_all_seasons') }} )) 

    UNION

    select

    id, name, parent_id, date
    
    FROM {{ ref('silver_casted_all_episodes') }}

    WHERE parent_id in (select id from {{ ref('silver_casted_all_movieseries') }} ) 


)

select * from source_all_movies