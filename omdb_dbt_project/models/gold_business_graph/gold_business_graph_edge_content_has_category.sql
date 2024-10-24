{{ config(materialized='table') }}

with source_data as (

    select

    content_id as src_content_id, unnest(categories) as dst_category_id
    
    FROM {{ ref('gold_business_content') }}
)

select * from source_data