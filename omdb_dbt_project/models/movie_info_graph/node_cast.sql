{{ config(materialized='table') }}


with source_all_casts_node as (

    select

    (content_id::varchar || '_' || person_id::varchar || '_' || job_id::varchar ) as cast_id, roles
    
    FROM {{ref('cast_gold')}}
)

select * from source_all_casts_node