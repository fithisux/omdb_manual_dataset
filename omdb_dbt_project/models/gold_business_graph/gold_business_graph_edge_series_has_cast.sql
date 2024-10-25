{{ config(materialized='table') }}

with source_content_has_cast_edges as (

    select

    content_id as src_series_id, (content_id::varchar || '_' || person_id::varchar || '_' || job_id::varchar ) as dst_cast_id
    
    FROM {{ ref('gold_business_cast') }} aa
    join {{ ref('gold_business_series') }} bb
    on aa.content_id=bb.series_id

)

select * from source_content_has_cast_edges