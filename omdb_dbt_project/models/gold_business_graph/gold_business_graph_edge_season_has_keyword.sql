{{ config(materialized='table') }}

with source_data as (

    select

    season_id as src_season_id, unnest(keywords) as dst_category_id
    
    FROM {{ ref('gold_business_season') }}
)

select * from source_data