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

)

select * from source_all_episodes_cleansed