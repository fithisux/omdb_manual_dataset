{{ config(materialized='table') }}

with source_content as (

    select content_id, content_type, date, runtime, revenue, budget, 
    homepage, vote_average, votes_count, last_update, countries, abstracts, content_links, person_links,
    refs, trailers, aliases
    FROM {{ref('gold_business_content')}}
)
   
select * from source_content