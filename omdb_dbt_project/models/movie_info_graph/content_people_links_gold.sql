{{ config(materialized='table') }}

with source_content_people_links_gold as (

    select

    *
    
    FROM {{ ref('people_links_cleansed') }}
)

select * from source_content_people_links_gold