{{ config(materialized='table') }}

with source_all_episodes_cleansed as (

    select

    *
    
    FROM {{ ref('all_episodes_with_types') }}
    where (parent_id is null or parent_id not in (select id from {{ ref('all_movieseries_with_types') }}))

    UNION

    select id,name,parent_id, null as title_id, date
    from {{ ref('all_movieseries_with_types') }}
    where (parent_id in (select id from {{ ref('all_series_with_types') }}))

), all_episodes_amended as (

    select

    id, parent_id, series_id as provided_series_id, 
    coalesce(parent_id, series_id) as series_id, 
    null as season_id, name, date
    
    FROM source_all_episodes_cleansed
    where parent_id is null or parent_id in (select id from {{ ref('all_series_cleansed') }})

    UNION

    select

    aa.id as id, aa.parent_id as parent_id, aa.series_id as provided_series_id, 
    coalesce(bb.parent_id, aa.series_id) as series_id, 
    aa.parent_id as season_id, aa.name, aa.date
    
    FROM source_all_episodes_cleansed aa
    inner join {{ ref('all_seasons_cleansed') }} bb on aa.parent_id=bb.id
)

select * from all_episodes_amended