{{ config(materialized='table') }}

with source_person_alias_nodes as (

    select

    distinct name
    
    FROM {{ ref('gold_denormalized_person_alias') }}

)

select * from source_person_alias_nodes