{{ config(materialized='table') }}

with source_all_movieseries as (

    select

    *
    
    FROM {{ ref('silver_casted_all_movieseries') }}
    where (parent_id is null or parent_id not in (select id from {{ ref('silver_casted_all_series') }}))

)

select * from source_all_movieseries