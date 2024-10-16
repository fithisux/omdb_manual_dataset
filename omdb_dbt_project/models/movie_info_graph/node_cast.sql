{{ config(materialized='table') }}


with source_all_casts_node as (

    select

    movie_id, person_id, job_id, roles
    
    FROM {{ref('all_casts_gold')}}
)

select * from source_all_casts_node