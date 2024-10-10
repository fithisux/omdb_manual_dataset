{{ config(materialized='table') }}

with source_all_episodes_cleansed as (

    select

    *
    
    FROM {{ ref('all_episodes_with_types') }}

    union

    select

    xxx.id as id, xxx.name as name, xxx.parent_id as parent_id, null as series_id, xxx.date as date
    
    FROM {{ ref('all_movieseries_with_types') }} xxx where xxx.parent_id in (select id FROM {{ ref('all_episodes_with_types') }}) 

)

select * from source_all_episodes_cleansed