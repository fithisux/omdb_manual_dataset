{{ config(materialized='table') }}

with source_all_people_node as (

    select

    person_id, name, birthday, deathday, gender
    
    FROM {{ ref('person_gold') }}

)

select * from source_all_people_node