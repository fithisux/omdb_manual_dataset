{{ config(materialized='table') }}

with source_data as (

    select

    content_id as from, unnest(categories) as to
    
    FROM {{ ref('gold_business_content') }}
)

select * from source_data