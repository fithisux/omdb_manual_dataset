{{ config(materialized='table') }}

with source_content_series as (

    select

    id as series_id, parent_id as movieseries_id
    
    FROM {{ ref('silver_cleansed_all_series') }}

)

select * from source_content_series