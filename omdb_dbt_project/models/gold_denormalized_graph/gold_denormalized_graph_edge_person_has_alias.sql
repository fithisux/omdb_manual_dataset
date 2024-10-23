{{ config(materialized='table') }}

with source_person_alias_nodes as (

    select

    person_id as src_person_id, name as dst_name
    
    FROM {{ ref('gold_denormalized_person_alias') }}

)

select * from source_person_alias_nodes