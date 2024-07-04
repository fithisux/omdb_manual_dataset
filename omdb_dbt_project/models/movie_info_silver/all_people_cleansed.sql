{{ config(materialized='table') }}

with source_all_people_cleansed as (

    select

    *
    
    FROM {{ ref('all_people_with_types') }}

)

select * from source_all_people_cleansed