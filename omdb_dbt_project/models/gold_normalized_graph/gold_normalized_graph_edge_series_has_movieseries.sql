{{ config(materialized='table') }}

with source_has_movieseries as (

    select

    series_id as src_content_id, movieseries_id as dst_content_id
    
    FROM {{ ref('gold_normalized_content_series') }}
    where movieseries_id is not null

)

select * from source_has_movieseries