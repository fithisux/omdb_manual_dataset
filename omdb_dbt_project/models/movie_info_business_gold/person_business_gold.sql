{{ config(materialized='table') }}

with source_person_gold as (

    select *
    FROM {{ref('person_gold')}}
), person_aliases as (
    select person_id, array_agg(name) as aliases
    FROM {{ref('person_alias_gold')}}
    group by person_id
)

select aa.*, bb.aliases 
from source_person_gold aa
left join person_aliases bb
on aa.person_id = bb.person_id