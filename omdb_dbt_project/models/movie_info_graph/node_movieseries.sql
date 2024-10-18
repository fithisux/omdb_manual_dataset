{{ config(materialized='table') }}

with source_content_movieseries_gold as (

    select

    *
    
    FROM {{ ref('content_movieseries_gold') }}

)

select * from source_content_movieseries_gold