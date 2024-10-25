{{ config(materialized='table') }}

with source_content as (

    select movie_id, date, runtime, revenue, budget, 
    homepage, vote_average, votes_count, last_update, countries, abstracts, content_links, person_links,
    refs, trailers, aliasings
    FROM {{ref('gold_business_movie')}}
)
   
select * from source_content