{{ config(materialized='table') }}

with source_content_nodes_gold as (

    select content_id, name, date, content_type, runtime, revenue, budget, homepage, votes_count, vote_average, last_update 
    from {{ ref('content_gold') }}

)

select * from source_content_nodes_gold