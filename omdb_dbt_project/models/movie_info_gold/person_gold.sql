{{ config(materialized='table') }}

with source_person_gold as (

    select

    id as person_id, name, birthday,deathday, gender
    
    FROM {{ ref('all_people_cleansed') }}

)

select * from source_person_gold