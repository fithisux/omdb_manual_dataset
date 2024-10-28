{{ config(materialized='table') }}

with source_content_has_cast_edges as (

    select

    bb.content_id as from, (aa.content_id::varchar || '_' || aa.person_id::varchar || '_' || aa.job_id::varchar ) as to
    
    FROM {{ ref('gold_business_cast') }} aa
    join {{ ref('gold_business_content') }} bb
    on aa.content_id=bb.content_id

)

select * from source_content_has_cast_edges