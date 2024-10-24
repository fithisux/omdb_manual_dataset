{{ config(materialized='table') }}

with source_content as (

    select content_id, parent_id, date, content_type, runtime, revenue, budget, 
    homepage, vote_average, votes_count, last_update, countries, abstracts, content_links, person_links,
    refs, trailers, aliasings
    FROM {{ref('gold_business_content')}}
)
   
select * from source_content