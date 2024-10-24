{{ config(materialized='table') }}

with source_source_all_content as (

    select id as content_id, name, parent_id, date, 'movie' as content_type from {{ ref('silver_cleansed_all_movies') }}
    UNION
    select id as content_id, name, parent_id, date, 'movieseries' as content_type from {{ ref('silver_cleansed_all_movieseries') }}
    UNION
    select id as content_id, name, parent_id, date, 'series' as content_type from {{ ref('silver_cleansed_all_series') }}
    UNION
    select id as content_id, name, parent_id, date, 'season' as content_type from {{ ref('silver_cleansed_all_seasons') }}
    UNION
    select id as content_id, name, parent_id, date, 'episode' as content_type from {{ ref('silver_cleansed_all_episodes') }}
), content_countries as (
    select movie_id, array_agg(country_code) as countries
    FROM {{ref('silver_cleansed_movie_countries')}}
    group by movie_id
), content_keywords as (
    select movie_id, array_agg(category_id) as keywords
    FROM {{ref('silver_cleansed_movie_keywords')}}
    group by movie_id
), content_categories as (
    select movie_id, array_agg(category_id) as categories
    FROM {{ref('silver_cleansed_movie_categories')}}
    group by movie_id
)

select aa.*, bb.runtime, bb.revenue, bb.budget, bb.homepage, cc.vote_average, cc.votes_count, dd.last_update, ee.countries, ff.keywords,gg.categories
from source_source_all_content aa
left join {{ ref('silver_cleansed_movie_details') }} bb on aa.content_id=bb.movie_id
left join {{ ref('silver_cleansed_all_votes') }} cc on aa.content_id=cc.movie_id
left join {{ ref('silver_cleansed_movie_content_updates') }} dd on aa.content_id=dd.movie_id
left join content_countries ee on aa.content_id=ee.movie_id
left join content_keywords ff on aa.content_id=ff.movie_id
left join content_categories gg on aa.content_id=gg.movie_id
