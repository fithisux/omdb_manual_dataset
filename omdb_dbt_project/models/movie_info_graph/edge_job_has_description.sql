with source_job_description_edge as (

    select

    job_id as src, job_id as dst_job_id, name as dst_name, language_iso_639_1 as dst_language_iso_639_1
    
    FROM {{ ref('job_gold') }}

)

select * from source_job_description_edge