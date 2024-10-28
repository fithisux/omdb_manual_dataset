{{ config(materialized='table') }}

with source_content_nodes as (

    select content_id, content_type, name, date, runtime, revenue, budget, homepage, votes_count, vote_average, last_update, countries
    from {{ ref('gold_normalized_content') }}

)

select * from source_content_nodes