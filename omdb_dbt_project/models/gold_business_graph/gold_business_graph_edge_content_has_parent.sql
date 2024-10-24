{{ config(materialized='table') }}

with source_has_series as (

    select

    content_id as src_content_id, parent_id as dst_content_id
    
    FROM {{ ref('gold_business_content') }}
    where parent_id is not null

)

select * from source_has_series