{{ config(materialized='table') }}

with source_content_nodes as (

    select content_id, name, date, runtime, revenue, budget, homepage, votes_count, vote_average, last_update, countries
    from {{ ref('gold_normalized_content') }}

), content_types as (
    select series_id as content_id, 'series' as content_type from {{ ref('gold_normalized_content_series') }}
    UNION
    select movieseries_id as content_id,'movieseries' as content_type from {{ ref('gold_normalized_content_movieseries') }}
    UNION
    select movie_id as content_id,'movie' as content_type from {{ ref('gold_normalized_content_movie') }}
    UNION
    select season_id as content_id, 'season' as content_type from {{ ref('gold_normalized_content_season') }}
    UNION
    select episode_id as content_id, 'episode' as content_type from {{ ref('gold_normalized_content_episode') }}
)

select aa.*, bb.content_type 
from source_content_nodes aa
inner join content_types bb
on aa.content_id=bb.content_id