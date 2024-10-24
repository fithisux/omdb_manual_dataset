{{ config(materialized='table') }}

with source_person_has_cast_edges as (

    select

    person_id as src_person_id, (content_id::varchar || '_' || person_id::varchar || '_' || job_id::varchar ) as dst_cast_id
    
    FROM {{ ref('gold_normalized_cast') }}

)

select * from source_person_has_cast_edges