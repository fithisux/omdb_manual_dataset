{{ config(materialized='table') }}

with source_has_movieseries as (

    select

    id as src_id, id as dst_id
    
    FROM {{ ref('content_series_gold') }}
    where parent_id is not null

)

select * from source_has_movieseries