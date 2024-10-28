{{ config(materialized='table') }}


with source_cast as (

    select

    distinct movie_id, person_id, job_id, coalesce(role, '') as role
    
    FROM {{ref('silver_cleansed_all_casts')}}
), temp_result as (
    select

    movie_id, person_id, job_id, array_agg(role) as roles

    from source_cast

    group by movie_id, person_id, job_id
)

select movie_id as content_id, person_id, job_id, roles from temp_result