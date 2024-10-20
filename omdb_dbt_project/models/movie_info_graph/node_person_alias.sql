{{ config(materialized='table') }}

with source_person_alias_nodes as (

    select

    *
    
    FROM {{ ref('person_alias_gold') }}

)

select * from source_person_alias_nodes