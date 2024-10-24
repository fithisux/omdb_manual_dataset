{{ config(materialized='table') }}


with source_person as (

    select

    id as person_id, name, birthday, deathday, 
    case 
        when gender=0 then 'male' 
        when gender=1 then 'female'
        when gender=2 then 'nonbinary'
        when gender=3 then 'animal'
        else 'unspecified'
    end as gender
    
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