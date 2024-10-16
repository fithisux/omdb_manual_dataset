{{ config(materialized='table') }}


with source_all_casts_gold as (

    select

    distinct movie_id, person_id, job_id, role
    
    FROM {{ref('all_casts_cleansed')}}
), temp_result as (
    select

    movie_id, person_id, job_id, array_agg(role) as roles

    from source_all_casts_gold

    group by movie_id, person_id, job_id
)

select * from temp_result