{{ config(materialized='table') }}

with source_content_movieseries as (

    select

    id as movieseries_id
    
    FROM {{ ref('silver_cleansed_all_movieseries') }}
)

select * from source_content_movieseries