{{ config(materialized='table') }}

with source_content_has_cast_edges as (

    select

    content_id as src_content_id, (content_id::varchar || '_' || person_id::varchar || '_' || job_id::varchar ) as dst_cast_id
    
    FROM {{ ref('gold_business_cast') }}

)

select * from source_content_has_cast_edges