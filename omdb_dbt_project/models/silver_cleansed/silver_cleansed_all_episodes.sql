{{ config(materialized='table') }}

with source_all_episodes as (

    select

    *
    
    FROM {{ ref('silver_casted_all_episodes') }}
    where (parent_id is null or parent_id not in (select id from {{ ref('silver_casted_all_movieseries') }}))

    UNION

    select id,name,parent_id, null as title_id, date
    from {{ ref('silver_casted_all_movieseries') }}
    where (parent_id in (select id from {{ ref('silver_casted_all_series') }}))

), all_episodes_imputed as (

    select

    id, parent_id, series_id as provided_series_id, 
    coalesce(parent_id, series_id) as series_id, 
    null as season_id, name, date
    
    FROM source_all_episodes
    where parent_id is null or parent_id in (select id from {{ ref('silver_cleansed_all_series') }})

    UNION

    select

    aa.id as id, aa.parent_id as parent_id, aa.series_id as provided_series_id, 
    coalesce(bb.parent_id, aa.series_id) as series_id, 
    aa.parent_id as season_id, aa.name, aa.date
    
    FROM source_all_episodes aa
    inner join {{ ref('silver_cleansed_all_seasons') }} bb on aa.parent_id=bb.id
)

select * from all_episodes_imputed