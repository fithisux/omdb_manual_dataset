{{ config(materialized='table') }}

with source_person_alias_gold as (

    select

    *
    
    FROM {{ ref('all_people_aliases_cleansed') }}

)

select * from source_person_alias_gold