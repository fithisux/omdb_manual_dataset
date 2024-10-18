{{ config(materialized='table') }}

with source_person_alias_nodes as (

    select

    *
    
    FROM {{ ref('all_people_aliases_gold') }}

)

select * from source_person_alias_nodes