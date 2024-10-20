{{ config(materialized='table') }}

with source_person_link_nodes as (

    select

    *
    
    FROM {{ ref('content_person_link_gold') }}
)

select * from source_person_link_nodes