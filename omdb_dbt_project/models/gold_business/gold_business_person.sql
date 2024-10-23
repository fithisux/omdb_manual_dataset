{{ config(materialized='table') }}

with source_person as (

    select *
    FROM {{ref('gold_denormalized_person')}}
), person_aliases as (
    select person_id, array_agg(name) as aliases
    FROM {{ref('gold_denormalized_person_alias')}}
    group by person_id
)

select aa.*, bb.aliases 
from source_person aa
left join person_aliases bb
on aa.person_id = bb.person_id