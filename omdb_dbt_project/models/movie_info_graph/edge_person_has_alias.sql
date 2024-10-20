{{ config(materialized='table') }}

with source_person_alias_nodes as (

    select

    person_id as src_person_id, person_id as dst_person_id, name as dst_name
    
    FROM {{ ref('person_alias_gold') }}

)

select * from source_person_alias_nodes