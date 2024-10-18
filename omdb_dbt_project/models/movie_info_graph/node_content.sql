{{ config(materialized='table') }}

with source_content_nodes_gold as (

    select *  from {{ ref('content_gold') }}

)

select * from source_content_nodes_gold