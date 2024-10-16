{{ config(materialized='table') }}

with source_source_all_content_gold as (

    select id, name, parent_id, date, 'movie' as content_type from {{ ref('all_movies_cleansed') }}
    UNION
    select id, name, parent_id, date, 'movieseries' as content_type from {{ ref('all_movieseries_cleansed') }}
    UNION
    select id, name, parent_id, date, 'series' as content_type from {{ ref('all_series_cleansed') }}
    UNION
    select id, name, parent_id, date, 'season' as content_type from {{ ref('all_seasons_cleansed') }}
    UNION
    select id, name, parent_id, date, 'episode' as content_type from {{ ref('all_episodes_cleansed') }}

)

select aa.*, bb.runtime, bb.revenue, bb.budget, bb.homepage, cc.vote_average, cc.votes_count 
from source_source_all_content_gold aa
left join {{ ref('movie_details_cleansed') }} bb on aa.id=bb.movie_id
left join {{ ref('all_votes_cleansed') }} cc on aa.id=cc.movie_id