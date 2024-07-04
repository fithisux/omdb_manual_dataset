{{ config(materialized='table') }}

with source_all_people_aliases_cleansed as (

    select

    *
    
    FROM {{ ref('all_people_aliases_with_types') }}

)

select * from source_all_people_aliases_cleansed