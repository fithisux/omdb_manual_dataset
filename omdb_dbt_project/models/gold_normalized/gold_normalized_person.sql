{{ config(materialized='table') }}


with source_person as (

    select

    id as person_id, name, birthday,deathday, gender
    
    FROM {{ ref('silver_cleansed_all_people') }}
), person_aliases as (
    select person_id, array_agg(name) as aliases
    FROM {{ref('silver_cleansed_all_people_aliases')}}
    group by person_id
)

select aa.*, bb.aliases 
from source_person aa
left join person_aliases bb
on aa.person_id = bb.person_id