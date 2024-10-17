{{ config(materialized='table') }}

with source_person_link_nodes as (

    select

    *
    
    FROM {{ ref('people_links_gold') }}
)

select * from source_person_link_nodes