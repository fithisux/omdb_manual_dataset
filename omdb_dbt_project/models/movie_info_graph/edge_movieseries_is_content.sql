{{ config(materialized='table') }}

with source_movieseries_nodes as (

    select

    id as src_content_id, id as dst_content_id, 'movieseries' as dst_content_type
    
    FROM {{ ref('content_movieseries_gold') }}

)

select * from source_movieseries_nodes