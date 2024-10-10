{{ config(materialized='table') }}

with source_all_movies_cleansed as (

    select

    *
    
    FROM {{ ref('all_movies_with_types') }}

    Where 
        parent_id is null or parent_id in (select id from {{ ref('all_movieseries_cleansed') }} )

    UNION

    select

    id, name, parent_id, date
    
    FROM {{ ref('all_episodes_with_types') }}

    WHERE parent_id in (select id from {{ ref('all_movieseries_cleansed') }} )
    and id not in (select parent_id from {{ ref('all_seasons_with_types') }} )    


)

select * from source_all_movies_cleansed