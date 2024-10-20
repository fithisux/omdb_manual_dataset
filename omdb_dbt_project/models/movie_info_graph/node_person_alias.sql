{{ config(materialized='table') }}

with source_person_alias_nodes as (

    select

    distinct name
    
    FROM {{ ref('person_alias_gold') }}

)

select * from source_person_alias_nodes