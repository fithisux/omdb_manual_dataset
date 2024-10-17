{{ config(materialized='table') }}

with source_all_people_aliases_cleansed as (

    select

    distinct person_id, name
    
    FROM {{ ref('all_people_aliases_with_types') }}
    where person_id in (select id from {{ ref('all_people_with_types') }})

)

select * from source_all_people_aliases_cleansed