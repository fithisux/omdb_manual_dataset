{{ config(materialized='table') }}

with source_data as (

    select

    movieseries_id as src_movieseries_id, unnest(categories) as dst_category_id
    
    FROM {{ ref('gold_business_movieseries') }}
)

select * from source_data