{{ config(materialized='table') }}

with source_person as (

    select

    id as person_id, name, birthday,deathday, gender
    
    FROM {{ ref('silver_cleansed_all_people') }}

)

select * from source_person