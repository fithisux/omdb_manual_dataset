{{ config(materialized='table') }}

with source_has_movieseries as (

    select

    series_id as src_series_id, movieseries_id as dst_movieseries_id
    
    FROM {{ ref('gold_business_series') }}
    where movieseries_id is not null

)

select * from source_has_movieseries