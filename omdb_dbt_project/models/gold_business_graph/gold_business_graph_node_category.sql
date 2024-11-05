{{ config(materialized='table') }}

with source_category as (

    select
        category_id,
        names
    from {{ ref('gold_business_category') }}
)

select *
from source_category
