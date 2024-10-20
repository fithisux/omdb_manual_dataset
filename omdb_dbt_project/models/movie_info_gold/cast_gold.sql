{{ config(materialized='table') }}


with source_cast_gold as (

    select

    distinct movie_id, person_id, job_id, role
    
    FROM {{ref('all_casts_cleansed')}}
), temp_result as (
    select

    movie_id, person_id, job_id, array_agg(role) as roles

    from source_cast_gold

    group by movie_id, person_id, job_id
)

select movie_id as content_id, person_id, job_id, roles from temp_result