{{ config(materialized='table') }}

with source_all_people_node as (

    select

    *
    
    FROM {{ ref('person_gold') }}

)

select * from source_all_people_node