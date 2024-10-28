{{ config(materialized='table') }}

with source_has_movieseries as (

    select

    content_id as from, parent_id as to
    
    FROM {{ ref('gold_business_content') }}
    where parent_id is not null and content_type='series'

)

select * from source_has_movieseries