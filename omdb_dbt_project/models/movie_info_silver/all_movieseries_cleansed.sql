{{ config(materialized='table') }}

with source_all_movieseries_cleansed as (

    select

    *
    
    FROM {{ ref('all_movieseries_with_types') }}
    where (parent_id is null or parent_id not in (select id from {{ ref('all_series_with_types') }}))

)

select * from source_all_movieseries_cleansed