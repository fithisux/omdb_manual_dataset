{{ config(materialized='table') }}

with source_all_people_aliases_gold as (

    select

    *
    
    FROM {{ ref('all_people_aliases_cleansed') }}

)

select * from source_all_people_aliases_gold