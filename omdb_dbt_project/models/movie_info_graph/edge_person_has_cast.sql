{{ config(materialized='table') }}

with source_person_has_cast_edges as (

    select

     person_id as src_person_id, movie_id as dst_movie_id, person_id as dst_person_id, job_id as dst_job_id
    
    FROM {{ ref('all_casts_john') }}

)

select * from source_person_has_cast_edges