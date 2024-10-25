{{ config(materialized='table') }}

with source_data as (

    select

    series_id as src_series_id, unnest(categories) as dst_category_id
    
    FROM {{ ref('gold_business_series') }}
)

select * from source_data