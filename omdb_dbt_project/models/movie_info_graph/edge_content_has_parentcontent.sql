{{ config(materialized='table') }}

with source_content_has_parentcontent_edges as (

    select

    content_id as src_content_id, parent_id as dst_content_id
    
    FROM {{ ref('content_gold') }}

    where parent_id is not null

)

select * from source_content_has_parentcontent_edges