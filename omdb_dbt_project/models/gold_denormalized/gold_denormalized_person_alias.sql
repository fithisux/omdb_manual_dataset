{{ config(materialized='table') }}

with source_person_alias as (

    select

    *
    
    FROM {{ ref('silver_cleansed_all_people_aliases') }}

)

select * from source_person_alias