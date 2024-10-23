{{ config(materialized='table') }}

with source_all_people_aliases as (

    select

    distinct person_id, name
    
    FROM {{ ref('silver_casted_all_people_aliases') }}
    where person_id in (select id from {{ ref('silver_casted_all_people') }})

)

select * from source_all_people_aliases