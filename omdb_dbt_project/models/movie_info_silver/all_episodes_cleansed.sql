{{ config(materialized='table') }}

with source_all_episodes_cleansed as (

    select

    *
    
    FROM {{ ref('all_episodes_with_types') }}
    where parent_id not in (select id from {{ ref('all_movieseries_cleansed') }} )

)

select * from source_all_episodes_cleansed