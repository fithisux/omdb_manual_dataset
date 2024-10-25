{{ config(materialized='table') }}

with source_source_all_content as (

    select *
    FROM {{ref('gold_business_content')}}
), series as (
    select *
    FROM {{ref('gold_normalized_content_series')}}
)

select 
aa.date, aa.runtime, aa.revenue, aa.budget, aa.homepage, aa.vote_average, aa.votes_count, aa.last_update,
aa.countries, aa.keywords, aa.categories,
aa.abstracts, aa.content_links, aa.person_links, aa.refs, aa.trailers, aa.aliasings, kk.*
from source_source_all_content aa
inner join series kk on aa.content_id=kk.series_id