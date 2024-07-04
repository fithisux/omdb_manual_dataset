{{ config(materialized='table') }}

with source_people_links_cleansed as (

    select

    *
    
    FROM {{ ref('people_links_with_types') }}
)

select * from source_people_links_cleansed