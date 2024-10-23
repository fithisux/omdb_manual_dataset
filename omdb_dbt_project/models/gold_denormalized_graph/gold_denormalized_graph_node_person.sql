{{ config(materialized='table') }}

with source_all_people_node as (

    select

    person_id, name, birthday, deathday, gender
    
    FROM {{ ref('gold_denormalized_person') }}

)

select * from source_all_people_node