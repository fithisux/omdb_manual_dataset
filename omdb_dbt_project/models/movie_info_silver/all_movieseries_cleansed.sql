{{ config(materialized='table') }}

with source_all_movieseries_cleansed as (

    select

    *
    
    FROM {{ ref('all_movieseries_with_types') }}

)

select * from source_all_movieseries_cleansed