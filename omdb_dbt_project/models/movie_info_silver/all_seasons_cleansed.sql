{{ config(materialized='table') }}

with source_all_seasons_cleansed as (

    select

    *
    
    FROM {{ ref('all_seasons_with_types') }}
    
    UNION

    select

    id, name, parent_id, date
    
    FROM {{ ref('all_movies_with_types') }}

    where id in (select parent_id from {{ ref('all_seasons_with_types') }} )    



)

select * from source_all_seasons_cleansed